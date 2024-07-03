
`timescale 1ns/1fs
module but_real #(parameter IN_W = 8, OUT_W = 8)(
    input   wire    signed  [IN_W-1:0]    in_r_0_16,
    input   wire    signed  [IN_W-1:0]    in_r_16_32,
    

    output  wire    signed  [OUT_W-1:0]    out_p_r,
    output  wire    signed  [OUT_W-1:0]    out_n_r

	);

    wire signed [IN_W:0] p_r;
    wire signed [IN_W:0] n_r;

    assign  p_r   =   (in_r_0_16) + (in_r_16_32)   ;
    assign  n_r   =   (in_r_0_16) - (in_r_16_32)   ;


    assign  out_p_r   =   p_r[IN_W:IN_W-OUT_W+1]   ;
    assign  out_n_r   =   n_r[IN_W:IN_W-OUT_W+1]   ;



endmodule
