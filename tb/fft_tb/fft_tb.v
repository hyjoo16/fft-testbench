`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Test bench
//////////////////////////////////////////////////////////////////////////////////



module fft_tb #(
    parameter TEST_NUM = 100
)
();

reg clk, reset, resetb; 

// DUT input: 32 sampled input (8 bit signed integer)
// input buffer wire
reg  [255:0]  input_buffer;

// simulation variables
integer   i,j;
integer f_out, f_pwr;
integer v_idx;

// output buffer wire
wire    [3:0]      output_buffer    [16:0];
wire    [34:0]     pwr_buffer       [16:0];

// TODO: generate test vectors
reg     [255:0]      testvectors     [0:TEST_NUM-1];// array of testvectors

// instantiate device under test
fft_tb_top DUT(
                                        .arstb(resetb),
                                        .rst_retime(resetb),
                                        .freeze(reset),

                                        .pw_x0_r_in(input_buffer[255:248]),
                                        .pw_x1_r_in(input_buffer[247:240]),
                                        .pw_x2_r_in(input_buffer[239:232]),
                                        .pw_x3_r_in(input_buffer[231:224]),
                                        .pw_x4_r_in(input_buffer[223:216]),
                                        .pw_x5_r_in(input_buffer[215:208]),
                                        .pw_x6_r_in(input_buffer[207:200]),
                                        .pw_x7_r_in(input_buffer[199:192]),

                                        .pw_x8_r_in(input_buffer[191:184]),
                                        .pw_x9_r_in(input_buffer[183:176]),
                                        .pw_x10_r_in(input_buffer[175:168]),
                                        .pw_x11_r_in(input_buffer[167:160]),
                                        .pw_x12_r_in(input_buffer[159:152]),
                                        .pw_x13_r_in(input_buffer[151:144]),
                                        .pw_x14_r_in(input_buffer[143:136]),
                                        .pw_x15_r_in(input_buffer[135:128]),

                                        .pw_x16_r_in(input_buffer[127:120]),
                                        .pw_x17_r_in(input_buffer[119:112]),
                                        .pw_x18_r_in(input_buffer[111:104]),
                                        .pw_x19_r_in(input_buffer[103:96]),
                                        .pw_x20_r_in(input_buffer[95:88]),
                                        .pw_x21_r_in(input_buffer[87:80]),
                                        .pw_x22_r_in(input_buffer[79:72]),
                                        .pw_x23_r_in(input_buffer[71:64]),

                                        .pw_x24_r_in(input_buffer[63:56]),
                                        .pw_x25_r_in(input_buffer[55:48]),
                                        .pw_x26_r_in(input_buffer[47:40]),
                                        .pw_x27_r_in(input_buffer[39:32]),
                                        .pw_x28_r_in(input_buffer[31:24]),
                                        .pw_x29_r_in(input_buffer[23:16]),
                                        .pw_x30_r_in(input_buffer[15:8]),
                                        .pw_x31_r_in(input_buffer[7:0]),

                                        .clk_fpga(clk),

                                        .pwr_dec_0 (output_buffer[0]),
                                        .pwr_dec_1 (output_buffer[1]),
                                        .pwr_dec_2 (output_buffer[2]),
                                        .pwr_dec_3 (output_buffer[3]),
                                        .pwr_dec_4 (output_buffer[4]),
                                        .pwr_dec_5 (output_buffer[5]),
                                        .pwr_dec_6 (output_buffer[6]),
                                        .pwr_dec_7 (output_buffer[7]),
                                        .pwr_dec_8 (output_buffer[8]),
                                        .pwr_dec_9 (output_buffer[9]),
                                        .pwr_dec_10(output_buffer[10]),
                                        .pwr_dec_11(output_buffer[11]),
                                        .pwr_dec_12(output_buffer[12]),
                                        .pwr_dec_13(output_buffer[13]),
                                        .pwr_dec_14(output_buffer[14]),
                                        .pwr_dec_15(output_buffer[15]),
                                        .pwr_dec_16(output_buffer[16]),

                                        .pwr_0(pwr_buffer[0]),
                                        .pwr_1(pwr_buffer[1]),
                                        .pwr_2(pwr_buffer[2]),
                                        .pwr_3(pwr_buffer[3]),
                                        .pwr_4(pwr_buffer[4]),
                                        .pwr_5(pwr_buffer[5]),
                                        .pwr_6(pwr_buffer[6]),
                                        .pwr_7(pwr_buffer[7]),
                                        .pwr_8(pwr_buffer[8]),
                                        .pwr_9(pwr_buffer[9]),
                                        .pwr_10(pwr_buffer[10]),
                                        .pwr_11(pwr_buffer[11]),
                                        .pwr_12(pwr_buffer[12]),
                                        .pwr_13(pwr_buffer[13]),
                                        .pwr_14(pwr_buffer[14]),
                                        .pwr_15(pwr_buffer[15]),
                                        .pwr_16(pwr_buffer[16])



);

// generate clock
always 
begin
clk = 1; #5; clk = 0; #5; // 10ns period
end


// test start

initial begin
    f_out = $fopen("dec_out.txt", "w");
    f_pwr = $fopen("pwr_out.txt", "w");
    $fdisplay(f_out,"Output :");
    $readmemb("fft_input.txt", testvectors); 
    v_idx = 0; 
    // for(i=0; i<TEST_NUM; i = i+1)
    //     begin
    //     $display("input[%d] : %d \n", i, testvectors[i]);
    //     end
    reset = 1; 
    resetb = 0;
    #27; 
    reset = 0; 
    resetb = 1;
    #10000
    $fclose(f_out);
    $finish;
end

// apply test vectors 

always @(posedge clk)
begin
    #1; input_buffer = testvectors[v_idx];
end

// check results 

always @(negedge clk)
begin
if (~reset) // skip during reset
begin
    v_idx <= v_idx + 1;
     $fwrite(f_out, "\n");
     $fwrite(f_pwr, "\n");
    for(j = 0; j < 17; j = j+1) 
        begin
        $fwrite(f_out, "%d",output_buffer[j]);
        $fwrite(f_pwr, "%d",pwr_buffer[j]);
        end
end
end

endmodule
