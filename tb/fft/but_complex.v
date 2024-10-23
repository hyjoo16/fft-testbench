
`timescale 1ns/1fs
module but_complex #(parameter IN_W = 8, OUT_W = 8)(
    input   wire    signed  [IN_W-1:0]    in_r_0_8,
    input   wire    signed  [IN_W-1:0]    in_r_8_16,
    
    input   wire    signed  [IN_W-1:0]    in_i_0_8,
    input   wire    signed  [IN_W-1:0]    in_i_8_16,

    output  wire    signed  [OUT_W-1:0]    out_p_r,
    output  wire    signed  [OUT_W-1:0]    out_n_r,

    output  wire    signed  [OUT_W-1:0]    out_p_i,
    output  wire    signed  [OUT_W-1:0]    out_n_i
	);

    
    wire signed [IN_W:0] p_r, n_r, p_i, n_i;

    assign  p_r  = in_r_0_8 + in_r_8_16   ;
    assign  n_r  = in_r_0_8 - in_r_8_16   ;

    assign  p_i  = in_i_0_8 + in_i_8_16   ;
    assign  n_i  = in_i_0_8 - in_i_8_16   ;


    rounding_unit #(IN_W+1, OUT_W) round_pr (.in(p_r), .out(out_p_r));
    rounding_unit #(IN_W+1, OUT_W) round_nr (.in(n_r), .out(out_n_r));

    rounding_unit #(IN_W+1, OUT_W) round_pi (.in(p_i), .out(out_p_i));
    rounding_unit #(IN_W+1, OUT_W) round_ni (.in(n_i), .out(out_n_i));



endmodule
