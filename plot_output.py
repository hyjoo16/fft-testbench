import matplotlib.pyplot as plt
import argparse

def read_and_plot(file_path, skip_lines):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # Ensure the number of lines to skip is valid
    if skip_lines >= len(lines):
        raise ValueError("Number of lines to skip exceeds the total number of lines in the file")

    # Get the line after skipping the specified number of lines
    data_line = lines[skip_lines].strip()

    # Convert the line of data into a list of floats
    try:
        data = list(map(float, data_line.split()))
    except ValueError as e:
        raise ValueError("Could not convert data to floats: {}".format(e))

    # Plot the data
    # N = len(data)
    # frequencies = [float(i + 1)/ N for i in range(N)]
    plt.stem(data, 'b', markerfmt='bo', basefmt='r-')
    plt.xlabel('Index')
    plt.ylabel('Power')
    plt.title('FFT results')
    plt.show()

def main():
    parser = argparse.ArgumentParser(description='Read a file, skip lines, and plot the next line')
    parser.add_argument('file_path', type=str, help='Path to the input text file')
    parser.add_argument('skip_lines', type=int, help='Number of lines to skip')

    args = parser.parse_args()

    try:
        read_and_plot(args.file_path, args.skip_lines)
    except Exception as e:
        print("An error occurred: {}".format(e))

if __name__ == "__main__":
    main()
