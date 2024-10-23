`timescale 1ns/1fs
module but_real #(parameter IN_W = 8, OUT_W = 8)(
    input   wire    signed  [IN_W-1:0]    in_r_0_16,
    input   wire    signed  [IN_W-1:0]    in_r_16_32,
    

    output  wire    signed  [OUT_W-1:0]    out_p_r,
    output  wire    signed  [OUT_W-1:0]    out_n_r

	);

    /******** Generating added/subtracted values ********/

    wire signed [IN_W:0] p_r;
    wire signed [IN_W:0] n_r;

    // trying sign extension

    // wire signed [IN_W:0] a_buf;
    // wire signed [IN_W:0] b_buf; 

    // wire signed [IN_W+1:0] p_buf;
    // wire signed [IN_W+1:0] n_buf;

    // assign a_buf = {in_r_0_16[IN_W-1], in_r_0_16};
    // assign b_buf = {in_r_16_32[IN_W-1], in_r_16_32};

    // assign p_buf = (a_buf) + b_buf;
    // assign n_buf = a_buf - b_buf;

    // assign p_r = p_buf[IN_W:0];
    // assign n_r = n_buf[IN_W:0];
    
    // with no sign extension

    assign  p_r   =   (in_r_0_16) + (in_r_16_32)   ;
    assign  n_r   =   (in_r_0_16) - (in_r_16_32)   ;

    rounding_unit #(IN_W+1, OUT_W) round_p (.in(p_r), .out(out_p_r));
    rounding_unit #(IN_W+1, OUT_W) round_n (.in(n_r), .out(out_n_r));

    /******** Adjusting bit width ********/

    // TODO: write bit width adjusting module 

    // LSB truncate 

    // assign  out_p_r   =   p_r[IN_W:IN_W-OUT_W+1]   ;
    // assign  out_n_r   =   n_r[IN_W:IN_W-OUT_W+1]   ;

    // // half-up : check bias

    // wire    [IN_W:0] out_p_round, out_n_round;
    // assign  out_p_round = p_r + {{OUT_W{1'b0}}, 1'b1, {(IN_W - OUT_W){1'b0}}};
    // assign  out_n_round = n_r + {{OUT_W{1'b0}}, 1'b1, {(IN_W - OUT_W){1'b0}}};

    // assign  out_p_r = out_p_round[IN_W:IN_W-OUT_W+1];
    // assign  out_n_r = out_n_round[IN_W:IN_W-OUT_W+1];

    // // half to zero

    // wire    out_p_round, out_n_round;
    // assign  out_p_round = p_r + {{OUT_W{1'b0}}, p_r[IN_W], {(IN_W - OUT_W){!p_r[IN_W]}}};
    // assign  out_n_round = n_r + {{OUT_W{1'b0}}, n_r[IN_W], {(IN_W - OUT_W){!n_r[IN_W]}}};

    // assign  out_p_r = out_p_round[IN_W:IN_W-OUT_W+1];
    // assign  out_n_r = out_n_round[IN_W:IN_W-OUT_W+1];
    
    // // half to even 

    // wire    out_p_round, out_n_round;
    // assign  out_p_round = p_r + {{OUT_W{1'b0}}, p_r[IN_W - OUT_W + 1], {(IN_W - OUT_W){!p_r[IN_W - OUT_W + 1]}}};
    // assign  out_n_round = n_r + {{OUT_W{1'b0}}, n_r[IN_W - OUT_W + 1], {(IN_W - OUT_W){!n_r[IN_W - OUT_W + 1]}}};

    // assign  out_p_r = out_p_round[IN_W:IN_W-OUT_W+1];
    // assign  out_n_r = out_n_round[IN_W:IN_W-OUT_W+1];
    

endmodule
