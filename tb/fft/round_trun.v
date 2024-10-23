`timescale 1ns/1fs
module round_trun #(parameter IN_W = 8, OUT_W = 8)(
    input   wire    signed  [IN_W-1:0]    in,

    output  wire    signed  [OUT_W-1:0]    out
);

// Exception when OUT_W > IN_W -> sign bit padding at LSB

generate
    if (OUT_W < IN_W) begin
        assign out = in[IN_W-1:IN_W-OUT_W];
    end else begin
        assign out = {in[IN_W-1:0], {(OUT_W-IN_W){in[IN_W-1]}}};
    end
endgenerate


endmodule