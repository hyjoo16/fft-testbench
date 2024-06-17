python generate_input.py --option sine  # change --option to custom for custom input functions

cp fft_input.txt ./tb/fft_tb/fft_input.txt
cd ./tb/fft_tb

iverilog -o sim *.v ../fft/*.v
vvp sim

cp pwr_out.txt ../../
cd ../../

python plot_output.py pwr_out.txt 50  # set input parameter to skip the first 50 lines 