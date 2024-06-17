`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Test bench
//////////////////////////////////////////////////////////////////////////////////



module fft_tb #(
    parameter TEST_NUM = 800
)
();

reg clk, reset, resetb; 

// DUT input: ADC output - after lvds buffer
wire la0_p, la1_p, la2_p, la3_p, la4_p, la5_p, la6_p, la7_p, la8_p, la9_p, la10_p, la11_p, la12_p, la13_p, la14_p, la15_p, la16_p, la17_p, la18_p, la19_p;

// input buffer wire
reg     [19:0]  input_buffer;

// simulation variables
integer   i,j;
integer f_out, f_pwr;
integer v_idx;

assign  {la0_p, la1_p, la2_p, la3_p, la4_p, la5_p, la6_p, la7_p, la8_p, la9_p, la10_p, la11_p, la12_p, la13_p, la14_p, la15_p, la16_p, la17_p, la18_p, la19_p} = input_buffer;

// output buffer wire
wire    [3:0]      output_buffer    [16:0];
reg     [3:0]      output_reg       [16:0];
wire    [34:0]     pwr_buffer       [16:0];

// TODO: generate test vectors
reg     [19:0]      testvectors     [0:TEST_NUM-1];// array of testvectors

// instantiate device under test
fft_tb_top DUT(
                                        .arstb(resetb),
                                        .rst_retime(resetb),
                                        .freeze(reset),

                                        .la0_p(la0_p),	
                                        .la1_p(la1_p),	
                                        .la2_p(la2_p),	
                                        .la3_p(la3_p),	
                                        .la4_p(la4_p),	
                                        .la5_p(la5_p),	
                                        .la6_p(la6_p),	
                                        .la7_p(la7_p),	
                                        .la8_p(la8_p),	
                                        .la9_p(la9_p),	
                                        .la10_p(la10_p),	
                                        .la11_p(la11_p),	
                                        .la12_p(la12_p),	
                                        .la13_p(la13_p),	
                                        .la14_p(la14_p),	
                                        .la15_p(la15_p),	
                                        .la16_p(la16_p),	
                                        .la17_p(la17_p),	
                                        .la18_p(la18_p),	
                                        .la19_p(la19_p),	

                                        .clk_lvds(clk),

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
    f_out = $fopen("output_test.txt", "w");
    f_pwr = $fopen("pwr_out.txt", "w");
    $fdisplay(f_out,"Output :");
    $readmemb("lvds_input.txt", testvectors); 
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
