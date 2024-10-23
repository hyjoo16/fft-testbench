
`timescale 1ns/1fs
module multiplier_tw #(parameter IN_W = 8, OUT_W = 8, TW_W = 10)(
    input       signed  [IN_W-1:0]   x_r,
    input       signed  [IN_W-1:0]   x_i,
    input       signed  [TW_W-1:0]   w_r,
    input       signed  [TW_W-1:0]   w_i,

    output      signed  [OUT_W-1:0]    out_r,
    output      signed  [OUT_W-1:0]    out_i
	);


    wire    signed  [IN_W+TW_W:0]  y_i; 
    wire    signed  [IN_W+TW_W:0]  y_r; 

    assign  y_r =   (x_r*w_r) - (x_i*w_i);
    assign  y_i =   (x_r*w_i) + (x_i*w_r);

    // assign  out_r =  ({y_r[19], y_r[16:9]}); 
    // assign  out_i =  ({y_i[19], y_i[16:9]});

    assign out_r = ({y_r[IN_W+TW_W], y_r[IN_W+TW_W-3:IN_W+TW_W-OUT_W-2]});
    assign out_i = ({y_i[IN_W+TW_W], y_i[IN_W+TW_W-3:IN_W+TW_W-OUT_W-2]});

    // add rounding function 

    // this assumes that twiddle factor has 2 bit of integer part && |tw|<1
    // wire    signed [IN_W+TW_W-2:0]   trun_r;
    // wire    signed [IN_W+TW_W-2:0]   trun_i;

    // assign  trun_r = {y_r[IN_W+TW_W], y_r[IN_W+TW_W-3:0]};
    // assign  trun_i = {y_i[IN_W+TW_W], y_i[IN_W+TW_W-3:0]};

    // rounding_unit #(IN_W+TW_W-1, OUT_W) round_r (.in(trun_r), .out(out_r));
    // rounding_unit #(IN_W+TW_W-1, OUT_W) round_i (.in(trun_i), .out(out_i));

endmodule
