
`timescale 1ns/1fs
module but_32(
    input   wire    signed  [7:0]    in_r_0_16,
    input   wire    signed  [7:0]    in_r_16_32,
    

    output  wire    signed  [8:0]    out_p_r,
    output  wire    signed  [8:0]    out_n_r

	);





    assign  out_p_r   =   (in_r_0_16) + (in_r_16_32)   ;
    assign  out_n_r   =   (in_r_0_16) - (in_r_16_32)   ;



endmodule
