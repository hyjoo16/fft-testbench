import random
import numpy as np
import matplotlib.pyplot as plt
import fft_test as fft
import argparse

# Define the number of test cases
num_tests = 100

# set argument parser
parser = argparse.ArgumentParser(description='input options')

parser.add_argument(
    '--option', 
    choices=['dc', 'sine', 'custom'], 
    required=True, 
    help='Choose which input to generate : dc, sine, custom'
)

### Formating LVDS inputs

def integer_to_5bit_unsigned(sampled_values):

    scaled_values = np.round((sampled_values - np.min(sampled_values)) / (np.max(sampled_values) - np.min(sampled_values)) * 31)
    quantized_values = np.clip(scaled_values, 0, 31)
    
    return quantized_values.astype(np.uint8)

def integer_to_5bit_binary(integer_value):
    
    integer_value = max(0, min(integer_value, 31))
    binary_string = format(integer_value, '05b')
    
    return binary_string

def integers_to_5bit_binary_file(integer_values, filename):
    # format integer values as lvds input
    with open(filename, 'w') as file:
        for j in range(num_tests):
            for i in range(0, len(integer_values), 4):
                line_values = integer_values[i:i+4]
                binary_strings = [integer_to_5bit_binary(value) for value in line_values]
                file.write(''.join(binary_strings) + '\n')

### BRAM initalization file 
def generate_coe_file(filename, data, radix=16, bit_width=8, iterations=5):
    """
    Generate a .coe file to initialize FPGA BRAM with hexadecimal values, repeating the data vector for a given number of iterations.

    :param filename: Name of the output .coe file (string)
    :param data: List of data values to initialize the BRAM (list of integers)
    :param radix: The number system (default 16 for hexadecimal)
    :param bit_width: Number of bits per value (default 8 bits, 2 hexadecimal digits)
    :param iterations: Number of times to repeat the data vector
    """
    # Create the radix line
    coe_content = "memory_initialization_radix={};\n".format(radix)
    coe_content += "memory_initialization_vector=\n"

    # Prepare the data to be repeated
    if radix == 16:
        # Hexadecimal formatting with leading zeros for each value (2 hexadecimal digits)
        formatted_data = [format(val, '0{}X'.format(bit_width // 4)) for val in data]
    else:
        formatted_data = [str(val) for val in data]  # Other formats if needed

    # Repeat the data vector for the specified number of iterations
    repeated_data = formatted_data * iterations

    # Join the repeated data, separating each value by a comma and adding a semicolon at the end
    coe_content += ",\n".join(repeated_data) + ";\n"

    # Write the coe_content to the .coe file
    with open(filename, "w") as coe_file:
        coe_file.write(coe_content)

    print("COE file '{}' generated successfully with {} iterations.".format(filename, iterations))


### Formating FFT inputs 

def integer_to_8bit_signed(sampled_values):

    scaled_values = np.round(sampled_values)
    quantized_values = np.clip(scaled_values, -128, 127)
    
    return quantized_values.astype(np.int)

def integer_to_8bit_binary(n):
    
    integer_value = max(-128, min(n, 127))
    if n >= 0:
        binary_string = format(integer_value, '08b')
    else: 
        binary_string = format((n + (1 << 8)) % (1 << 8), '08b')
    
    return binary_string

def integers_to_8bit_binary_file(integer_values, window_size, stride, filename):
    # format integer values as fft inputs 
    with open(filename, 'w') as file:
        for j in range(num_tests):
            for i in range(0, len(integer_values) - stride, stride):
                line_values = integer_values[i:i+window_size]
                binary_strings = [integer_to_8bit_binary(value) for value in line_values]
                file.write(''.join(binary_strings) + '\n')

### example codes 

def dc_example():
    print("*** Generate example fft output with dc signal values ***")

    amplitude = 127
    sampling_rate = 8  # GHz
    N = 32 
    time_interval = (0, N/sampling_rate)  # ns

    t_values, dc_signal = fft.generate_dc(amplitude, time_interval)

    sampled_t_values, sampled_signal = fft.sample_signal_no_interp(dc_signal, t_values, sampling_rate)

    # generate refernce results & plot 
    frequencies, amplitudes = fft.perform_fft(sampled_signal, sampling_rate)
    sampled_q = integer_to_8bit_signed(sampled_signal)
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 10))
    fft.plot_time_domain(ax1, t_values, dc_signal, sampled_t_values, sampled_q)
    fft.plot_frequency_domain(ax2, frequencies, amplitudes)

    plt.tight_layout()
    plt.show()

    # write fft input to file
    integers_to_8bit_binary_file(sampled_q, 32, 16,'./fft_input.txt')

    # write lvds input to file
    sampled_q = integer_to_5bit_unsigned(sampled_signal)
    integers_to_5bit_binary_file(sampled_q, './lvds_input.txt')



def sine_example():
    print("*** Generate example fft output with sinusoidal signal values ***")

    # generate signals
    frequency = 1  # GHz
    amplitude = 64
    phase_shift = 0  # Radians
    sampling_rate = 8  # GHz
    N = 32 
    time_interval = (0, N/sampling_rate)  # ns

    t_values, sinusoidal_signal = fft.generate_sinusoidal(frequency, amplitude, phase_shift, time_interval)

    frequency2 = 2  
    amplitude2 = 32  
    phase_shift2 = 0  
    _, sinusoidal_signal2 = fft.generate_sinusoidal(frequency2, amplitude2, phase_shift2, time_interval)

    frequency3 = 3  
    amplitude3 = 96  
    phase_shift3 = 0  
    _, sinusoidal_signal3 = fft.generate_sinusoidal(frequency3, amplitude3, phase_shift3, time_interval)


    combined_signal = sinusoidal_signal + sinusoidal_signal2 + sinusoidal_signal3
    
    # sample the signal
    sampled_t_values, sampled_signal = fft.sample_signal(combined_signal, t_values, sampling_rate)

    # generate refernce results & plot 
    frequencies, amplitudes = fft.perform_fft(sampled_signal, sampling_rate)
    sampled_q = integer_to_8bit_signed(sampled_signal)
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(12, 10))
    fft.plot_time_domain(ax1, t_values, combined_signal, sampled_t_values, sampled_q)
    fft.plot_frequency_domain(ax2, frequencies, amplitudes)

    plt.tight_layout()
    plt.show()

    # write fft input to file
    integers_to_8bit_binary_file(sampled_q, 32, 16,'./fft_input.txt')

    # write lvds input to file 
    sampled_q = integer_to_5bit_unsigned(sampled_signal)
    integers_to_5bit_binary_file(sampled_q, './lvds_input.txt')

