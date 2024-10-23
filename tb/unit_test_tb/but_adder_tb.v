// test bench for adder units 
// TODO: write verification code 

`timescale 1ns/1fs
module but_adder_tb #(parameter IN_W = 8, OUT_W = 8)();

reg signed [IN_W-1:0] in_a, in_b;
wire signed [OUT_W-1:0] out_p, out_n;

but_real #(IN_W, OUT_W) DUT (   .in_r_0_16(in_a),  .in_r_16_32(in_b),  .out_p_r(out_p),  .out_n_r(out_n)    );

reg clk;

always 
begin
clk = 1; #5; clk = 0; #5; // 10ns period
end

always
begin
    $display("test start! input w: %d, output w: %d", IN_W, OUT_W);
    in_a<=0;
    in_b<=10;
    #100
    $finish;
end

always @(posedge clk) begin
    in_a <= in_a+1;
    if(in_a==4'b0000) in_b<=in_b+1;
    else in_b <= in_b;
end

always @(negedge clk) begin
    $display("%d\t%d\t%d\t%d", in_a, in_b, out_p, out_n);
end


endmodule
