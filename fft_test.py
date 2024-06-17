import numpy as np
import matplotlib.pyplot as plt

def generate_sinusoidal(frequency, amplitude, phase_shift, time_interval):
    
    t = np.linspace(time_interval[0], time_interval[1], int(1000*(time_interval[1]-time_interval[0])))
    signal = amplitude * np.sin(2 * np.pi * frequency * t + phase_shift)
    return t, signal

def generate_dc(amplitude, time_interval):
    
    t = np.linspace(time_interval[0], time_interval[1], int(1000*(time_interval[1]-time_interval[0])))
    signal = np.full(t.shape, amplitude)
    return t, signal

def sample_signal(input_signal, time_values, sampling_rate):
    
    sampling_interval = 1 / float(sampling_rate)
    sampled_time_values = np.arange(time_values[0], time_values[-1], sampling_interval)
    sampled_signal_values = np.interp(sampled_time_values, time_values, input_signal)
    return sampled_time_values, sampled_signal_values

def perform_fft(signal, sampling_rate):

    fft_result = np.fft.fft(signal)
    frequencies = np.fft.fftfreq(len(signal), d=1/float(sampling_rate))
    amplitudes = np.abs(fft_result)
    return frequencies, amplitudes

def plot_time_domain(ax, time_values, signal_values, sampled_time_values, sampled_signal_values):
    
    ax.plot(time_values, signal_values, label='Original Signal')
    ax.scatter(sampled_time_values, sampled_signal_values, color='red', label='Sampled Signal')
    ax.set_title('Time-Domain Signal')
    ax.set_xlabel('Time (ns)')
    ax.set_ylabel('Amplitude')
    ax.legend()
    ax.grid(True)

def plot_frequency_domain(ax, frequencies, amplitudes):
    
    ax.stem(frequencies, amplitudes, 'b', markerfmt='bo', basefmt='r-')
    ax.set_title('Frequency-Domain Signal')
    ax.set_xlabel('Frequency (GHz)')
    ax.set_ylabel('Amplitude')
    ax.grid(True)
