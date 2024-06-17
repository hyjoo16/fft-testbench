# fft-testbench
Test bench of a verilog-implemented Fast Fourier Transform (FFT) module

## Structure
- tb
  - fft
    - Contains verilog implementation of FFT module
  - fft_tb
    - test bench for testing only the FFT module
    - input binary file format: 20-bit (5-bit * 4) per line
      ```
      01111111111110010010
      10000011010001100000
      10000111111110010010
      ...
      ```
  - full_tb
    - test bench for testing full module (including lvds buffering and pwl)
    - input binary file format: 256-bit (8-bit * 32) per line

## Usage 
### Run example codes
```bash
# run full test with lvds inputs

sh run_test_full.sh

# run fft test with 8-bit integer inputs

sh run_test_fft.sh
```
### Run customized codes
Modify example python codes & bash script to run customized test
