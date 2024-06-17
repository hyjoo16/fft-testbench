
`timescale 1ns/1fs
module but_16(
    input   wire    signed  [14:0]    in_r_0_8,
    input   wire    signed  [14:0]    in_r_8_16,
    
    input   wire    signed  [14:0]    in_i_0_8,
    input   wire    signed  [14:0]    in_i_8_16,

    output  wire    signed  [15:0]    out_p_r,
    output  wire    signed  [15:0]    out_n_r,

    output  wire    signed  [15:0]    out_p_i,
    output  wire    signed  [15:0]    out_n_i
	);

    
    
    assign  out_p_r  = in_r_0_8 + in_r_8_16   ;
    assign  out_n_r  = in_r_0_8 - in_r_8_16   ;

    assign  out_p_i  = in_i_0_8 + in_i_8_16   ;
    assign  out_n_i  = in_i_0_8 - in_i_8_16   ;






endmodule
