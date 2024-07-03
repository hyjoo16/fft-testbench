
`timescale 1ns/1fs
module dft_16to8 #(parameter IN_W = 8, OUT_W = 8, TW_W = 10)(
    //twiddle factor//
    input   wire    signed  [TW_W-1:0]   w15_i ,
    input   wire    signed  [TW_W-1:0]   w14_i ,
    input   wire    signed  [TW_W-1:0]   w13_i ,
    input   wire    signed  [TW_W-1:0]   w12_i ,
    input   wire    signed  [TW_W-1:0]   w11_i ,
    input   wire    signed  [TW_W-1:0]   w10_i ,
    input   wire    signed  [TW_W-1:0]    w9_i ,
    input   wire    signed  [TW_W-1:0]    w8_i ,
    input   wire    signed  [TW_W-1:0]    w7_i ,
    input   wire    signed  [TW_W-1:0]    w6_i ,
    input   wire    signed  [TW_W-1:0]    w5_i ,
    input   wire    signed  [TW_W-1:0]    w4_i ,
    input   wire    signed  [TW_W-1:0]    w3_i ,
    input   wire    signed  [TW_W-1:0]    w2_i ,
    input   wire    signed  [TW_W-1:0]    w1_i ,
    input   wire    signed  [TW_W-1:0]    w0_i ,



    input   wire    signed  [TW_W-1:0]   w0_r , 
    input   wire    signed  [TW_W-1:0]   w1_r , 
    input   wire    signed  [TW_W-1:0]   w2_r , 
    input   wire    signed  [TW_W-1:0]   w3_r , 
    input   wire    signed  [TW_W-1:0]   w4_r , 
    input   wire    signed  [TW_W-1:0]   w5_r , 
    input   wire    signed  [TW_W-1:0]   w6_r , 
    input   wire    signed  [TW_W-1:0]   w7_r , 
    input   wire    signed  [TW_W-1:0]   w8_r , 
    input   wire    signed  [TW_W-1:0]   w9_r , 
    input   wire    signed  [TW_W-1:0]   w10_r,
    input   wire    signed  [TW_W-1:0]   w11_r,
    input   wire    signed  [TW_W-1:0]   w12_r,
    input   wire    signed  [TW_W-1:0]   w13_r,
    input   wire    signed  [TW_W-1:0]   w14_r,
    input   wire    signed  [TW_W-1:0]   w15_r,
    
    input   wire    signed  [19:0]  trun, 
    
    //input//
    
    input  wire    signed  [IN_W-1:0]   fa0_r,  
    input  wire    signed  [IN_W-1:0]   fa1_r,  
    input  wire    signed  [IN_W-1:0]   fa2_r,  
    input  wire    signed  [IN_W-1:0]   fa3_r,  
    input  wire    signed  [IN_W-1:0]   fa4_r,  
    input  wire    signed  [IN_W-1:0]   fa5_r,  
    input  wire    signed  [IN_W-1:0]   fa6_r,  
    input  wire    signed  [IN_W-1:0]   fa7_r,  
    input  wire    signed  [IN_W-1:0]   fa8_r,  
    input  wire    signed  [IN_W-1:0]   fa9_r,  
    input  wire    signed  [IN_W-1:0]   fa10_r, 
    input  wire    signed  [IN_W-1:0]   fa11_r, 
    input  wire    signed  [IN_W-1:0]   fa12_r, 
    input  wire    signed  [IN_W-1:0]   fa13_r, 
    input  wire    signed  [IN_W-1:0]   fa14_r, 
    input  wire    signed  [IN_W-1:0]   fa15_r, 
   
    input  wire    signed  [IN_W-1:0]   fb0_r, 
    input  wire    signed  [IN_W-1:0]   fb1_r, 
    input  wire    signed  [IN_W-1:0]   fb2_r, 
    input  wire    signed  [IN_W-1:0]   fb3_r, 
    input  wire    signed  [IN_W-1:0]   fb4_r, 
    input  wire    signed  [IN_W-1:0]   fb5_r, 
    input  wire    signed  [IN_W-1:0]   fb6_r, 
    input  wire    signed  [IN_W-1:0]   fb7_r, 
    input  wire    signed  [IN_W-1:0]   fb8_r, 
    input  wire    signed  [IN_W-1:0]   fb9_r, 
    input  wire    signed  [IN_W-1:0]   fb10_r,
    input  wire    signed  [IN_W-1:0]   fb11_r,
    input  wire    signed  [IN_W-1:0]   fb12_r,
    input  wire    signed  [IN_W-1:0]   fb13_r,
    input  wire    signed  [IN_W-1:0]   fb14_r,
    input  wire    signed  [IN_W-1:0]   fb15_r,
   

    //output//
    output  wire    signed  [OUT_W-1:0]   sa0_r,  sa0_i,
    output  wire    signed  [OUT_W-1:0]   sa1_r,  sa1_i,
    output  wire    signed  [OUT_W-1:0]   sa2_r,  sa2_i,
    output  wire    signed  [OUT_W-1:0]   sa3_r,  sa3_i,
    output  wire    signed  [OUT_W-1:0]   sa4_r,  sa4_i,
    output  wire    signed  [OUT_W-1:0]   sa5_r,  sa5_i,
    output  wire    signed  [OUT_W-1:0]   sa6_r,  sa6_i,
    output  wire    signed  [OUT_W-1:0]   sa7_r,  sa7_i,
    
    output  wire    signed  [OUT_W-1:0]   sb0_r,  sb0_i,
    output  wire    signed  [OUT_W-1:0]   sb1_r,  sb1_i,
    output  wire    signed  [OUT_W-1:0]   sb2_r,  sb2_i,
    output  wire    signed  [OUT_W-1:0]   sb3_r,  sb3_i,
    output  wire    signed  [OUT_W-1:0]   sb4_r,  sb4_i,
    output  wire    signed  [OUT_W-1:0]   sb5_r,  sb5_i,
    output  wire    signed  [OUT_W-1:0]   sb6_r,  sb6_i,
    output  wire    signed  [OUT_W-1:0]   sb7_r,  sb7_i,
    
    output  wire    signed  [OUT_W-1:0]   sc0_r,  sc0_i,
    output  wire    signed  [OUT_W-1:0]   sc1_r,  sc1_i,
    output  wire    signed  [OUT_W-1:0]   sc2_r,  sc2_i,
    output  wire    signed  [OUT_W-1:0]   sc3_r,  sc3_i,
    output  wire    signed  [OUT_W-1:0]   sc4_r,  sc4_i,
    output  wire    signed  [OUT_W-1:0]   sc5_r,  sc5_i,
    output  wire    signed  [OUT_W-1:0]   sc6_r,  sc6_i,
    output  wire    signed  [OUT_W-1:0]   sc7_r,  sc7_i,
    
    output  wire    signed  [OUT_W-1:0]   sd0_r,  sd0_i,
    output  wire    signed  [OUT_W-1:0]   sd1_r,  sd1_i,
    output  wire    signed  [OUT_W-1:0]   sd2_r,  sd2_i,
    output  wire    signed  [OUT_W-1:0]   sd3_r,  sd3_i,
    output  wire    signed  [OUT_W-1:0]   sd4_r,  sd4_i,
    output  wire    signed  [OUT_W-1:0]   sd5_r,  sd5_i,
    output  wire    signed  [OUT_W-1:0]   sd6_r,  sd6_i,
    output  wire    signed  [OUT_W-1:0]   sd7_r,  sd7_i
    );

    //twiddle factor multiplication//

    // ????

    wire    signed  [IN_W-1:0]  fa0_tw_r; 
    wire    signed  [IN_W-1:0]  fa1_tw_r; 
    wire    signed  [IN_W-1:0]  fa2_tw_r; 
    wire    signed  [IN_W-1:0]  fa3_tw_r; 
    wire    signed  [IN_W-1:0]  fa4_tw_r; 
    wire    signed  [IN_W-1:0]  fa5_tw_r; 
    wire    signed  [IN_W-1:0]  fa6_tw_r; 
    wire    signed  [IN_W-1:0]  fa7_tw_r; 
    wire    signed  [IN_W-1:0]  fa8_tw_r; 
    wire    signed  [IN_W-1:0]  fa9_tw_r; 
    wire    signed  [IN_W-1:0]  fa10_tw_r;
    wire    signed  [IN_W-1:0]  fa11_tw_r;
    wire    signed  [IN_W-1:0]  fa12_tw_r;
    wire    signed  [IN_W-1:0]  fa13_tw_r;
    wire    signed  [IN_W-1:0]  fa14_tw_r;
    wire    signed  [IN_W-1:0]  fa15_tw_r;
    
    wire    signed  [IN_W-1:0]  fb0_tw_r, fb0_tw_i;
    wire    signed  [IN_W-1:0]  fb1_tw_r, fb1_tw_i;
    wire    signed  [IN_W-1:0]  fb2_tw_r, fb2_tw_i;
    wire    signed  [IN_W-1:0]  fb3_tw_r, fb3_tw_i;
    wire    signed  [IN_W-1:0]  fb4_tw_r, fb4_tw_i;
    wire    signed  [IN_W-1:0]  fb5_tw_r, fb5_tw_i;
    wire    signed  [IN_W-1:0]  fb6_tw_r, fb6_tw_i;
    wire    signed  [IN_W-1:0]  fb7_tw_r, fb7_tw_i;
    wire    signed  [IN_W-1:0]  fb8_tw_r, fb8_tw_i;
    wire    signed  [IN_W-1:0]  fb9_tw_r, fb9_tw_i;
    wire    signed  [IN_W-1:0]  fb10_tw_r, fb10_tw_i;
    wire    signed  [IN_W-1:0]  fb11_tw_r, fb11_tw_i;
    wire    signed  [IN_W-1:0]  fb12_tw_r, fb12_tw_i;
    wire    signed  [IN_W-1:0]  fb13_tw_r, fb13_tw_i;
    wire    signed  [IN_W-1:0]  fb14_tw_r, fb14_tw_i;
    wire    signed  [IN_W-1:0]  fb15_tw_r, fb15_tw_i;


    assign  fa0_tw_r    =   fa0_r;
    assign  fa1_tw_r    =   fa1_r;
    assign  fa2_tw_r    =   fa2_r;
    assign  fa3_tw_r    =   fa3_r;
    assign  fa4_tw_r    =   fa4_r;
    assign  fa5_tw_r    =   fa5_r;
    assign  fa6_tw_r    =   fa6_r;
    assign  fa7_tw_r    =   fa7_r;
    assign  fa8_tw_r    =   fa8_r;
    assign  fa9_tw_r    =   fa9_r;
    assign  fa10_tw_r    =   fa10_r;
    assign  fa11_tw_r    =   fa11_r;
    assign  fa12_tw_r    =   fa12_r;
    assign  fa13_tw_r    =   fa13_r;
    assign  fa14_tw_r    =   fa14_r;
    assign  fa15_tw_r    =   fa15_r;



    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_1       (   .x_r(fb0_r),    .x_i({IN_W{1'b0}}),  .w_r(w0_r),  .w_i(w0_i),     .out_r(fb0_tw_r),    .out_i(fb0_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_2       (   .x_r(fb1_r),    .x_i({IN_W{1'b0}}),  .w_r(w1_r),  .w_i(w1_i),     .out_r(fb1_tw_r),    .out_i(fb1_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_3       (   .x_r(fb2_r),    .x_i({IN_W{1'b0}}),  .w_r(w2_r),  .w_i(w2_i),     .out_r(fb2_tw_r),    .out_i(fb2_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_4       (   .x_r(fb3_r),    .x_i({IN_W{1'b0}}),  .w_r(w3_r),  .w_i(w3_i),     .out_r(fb3_tw_r),    .out_i(fb3_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_5       (   .x_r(fb4_r),    .x_i({IN_W{1'b0}}),  .w_r(w4_r),  .w_i(w4_i),     .out_r(fb4_tw_r),    .out_i(fb4_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_6       (   .x_r(fb5_r),    .x_i({IN_W{1'b0}}),  .w_r(w5_r),  .w_i(w5_i),     .out_r(fb5_tw_r),    .out_i(fb5_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_7       (   .x_r(fb6_r),    .x_i({IN_W{1'b0}}),  .w_r(w6_r),  .w_i(w6_i),     .out_r(fb6_tw_r),    .out_i(fb6_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_8       (   .x_r(fb7_r),    .x_i({IN_W{1'b0}}),  .w_r(w7_r),  .w_i(w7_i),     .out_r(fb7_tw_r),    .out_i(fb7_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_9       (   .x_r(fb8_r),    .x_i({IN_W{1'b0}}),  .w_r(w8_r),  .w_i(w8_i),     .out_r(fb8_tw_r),    .out_i(fb8_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_10      (   .x_r(fb9_r),    .x_i({IN_W{1'b0}}),  .w_r(w9_r),  .w_i(w9_i),     .out_r(fb9_tw_r),    .out_i(fb9_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_11      (   .x_r(fb10_r),    .x_i({IN_W{1'b0}}),  .w_r(w10_r),  .w_i(w10_i),  .out_r(fb10_tw_r),    .out_i(fb10_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_12      (   .x_r(fb11_r),    .x_i({IN_W{1'b0}}),  .w_r(w11_r),  .w_i(w11_i),  .out_r(fb11_tw_r),    .out_i(fb11_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_13      (   .x_r(fb12_r),    .x_i({IN_W{1'b0}}),  .w_r(w12_r),  .w_i(w12_i),  .out_r(fb12_tw_r),    .out_i(fb12_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_14      (   .x_r(fb13_r),    .x_i({IN_W{1'b0}}),  .w_r(w13_r),  .w_i(w13_i),  .out_r(fb13_tw_r),    .out_i(fb13_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_15      (   .x_r(fb14_r),    .x_i({IN_W{1'b0}}),  .w_r(w14_r),  .w_i(w14_i),  .out_r(fb14_tw_r),    .out_i(fb14_tw_i) ); 
    multiplier_tw #(IN_W, IN_W, TW_W)  i_mu_16      (   .x_r(fb15_r),    .x_i({IN_W{1'b0}}),  .w_r(w15_r),  .w_i(w15_i),  .out_r(fb15_tw_r),    .out_i(fb15_tw_i) ); 




    //fa -> sa & sb//
    
    but_complex #(IN_W, OUT_W) i_but16_1    (   .in_r_0_8(fa0_tw_r), .in_i_0_8({IN_W{1'b0}}), .in_r_8_16(fa8_tw_r),   .in_i_8_16({IN_W{1'b0}}),   .out_p_r(sa0_r),  .out_n_r(sb0_r),  .out_p_i(sa0_i),  .out_n_i(sb0_i)  );
    but_complex #(IN_W, OUT_W) i_but16_2    (   .in_r_0_8(fa1_tw_r), .in_i_0_8({IN_W{1'b0}}), .in_r_8_16(fa9_tw_r),   .in_i_8_16({IN_W{1'b0}}),   .out_p_r(sa1_r),  .out_n_r(sb1_r),  .out_p_i(sa1_i),  .out_n_i(sb1_i)  );
    but_complex #(IN_W, OUT_W) i_but16_3    (   .in_r_0_8(fa2_tw_r), .in_i_0_8({IN_W{1'b0}}), .in_r_8_16(fa10_tw_r),  .in_i_8_16({IN_W{1'b0}}),    .out_p_r(sa2_r),  .out_n_r(sb2_r),  .out_p_i(sa2_i),  .out_n_i(sb2_i)  );
    but_complex #(IN_W, OUT_W) i_but16_4    (   .in_r_0_8(fa3_tw_r), .in_i_0_8({IN_W{1'b0}}), .in_r_8_16(fa11_tw_r),  .in_i_8_16({IN_W{1'b0}}),    .out_p_r(sa3_r),  .out_n_r(sb3_r),  .out_p_i(sa3_i),  .out_n_i(sb3_i)  );
    but_complex #(IN_W, OUT_W) i_but16_5    (   .in_r_0_8(fa4_tw_r), .in_i_0_8({IN_W{1'b0}}), .in_r_8_16(fa12_tw_r),  .in_i_8_16({IN_W{1'b0}}),    .out_p_r(sa4_r),  .out_n_r(sb4_r),  .out_p_i(sa4_i),  .out_n_i(sb4_i)  );
    but_complex #(IN_W, OUT_W) i_but16_6    (   .in_r_0_8(fa5_tw_r), .in_i_0_8({IN_W{1'b0}}), .in_r_8_16(fa13_tw_r),  .in_i_8_16({IN_W{1'b0}}),    .out_p_r(sa5_r),  .out_n_r(sb5_r),  .out_p_i(sa5_i),  .out_n_i(sb5_i)  );
    but_complex #(IN_W, OUT_W) i_but16_7    (   .in_r_0_8(fa6_tw_r), .in_i_0_8({IN_W{1'b0}}), .in_r_8_16(fa14_tw_r),  .in_i_8_16({IN_W{1'b0}}),    .out_p_r(sa6_r),  .out_n_r(sb6_r),  .out_p_i(sa6_i),  .out_n_i(sb6_i)  );
    but_complex #(IN_W, OUT_W) i_but16_8    (   .in_r_0_8(fa7_tw_r), .in_i_0_8({IN_W{1'b0}}), .in_r_8_16(fa15_tw_r),  .in_i_8_16({IN_W{1'b0}}),    .out_p_r(sa7_r),  .out_n_r(sb7_r),  .out_p_i(sa7_i),  .out_n_i(sb7_i)  );
    
    //fb -> sc & sd//
    
    but_complex #(IN_W, OUT_W) i_but16_9     (   .in_r_0_8(fb0_tw_r), .in_i_0_8(fb0_tw_i), .in_r_8_16(fb8_tw_r),   .in_i_8_16(fb8_tw_i),   .out_p_r(sc0_r),  .out_n_r(sd0_r),  .out_p_i(sc0_i),  .out_n_i(sd0_i)  );
    but_complex #(IN_W, OUT_W) i_but16_10    (   .in_r_0_8(fb1_tw_r), .in_i_0_8(fb1_tw_i), .in_r_8_16(fb9_tw_r),   .in_i_8_16(fb9_tw_i),   .out_p_r(sc1_r),  .out_n_r(sd1_r),  .out_p_i(sc1_i),  .out_n_i(sd1_i)  );
    but_complex #(IN_W, OUT_W) i_but16_11    (   .in_r_0_8(fb2_tw_r), .in_i_0_8(fb2_tw_i), .in_r_8_16(fb10_tw_r),  .in_i_8_16(fb10_tw_i),  .out_p_r(sc2_r),  .out_n_r(sd2_r),  .out_p_i(sc2_i),  .out_n_i(sd2_i)  );
    but_complex #(IN_W, OUT_W) i_but16_12    (   .in_r_0_8(fb3_tw_r), .in_i_0_8(fb3_tw_i), .in_r_8_16(fb11_tw_r),  .in_i_8_16(fb11_tw_i),  .out_p_r(sc3_r),  .out_n_r(sd3_r),  .out_p_i(sc3_i),  .out_n_i(sd3_i)  );
    but_complex #(IN_W, OUT_W) i_but16_13    (   .in_r_0_8(fb4_tw_r), .in_i_0_8(fb4_tw_i), .in_r_8_16(fb12_tw_r),  .in_i_8_16(fb12_tw_i),  .out_p_r(sc4_r),  .out_n_r(sd4_r),  .out_p_i(sc4_i),  .out_n_i(sd4_i)  );
    but_complex #(IN_W, OUT_W) i_but16_14    (   .in_r_0_8(fb5_tw_r), .in_i_0_8(fb5_tw_i), .in_r_8_16(fb13_tw_r),  .in_i_8_16(fb13_tw_i),  .out_p_r(sc5_r),  .out_n_r(sd5_r),  .out_p_i(sc5_i),  .out_n_i(sd5_i)  );
    but_complex #(IN_W, OUT_W) i_but16_15    (   .in_r_0_8(fb6_tw_r), .in_i_0_8(fb6_tw_i), .in_r_8_16(fb14_tw_r),  .in_i_8_16(fb14_tw_i),  .out_p_r(sc6_r),  .out_n_r(sd6_r),  .out_p_i(sc6_i),  .out_n_i(sd6_i)  );
    but_complex #(IN_W, OUT_W) i_but16_16    (   .in_r_0_8(fb7_tw_r), .in_i_0_8(fb7_tw_i), .in_r_8_16(fb15_tw_r),  .in_i_8_16(fb15_tw_i),  .out_p_r(sc7_r),  .out_n_r(sd7_r),  .out_p_i(sc7_i),  .out_n_i(sd7_i)  );



endmodule
