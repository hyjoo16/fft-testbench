
`timescale 1ns/1fs
module dft_8to4 #(parameter IN_W = 8, OUT_W = 8, TW_W = 10)(
    //twiddle factor//
    input   wire    signed  [TW_W-1:0]   w14_i ,
    input   wire    signed  [TW_W-1:0]   w12_i ,
    input   wire    signed  [TW_W-1:0]   w10_i ,
    input   wire    signed  [TW_W-1:0]    w8_i ,
    input   wire    signed  [TW_W-1:0]    w6_i ,
    input   wire    signed  [TW_W-1:0]    w4_i ,
    input   wire    signed  [TW_W-1:0]    w2_i ,
    input   wire    signed  [TW_W-1:0]    w0_i ,



    input   wire    signed  [TW_W-1:0]   w0_r , 
    input   wire    signed  [TW_W-1:0]   w2_r , 
    input   wire    signed  [TW_W-1:0]   w4_r , 
    input   wire    signed  [TW_W-1:0]   w6_r , 
    input   wire    signed  [TW_W-1:0]   w8_r , 
    input   wire    signed  [TW_W-1:0]   w10_r,
    input   wire    signed  [TW_W-1:0]   w12_r,
    input   wire    signed  [TW_W-1:0]   w14_r,
    
    //input//
    input   wire    signed  [IN_W-1:0]   sa0_r,  sa0_i,
    input   wire    signed  [IN_W-1:0]   sa1_r,  sa1_i,
    input   wire    signed  [IN_W-1:0]   sa2_r,  sa2_i,
    input   wire    signed  [IN_W-1:0]   sa3_r,  sa3_i,
    input   wire    signed  [IN_W-1:0]   sa4_r,  sa4_i,
    input   wire    signed  [IN_W-1:0]   sa5_r,  sa5_i,
    input   wire    signed  [IN_W-1:0]   sa6_r,  sa6_i,
    input   wire    signed  [IN_W-1:0]   sa7_r,  sa7_i,
    
    input   wire    signed  [IN_W-1:0]   sb0_r,  sb0_i,
    input   wire    signed  [IN_W-1:0]   sb1_r,  sb1_i,
    input   wire    signed  [IN_W-1:0]   sb2_r,  sb2_i,
    input   wire    signed  [IN_W-1:0]   sb3_r,  sb3_i,
    input   wire    signed  [IN_W-1:0]   sb4_r,  sb4_i,
    input   wire    signed  [IN_W-1:0]   sb5_r,  sb5_i,
    input   wire    signed  [IN_W-1:0]   sb6_r,  sb6_i,
    input   wire    signed  [IN_W-1:0]   sb7_r,  sb7_i,
    
    input   wire    signed  [IN_W-1:0]   sc0_r,  sc0_i,
    input   wire    signed  [IN_W-1:0]   sc1_r,  sc1_i,
    input   wire    signed  [IN_W-1:0]   sc2_r,  sc2_i,
    input   wire    signed  [IN_W-1:0]   sc3_r,  sc3_i,
    input   wire    signed  [IN_W-1:0]   sc4_r,  sc4_i,
    input   wire    signed  [IN_W-1:0]   sc5_r,  sc5_i,
    input   wire    signed  [IN_W-1:0]   sc6_r,  sc6_i,
    input   wire    signed  [IN_W-1:0]   sc7_r,  sc7_i,
    
    input   wire    signed  [IN_W-1:0]   sd0_r,  sd0_i,
    input   wire    signed  [IN_W-1:0]   sd1_r,  sd1_i,
    input   wire    signed  [IN_W-1:0]   sd2_r,  sd2_i,
    input   wire    signed  [IN_W-1:0]   sd3_r,  sd3_i,
    input   wire    signed  [IN_W-1:0]   sd4_r,  sd4_i,
    input   wire    signed  [IN_W-1:0]   sd5_r,  sd5_i,
    input   wire    signed  [IN_W-1:0]   sd6_r,  sd6_i,
    input   wire    signed  [IN_W-1:0]   sd7_r,  sd7_i,
   

    //output//
    output   wire    signed  [OUT_W-1:0]   ta0_r,  ta0_i,
    output   wire    signed  [OUT_W-1:0]   ta1_r,  ta1_i,
    output   wire    signed  [OUT_W-1:0]   ta2_r,  ta2_i,
    output   wire    signed  [OUT_W-1:0]   ta3_r,  ta3_i,
    
    output   wire    signed  [OUT_W-1:0]   tb0_r,  tb0_i,
    output   wire    signed  [OUT_W-1:0]   tb1_r,  tb1_i,
    output   wire    signed  [OUT_W-1:0]   tb2_r,  tb2_i,
    output   wire    signed  [OUT_W-1:0]   tb3_r,  tb3_i,
    
    output   wire    signed  [OUT_W-1:0]   tc0_r,  tc0_i,
    output   wire    signed  [OUT_W-1:0]   tc1_r,  tc1_i,
    output   wire    signed  [OUT_W-1:0]   tc2_r,  tc2_i,
    output   wire    signed  [OUT_W-1:0]   tc3_r,  tc3_i,
    
    output   wire    signed  [OUT_W-1:0]   td0_r,  td0_i,
    output   wire    signed  [OUT_W-1:0]   td1_r,  td1_i,
    output   wire    signed  [OUT_W-1:0]   td2_r,  td2_i,
    output   wire    signed  [OUT_W-1:0]   td3_r,  td3_i,
    
    output   wire    signed  [OUT_W-1:0]   te0_r,  te0_i,
    output   wire    signed  [OUT_W-1:0]   te1_r,  te1_i,
    output   wire    signed  [OUT_W-1:0]   te2_r,  te2_i,
    output   wire    signed  [OUT_W-1:0]   te3_r,  te3_i,
    
    output   wire    signed  [OUT_W-1:0]   tf0_r,  tf0_i,
    output   wire    signed  [OUT_W-1:0]   tf1_r,  tf1_i,
    output   wire    signed  [OUT_W-1:0]   tf2_r,  tf2_i,
    output   wire    signed  [OUT_W-1:0]   tf3_r,  tf3_i,
    
    output   wire    signed  [OUT_W-1:0]   tg0_r,  tg0_i,
    output   wire    signed  [OUT_W-1:0]   tg1_r,  tg1_i,
    output   wire    signed  [OUT_W-1:0]   tg2_r,  tg2_i,
    output   wire    signed  [OUT_W-1:0]   tg3_r,  tg3_i,
    
    output   wire    signed  [OUT_W-1:0]   th0_r,  th0_i,
    output   wire    signed  [OUT_W-1:0]   th1_r,  th1_i,
    output   wire    signed  [OUT_W-1:0]   th2_r,  th2_i,
    output   wire    signed  [OUT_W-1:0]   th3_r,  th3_i
   
    );

    //twiddle factor multiplication//

    wire    signed  [IN_W-1:0]   sa0_tw_r,  sa0_tw_i;
    wire    signed  [IN_W-1:0]   sa1_tw_r,  sa1_tw_i;
    wire    signed  [IN_W-1:0]   sa2_tw_r,  sa2_tw_i;
    wire    signed  [IN_W-1:0]   sa3_tw_r,  sa3_tw_i;
    wire    signed  [IN_W-1:0]   sa4_tw_r,  sa4_tw_i;
    wire    signed  [IN_W-1:0]   sa5_tw_r,  sa5_tw_i;
    wire    signed  [IN_W-1:0]   sa6_tw_r,  sa6_tw_i;
    wire    signed  [IN_W-1:0]   sa7_tw_r,  sa7_tw_i;
    
   
    wire    signed  [IN_W-1:0]   sc0_tw_r,  sc0_tw_i;
    wire    signed  [IN_W-1:0]   sc1_tw_r,  sc1_tw_i;
    wire    signed  [IN_W-1:0]   sc2_tw_r,  sc2_tw_i;
    wire    signed  [IN_W-1:0]   sc3_tw_r,  sc3_tw_i;
    wire    signed  [IN_W-1:0]   sc4_tw_r,  sc4_tw_i;
    wire    signed  [IN_W-1:0]   sc5_tw_r,  sc5_tw_i;
    wire    signed  [IN_W-1:0]   sc6_tw_r,  sc6_tw_i;
    wire    signed  [IN_W-1:0]   sc7_tw_r,  sc7_tw_i;
    
    wire    signed  [IN_W-1:0]   sb0_tw_r,  sb0_tw_i;
    wire    signed  [IN_W-1:0]   sb1_tw_r,  sb1_tw_i;
    wire    signed  [IN_W-1:0]   sb2_tw_r,  sb2_tw_i;
    wire    signed  [IN_W-1:0]   sb3_tw_r,  sb3_tw_i;
    wire    signed  [IN_W-1:0]   sb4_tw_r,  sb4_tw_i;
    wire    signed  [IN_W-1:0]   sb5_tw_r,  sb5_tw_i;
    wire    signed  [IN_W-1:0]   sb6_tw_r,  sb6_tw_i;
    wire    signed  [IN_W-1:0]   sb7_tw_r,  sb7_tw_i;
    
   
    wire    signed  [IN_W-1:0]   sd0_tw_r,  sd0_tw_i;
    wire    signed  [IN_W-1:0]   sd1_tw_r,  sd1_tw_i;
    wire    signed  [IN_W-1:0]   sd2_tw_r,  sd2_tw_i;
    wire    signed  [IN_W-1:0]   sd3_tw_r,  sd3_tw_i;
    wire    signed  [IN_W-1:0]   sd4_tw_r,  sd4_tw_i;
    wire    signed  [IN_W-1:0]   sd5_tw_r,  sd5_tw_i;
    wire    signed  [IN_W-1:0]   sd6_tw_r,  sd6_tw_i;
    wire    signed  [IN_W-1:0]   sd7_tw_r,  sd7_tw_i;
   
    assign      sa0_tw_r    =   sa0_r;
    assign      sa1_tw_r    =   sa1_r;
    assign      sa2_tw_r    =   sa2_r;
    assign      sa3_tw_r    =   sa3_r;
    assign      sa4_tw_r    =   sa4_r;
    assign      sa5_tw_r    =   sa5_r;
    assign      sa6_tw_r    =   sa6_r;
    assign      sa7_tw_r    =   sa7_r;
    
    assign      sc0_tw_r    =   sc0_r;
    assign      sc1_tw_r    =   sc1_r;
    assign      sc2_tw_r    =   sc2_r;
    assign      sc3_tw_r    =   sc3_r;
    assign      sc4_tw_r    =   sc4_r;
    assign      sc5_tw_r    =   sc5_r;
    assign      sc6_tw_r    =   sc6_r;
    assign      sc7_tw_r    =   sc7_r;

    assign      sa0_tw_i    =   sa0_i;
    assign      sa1_tw_i    =   sa1_i;
    assign      sa2_tw_i    =   sa2_i;
    assign      sa3_tw_i    =   sa3_i;
    assign      sa4_tw_i    =   sa4_i;
    assign      sa5_tw_i    =   sa5_i;
    assign      sa6_tw_i    =   sa6_i;
    assign      sa7_tw_i    =   sa7_i;
     
    assign      sc0_tw_i    =   sc0_i;
    assign      sc1_tw_i    =   sc1_i;
    assign      sc2_tw_i    =   sc2_i;
    assign      sc3_tw_i    =   sc3_i;
    assign      sc4_tw_i    =   sc4_i;
    assign      sc5_tw_i    =   sc5_i;
    assign      sc6_tw_i    =   sc6_i;
    assign      sc7_tw_i    =   sc7_i;

     
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_1       (   .x_r(sb0_r),    .x_i(sb0_i),  .w_r(w0_r),  .w_i(w0_i), .out_r(sb0_tw_r),    .out_i(sb0_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_2       (   .x_r(sb1_r),    .x_i(sb1_i),  .w_r(w2_r),  .w_i(w2_i), .out_r(sb1_tw_r),    .out_i(sb1_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_3       (   .x_r(sb2_r),    .x_i(sb2_i),  .w_r(w4_r),  .w_i(w4_i), .out_r(sb2_tw_r),    .out_i(sb2_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_4       (   .x_r(sb3_r),    .x_i(sb3_i),  .w_r(w6_r),  .w_i(w6_i), .out_r(sb3_tw_r),    .out_i(sb3_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_5       (   .x_r(sb4_r),    .x_i(sb4_i),  .w_r(w8_r),  .w_i(w8_i), .out_r(sb4_tw_r),    .out_i(sb4_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_6       (   .x_r(sb5_r),    .x_i(sb5_i),  .w_r(w10_r),  .w_i(w10_i), .out_r(sb5_tw_r),    .out_i(sb5_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_7       (   .x_r(sb6_r),    .x_i(sb6_i),  .w_r(w12_r),  .w_i(w12_i), .out_r(sb6_tw_r),    .out_i(sb6_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_8       (   .x_r(sb7_r),    .x_i(sb7_i),  .w_r(w14_r),  .w_i(w14_i), .out_r(sb7_tw_r),    .out_i(sb7_tw_i) ); 

     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_9      (   .x_r(sd0_r),    .x_i(sd0_i),  .w_r(w0_r),  .w_i(w0_i), .out_r(sd0_tw_r),    .out_i(sd0_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_10     (   .x_r(sd1_r),    .x_i(sd1_i),  .w_r(w2_r),  .w_i(w2_i), .out_r(sd1_tw_r),    .out_i(sd1_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_11     (   .x_r(sd2_r),    .x_i(sd2_i),  .w_r(w4_r),  .w_i(w4_i), .out_r(sd2_tw_r),    .out_i(sd2_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_12     (   .x_r(sd3_r),    .x_i(sd3_i),  .w_r(w6_r),  .w_i(w6_i), .out_r(sd3_tw_r),    .out_i(sd3_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_13     (   .x_r(sd4_r),    .x_i(sd4_i),  .w_r(w8_r),  .w_i(w8_i), .out_r(sd4_tw_r),    .out_i(sd4_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_14     (   .x_r(sd5_r),    .x_i(sd5_i),  .w_r(w10_r),  .w_i(w10_i), .out_r(sd5_tw_r),    .out_i(sd5_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_15     (   .x_r(sd6_r),    .x_i(sd6_i),  .w_r(w12_r),  .w_i(w12_i), .out_r(sd6_tw_r),    .out_i(sd6_tw_i) ); 
     multiplier_tw #(IN_W, IN_W, TW_W)  ii_mu16_16     (   .x_r(sd7_r),    .x_i(sd7_i),  .w_r(w14_r),  .w_i(w14_i), .out_r(sd7_tw_r),    .out_i(sd7_tw_i) ); 


    //sa -> ta & tb//
    
    but_complex #(IN_W, OUT_W) ii_but8_ta1    (   .in_r_0_8(sa0_tw_r), .in_i_0_8(sa0_tw_i), .in_r_8_16(sa4_tw_r),  .in_i_8_16(sa4_tw_i),   .out_p_r(ta0_r),  .out_n_r(tb0_r),  .out_p_i(ta0_i),  .out_n_i(tb0_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_ta2    (   .in_r_0_8(sa1_tw_r), .in_i_0_8(sa1_tw_i), .in_r_8_16(sa5_tw_r),  .in_i_8_16(sa5_tw_i),   .out_p_r(ta1_r),  .out_n_r(tb1_r),  .out_p_i(ta1_i),  .out_n_i(tb1_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_ta3    (   .in_r_0_8(sa2_tw_r), .in_i_0_8(sa2_tw_i), .in_r_8_16(sa6_tw_r),  .in_i_8_16(sa6_tw_i),   .out_p_r(ta2_r),  .out_n_r(tb2_r),  .out_p_i(ta2_i),  .out_n_i(tb2_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_ta4    (   .in_r_0_8(sa3_tw_r), .in_i_0_8(sa3_tw_i), .in_r_8_16(sa7_tw_r),  .in_i_8_16(sa7_tw_i),   .out_p_r(ta3_r),  .out_n_r(tb3_r),  .out_p_i(ta3_i),  .out_n_i(tb3_i)  );
    
    //sb -> tc & td

    but_complex #(IN_W, OUT_W) ii_but8_tb1    (   .in_r_0_8(sb0_tw_r), .in_i_0_8(sb0_tw_i), .in_r_8_16(sb4_tw_r),  .in_i_8_16(sb4_tw_i),  .out_p_r(tc0_r),  .out_n_r(td0_r),  .out_p_i(tc0_i),  .out_n_i(td0_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_tb2    (   .in_r_0_8(sb1_tw_r), .in_i_0_8(sb1_tw_i), .in_r_8_16(sb5_tw_r),  .in_i_8_16(sb5_tw_i),  .out_p_r(tc1_r),  .out_n_r(td1_r),  .out_p_i(tc1_i),  .out_n_i(td1_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_tb3    (   .in_r_0_8(sb2_tw_r), .in_i_0_8(sb2_tw_i), .in_r_8_16(sb6_tw_r),  .in_i_8_16(sb6_tw_i),  .out_p_r(tc2_r),  .out_n_r(td2_r),  .out_p_i(tc2_i),  .out_n_i(td2_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_tb4    (   .in_r_0_8(sb3_tw_r), .in_i_0_8(sb3_tw_i), .in_r_8_16(sb7_tw_r),  .in_i_8_16(sb7_tw_i),  .out_p_r(tc3_r),  .out_n_r(td3_r),  .out_p_i(tc3_i),  .out_n_i(td3_i)  );
    
    //sc -> te & tf//

    but_complex #(IN_W, OUT_W) ii_but8_te1    (   .in_r_0_8(sc0_tw_r), .in_i_0_8(sc0_tw_i), .in_r_8_16(sc4_tw_r),  .in_i_8_16(sc4_tw_i),  .out_p_r(te0_r),  .out_n_r(tf0_r),  .out_p_i(te0_i),  .out_n_i(tf0_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_te2    (   .in_r_0_8(sc1_tw_r), .in_i_0_8(sc1_tw_i), .in_r_8_16(sc5_tw_r),  .in_i_8_16(sc5_tw_i),  .out_p_r(te1_r),  .out_n_r(tf1_r),  .out_p_i(te1_i),  .out_n_i(tf1_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_te3    (   .in_r_0_8(sc2_tw_r), .in_i_0_8(sc2_tw_i), .in_r_8_16(sc6_tw_r),  .in_i_8_16(sc6_tw_i),  .out_p_r(te2_r),  .out_n_r(tf2_r),  .out_p_i(te2_i),  .out_n_i(tf2_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_te4    (   .in_r_0_8(sc3_tw_r), .in_i_0_8(sc3_tw_i), .in_r_8_16(sc7_tw_r),  .in_i_8_16(sc7_tw_i),  .out_p_r(te3_r),  .out_n_r(tf3_r),  .out_p_i(te3_i),  .out_n_i(tf3_i)  );

    //sd -> tg & th

    but_complex #(IN_W, OUT_W) ii_but8_tg1    (   .in_r_0_8(sd0_tw_r), .in_i_0_8(sd0_tw_i), .in_r_8_16(sd4_tw_r),  .in_i_8_16(sd4_tw_i),   .out_p_r(tg0_r),  .out_n_r(th0_r),  .out_p_i(tg0_i),  .out_n_i(th0_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_tg2    (   .in_r_0_8(sd1_tw_r), .in_i_0_8(sd1_tw_i), .in_r_8_16(sd5_tw_r),  .in_i_8_16(sd5_tw_i),   .out_p_r(tg1_r),  .out_n_r(th1_r),  .out_p_i(tg1_i),  .out_n_i(th1_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_tg3    (   .in_r_0_8(sd2_tw_r), .in_i_0_8(sd2_tw_i), .in_r_8_16(sd6_tw_r),  .in_i_8_16(sd6_tw_i),   .out_p_r(tg2_r),  .out_n_r(th2_r),  .out_p_i(tg2_i),  .out_n_i(th2_i)  );
    but_complex #(IN_W, OUT_W) ii_but8_tg4    (   .in_r_0_8(sd3_tw_r), .in_i_0_8(sd3_tw_i), .in_r_8_16(sd7_tw_r),  .in_i_8_16(sd7_tw_i),   .out_p_r(tg3_r),  .out_n_r(th3_r),  .out_p_i(tg3_i),  .out_n_i(th3_i)  );





endmodule
