`timescale 1ns/1fs
module rounding_unit #(parameter IN_W = 8, OUT_W = 8)(
    input   wire    signed  [IN_W-1:0]    in,

    output  wire    signed  [OUT_W-1:0]    out
);

// Exception when OUT_W > IN_W -> sign bit padding at LSB?

// round_trun #(IN_W, OUT_W) round_unit (.in(in), .out(out));
round_halfup #(IN_W, OUT_W) round_unit (.in(in), .out(out));
// round_halftoeven #(IN_W, OUT_W) round_unit (.in(in), .out(out));
// round_halftozero #(IN_W, OUT_W) round_unit (.in(in), .out(out));

endmodule