def custom_function():
    print("*** Generate example fft output with user generated signal values ***")
    # TODO: add your own generation code
    frequency = 1 # GHz
    amplitude = 127
    sampling_rate = 8  # GHz
    N = 32 
    time_interval = (0, N/sampling_rate)  # ns
    pulse_width = (1/frequency)*0.5

    t_values, rec_signal = fft.generate_rectangular_pulse(amplitude, pulse_width, frequency, time_interval)
    print(rec_signal)
    sampled_t_values, sampled_signal = fft.sample_signal_no_interp(rec_signal, t_values, sampling_rate)

    frequencies, amplitudes = fft.perform_fft(sampled_signal, sampling_rate)
    sampled_q = integer_to_8bit_signed(sampled_signal)
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(6, 5))
    fft.plot_time_domain(ax1, t_values, rec_signal, sampled_t_values, sampled_signal)
    fft.plot_frequency_domain(ax2, frequencies, amplitudes)

    plt.tight_layout()
    plt.show()

    # write fft input to file
    integers_to_8bit_binary_file(sampled_q, 32, 16,'./fft_input.txt')

    # write fft input to BRAM coe file
    generate_coe_file('./fft_input.coe',sampled_q)

    # write lvds input to file 
    sampled_q = integer_to_5bit_unsigned(sampled_signal)
    integers_to_5bit_binary_file(sampled_q, './lvds_input.txt')


def main():

    args = parser.parse_args()

    if args.option == 'custom':
        custom_function()
    elif args.option == 'dc':
        dc_example()
    elif args.option == 'sine':
        sine_example()


if __name__ == "__main__":
    main()
