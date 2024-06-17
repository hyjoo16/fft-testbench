
`timescale 1ns/1fs
module dft_4to2(
    //twiddle factor//
    input   wire    signed  [9:0]   w12_i ,
    input   wire    signed  [9:0]    w8_i ,
    input   wire    signed  [9:0]    w4_i ,
    input   wire    signed  [9:0]    w0_i ,



    input   wire    signed  [9:0]   w0_r , 
    input   wire    signed  [9:0]   w4_r , 
    input   wire    signed  [9:0]   w8_r , 
    input   wire    signed  [9:0]   w12_r,
    
    input   wire    signed  [19:0]  trun, 
    input   wire    signed  [26:0]  trun_mu_16, 
    
    //input//
    input   wire    signed  [15:0]   ta0_r,  ta0_i,
    input   wire    signed  [15:0]   ta1_r,  ta1_i,
    input   wire    signed  [15:0]   ta2_r,  ta2_i,
    input   wire    signed  [15:0]   ta3_r,  ta3_i,
    
    input   wire    signed  [15:0]   tb0_r,  tb0_i,
    input   wire    signed  [15:0]   tb1_r,  tb1_i,
    input   wire    signed  [15:0]   tb2_r,  tb2_i,
    input   wire    signed  [15:0]   tb3_r,  tb3_i,
    
    input   wire    signed  [15:0]   tc0_r,  tc0_i,
    input   wire    signed  [15:0]   tc1_r,  tc1_i,
    input   wire    signed  [15:0]   tc2_r,  tc2_i,
    input   wire    signed  [15:0]   tc3_r,  tc3_i,
    
    input   wire    signed  [15:0]   td0_r,  td0_i,
    input   wire    signed  [15:0]   td1_r,  td1_i,
    input   wire    signed  [15:0]   td2_r,  td2_i,
    input   wire    signed  [15:0]   td3_r,  td3_i,
    
    input   wire    signed  [15:0]   te0_r,  te0_i,
    input   wire    signed  [15:0]   te1_r,  te1_i,
    input   wire    signed  [15:0]   te2_r,  te2_i,
    input   wire    signed  [15:0]   te3_r,  te3_i,
    
    input   wire    signed  [15:0]   tf0_r,  tf0_i,
    input   wire    signed  [15:0]   tf1_r,  tf1_i,
    input   wire    signed  [15:0]   tf2_r,  tf2_i,
    input   wire    signed  [15:0]   tf3_r,  tf3_i,
    
    input   wire    signed  [15:0]   tg0_r,  tg0_i,
    input   wire    signed  [15:0]   tg1_r,  tg1_i,
    input   wire    signed  [15:0]   tg2_r,  tg2_i,
    input   wire    signed  [15:0]   tg3_r,  tg3_i,
    
    input   wire    signed  [15:0]   th0_r,  th0_i,
    input   wire    signed  [15:0]   th1_r,  th1_i,
    input   wire    signed  [15:0]   th2_r,  th2_i,
    input   wire    signed  [15:0]   th3_r,  th3_i,
    
    //output//
    
    
    output   wire    signed  [15:0]   fa0_r,  fa0_i,
    output   wire    signed  [15:0]   fa1_r,  fa1_i,
    
    output   wire    signed  [15:0]   fb0_r,  fb0_i,
    output   wire    signed  [15:0]   fb1_r,  fb1_i,
    
    output   wire    signed  [15:0]   fc0_r,  fc0_i,
    output   wire    signed  [15:0]   fc1_r,  fc1_i,
    
    output   wire    signed  [15:0]   fd0_r,  fd0_i,
    output   wire    signed  [15:0]   fd1_r,  fd1_i,
    
    output   wire    signed  [15:0]   fe0_r,  fe0_i,
    output   wire    signed  [15:0]   fe1_r,  fe1_i,
   
    output   wire    signed  [15:0]   ff0_r,  ff0_i,
    output   wire    signed  [15:0]   ff1_r,  ff1_i,
   
    output   wire    signed  [15:0]   fg0_r,  fg0_i,
    output   wire    signed  [15:0]   fg1_r,  fg1_i,
   
    output   wire    signed  [15:0]   fh0_r,  fh0_i,
    output   wire    signed  [15:0]   fh1_r,  fh1_i,
   
    output   wire    signed  [15:0]   fi0_r,  fi0_i,
    output   wire    signed  [15:0]   fi1_r,  fi1_i,
    
    output   wire    signed  [15:0]   fj0_r,  fj0_i,
    output   wire    signed  [15:0]   fj1_r,  fj1_i,
    
    output   wire    signed  [15:0]   fk0_r,  fk0_i,
    output   wire    signed  [15:0]   fk1_r,  fk1_i,
    
    output   wire    signed  [15:0]   fl0_r,  fl0_i,
    output   wire    signed  [15:0]   fl1_r,  fl1_i,
    
    output   wire    signed  [15:0]   fm0_r,  fm0_i,
    output   wire    signed  [15:0]   fm1_r,  fm1_i,
    
    output   wire    signed  [15:0]   fn0_r,  fn0_i,
    output   wire    signed  [15:0]   fn1_r,  fn1_i,
   
    output   wire    signed  [15:0]   fo0_r,  fo0_i,
    output   wire    signed  [15:0]   fo1_r,  fo1_i,
   
    output   wire    signed  [15:0]   fp0_r,  fp0_i,
    output   wire    signed  [15:0]   fp1_r,  fp1_i
    
    );

    //twiddle factor multiplication//
    wire    signed  [14:0]   ta0_tw_r,  ta0_tw_i;
    wire    signed  [14:0]   ta1_tw_r,  ta1_tw_i;
    wire    signed  [14:0]   ta2_tw_r,  ta2_tw_i;
    wire    signed  [14:0]   ta3_tw_r,  ta3_tw_i;
    
    
    wire    signed  [14:0]   tc0_tw_r,  tc0_tw_i;
    wire    signed  [14:0]   tc1_tw_r,  tc1_tw_i;
    wire    signed  [14:0]   tc2_tw_r,  tc2_tw_i;
    wire    signed  [14:0]   tc3_tw_r,  tc3_tw_i;
    
    
    wire    signed  [14:0]   te0_tw_r,  te0_tw_i;
    wire    signed  [14:0]   te1_tw_r,  te1_tw_i;
    wire    signed  [14:0]   te2_tw_r,  te2_tw_i;
    wire    signed  [14:0]   te3_tw_r,  te3_tw_i;
    
    
    wire    signed  [14:0]   tg0_tw_r,  tg0_tw_i;
    wire    signed  [14:0]   tg1_tw_r,  tg1_tw_i;
    wire    signed  [14:0]   tg2_tw_r,  tg2_tw_i;
    wire    signed  [14:0]   tg3_tw_r,  tg3_tw_i;

    
    wire    signed  [14:0]   tb0_tw_r,  tb0_tw_i;
    wire    signed  [14:0]   tb1_tw_r,  tb1_tw_i;
    wire    signed  [14:0]   tb2_tw_r,  tb2_tw_i;
    wire    signed  [14:0]   tb3_tw_r,  tb3_tw_i;
    
    
    wire    signed  [14:0]   td0_tw_r,  td0_tw_i;
    wire    signed  [14:0]   td1_tw_r,  td1_tw_i;
    wire    signed  [14:0]   td2_tw_r,  td2_tw_i;
    wire    signed  [14:0]   td3_tw_r,  td3_tw_i;
    
    
    wire    signed  [14:0]   tf0_tw_r,  tf0_tw_i;
    wire    signed  [14:0]   tf1_tw_r,  tf1_tw_i;
    wire    signed  [14:0]   tf2_tw_r,  tf2_tw_i;
    wire    signed  [14:0]   tf3_tw_r,  tf3_tw_i;
    
    
    wire    signed  [14:0]   th0_tw_r,  th0_tw_i;
    wire    signed  [14:0]   th1_tw_r,  th1_tw_i;
    wire    signed  [14:0]   th2_tw_r,  th2_tw_i;
    wire    signed  [14:0]   th3_tw_r,  th3_tw_i;


    //twiddle multiplication //
     //multiplier_16_tw   iii_mu_1ta       (   .x_r(ta0_r),    .x_i(ta0_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(ta0_tw_r),    .out_i(ta0_tw_i) ); 
     //multiplier_16_tw   iii_mu_2ta       (   .x_r(ta1_r),    .x_i(ta1_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(ta1_tw_r),    .out_i(ta1_tw_i) ); 
     //multiplier_16_tw   iii_mu_3ta       (   .x_r(ta2_r),    .x_i(ta2_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(ta2_tw_r),    .out_i(ta2_tw_i) ); 
     //multiplier_16_tw   iii_mu_4ta       (   .x_r(ta3_r),    .x_i(ta3_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(ta3_tw_r),    .out_i(ta3_tw_i) ); 
     //
     //multiplier_16_tw   iii_mu_1tc       (   .x_r(tc0_r),    .x_i(tc0_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(tc0_tw_r),    .out_i(tc0_tw_i) ); 
     //multiplier_16_tw   iii_mu_2tc       (   .x_r(tc1_r),    .x_i(tc1_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(tc1_tw_r),    .out_i(tc1_tw_i) ); 
     //multiplier_16_tw   iii_mu_3tc       (   .x_r(tc2_r),    .x_i(tc2_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(tc2_tw_r),    .out_i(tc2_tw_i) ); 
     //multiplier_16_tw   iii_mu_4tc       (   .x_r(tc3_r),    .x_i(tc3_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(tc3_tw_r),    .out_i(tc3_tw_i) ); 

     //multiplier_16_tw   iii_mu_1te       (   .x_r(te0_r),    .x_i(te0_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(te0_tw_r),    .out_i(te0_tw_i) ); 
     //multiplier_16_tw   iii_mu_2te       (   .x_r(te1_r),    .x_i(te1_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(te1_tw_r),    .out_i(te1_tw_i) ); 
     //multiplier_16_tw   iii_mu_3te       (   .x_r(te2_r),    .x_i(te2_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(te2_tw_r),    .out_i(te2_tw_i) ); 
     //multiplier_16_tw   iii_mu_4te       (   .x_r(te3_r),    .x_i(te3_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(te3_tw_r),    .out_i(te3_tw_i) ); 

     //multiplier_16_tw   iii_mu_1tg       (   .x_r(tg0_r),    .x_i(tg0_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(tg0_tw_r),    .out_i(tg0_tw_i) ); 
     //multiplier_16_tw   iii_mu_2tg       (   .x_r(tg1_r),    .x_i(tg1_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(tg1_tw_r),    .out_i(tg1_tw_i) ); 
     //multiplier_16_tw   iii_mu_3tg       (   .x_r(tg2_r),    .x_i(tg2_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(tg2_tw_r),    .out_i(tg2_tw_i) ); 
     //multiplier_16_tw   iii_mu_4tg       (   .x_r(tg3_r),    .x_i(tg3_i),  .w_r(w0_r),  .w_i(10'b0),  .trun_mu_16(trun_mu_16),    .out_r(tg3_tw_r),    .out_i(tg3_tw_i) ); 

     
    assign  ta0_tw_r    =   ({ta0_r[15],ta0_r[15:2]});
    assign  ta1_tw_r    =   ({ta1_r[15],ta1_r[15:2]});
    assign  ta2_tw_r    =   ({ta2_r[15],ta2_r[15:2]});
    assign  ta3_tw_r    =   ({ta3_r[15],ta3_r[15:2]});

    assign  tc0_tw_r    =   ({tc0_r[15],tc0_r[15:2]});
    assign  tc1_tw_r    =   ({tc1_r[15],tc1_r[15:2]});
    assign  tc2_tw_r    =   ({tc2_r[15],tc2_r[15:2]});
    assign  tc3_tw_r    =   ({tc3_r[15],tc3_r[15:2]});

    assign  te0_tw_r    =   ({te0_r[15],te0_r[15:2]});
    assign  te1_tw_r    =   ({te1_r[15],te1_r[15:2]});
    assign  te2_tw_r    =   ({te2_r[15],te2_r[15:2]});
    assign  te3_tw_r    =   ({te3_r[15],te3_r[15:2]});

    assign  tg0_tw_r    =   ({tg0_r[15],tg0_r[15:2]});
    assign  tg1_tw_r    =   ({tg1_r[15],tg1_r[15:2]});
    assign  tg2_tw_r    =   ({tg2_r[15],tg2_r[15:2]});
    assign  tg3_tw_r    =   ({tg3_r[15],tg3_r[15:2]});
    
    assign  ta0_tw_i    =   ({ta0_i[15],ta0_i[15:2]});
    assign  ta1_tw_i    =   ({ta1_i[15],ta1_i[15:2]});
    assign  ta2_tw_i    =   ({ta2_i[15],ta2_i[15:2]});
    assign  ta3_tw_i    =   ({ta3_i[15],ta3_i[15:2]});

    assign  tc0_tw_i    =   ({tc0_i[15],tc0_i[15:2]});
    assign  tc1_tw_i    =   ({tc1_i[15],tc1_i[15:2]});
    assign  tc2_tw_i    =   ({tc2_i[15],tc2_i[15:2]});
    assign  tc3_tw_i    =   ({tc3_i[15],tc3_i[15:2]});

    assign  te0_tw_i    =   ({te0_i[15],te0_i[15:2]});
    assign  te1_tw_i    =   ({te1_i[15],te1_i[15:2]});
    assign  te2_tw_i    =   ({te2_i[15],te2_i[15:2]});
    assign  te3_tw_i    =   ({te3_i[15],te3_i[15:2]});

    assign  tg0_tw_i    =   ({tg0_i[15],tg0_i[15:2]});
    assign  tg1_tw_i    =   ({tg1_i[15],tg1_i[15:2]});
    assign  tg2_tw_i    =   ({tg2_i[15],tg2_i[15:2]});
    assign  tg3_tw_i    =   ({tg3_i[15],tg3_i[15:2]});
     multiplier_16_tw   iii_mu_1tb       (   .x_r(tb0_r),    .x_i(tb0_i),  .w_r(w0_r),  .w_i(w0_i),  .trun_mu_16(trun_mu_16),    .out_r(tb0_tw_r),    .out_i(tb0_tw_i) ); 
     multiplier_16_tw   iii_mu_2tb       (   .x_r(tb1_r),    .x_i(tb1_i),  .w_r(w4_r),  .w_i(w4_i),  .trun_mu_16(trun_mu_16),    .out_r(tb1_tw_r),    .out_i(tb1_tw_i) ); 
     multiplier_16_tw   iii_mu_3tb       (   .x_r(tb2_r),    .x_i(tb2_i),  .w_r(w8_r),  .w_i(w8_i),  .trun_mu_16(trun_mu_16),    .out_r(tb2_tw_r),    .out_i(tb2_tw_i) ); 
     multiplier_16_tw   iii_mu_4tb       (   .x_r(tb3_r),    .x_i(tb3_i),  .w_r(w12_r),  .w_i(w12_i), .trun_mu_16(trun_mu_16),    .out_r(tb3_tw_r),    .out_i(tb3_tw_i) ); 
     
     multiplier_16_tw   iii_mu_1td       (   .x_r(td0_r),    .x_i(td0_i),  .w_r(w0_r),  .w_i(w0_i),  .trun_mu_16(trun_mu_16),    .out_r(td0_tw_r),    .out_i(td0_tw_i) ); 
     multiplier_16_tw   iii_mu_2td       (   .x_r(td1_r),    .x_i(td1_i),  .w_r(w4_r),  .w_i(w4_i),  .trun_mu_16(trun_mu_16),    .out_r(td1_tw_r),    .out_i(td1_tw_i) ); 
     multiplier_16_tw   iii_mu_3td       (   .x_r(td2_r),    .x_i(td2_i),  .w_r(w8_r),  .w_i(w8_i),  .trun_mu_16(trun_mu_16),    .out_r(td2_tw_r),    .out_i(td2_tw_i) ); 
     multiplier_16_tw   iii_mu_4td       (   .x_r(td3_r),    .x_i(td3_i),  .w_r(w12_r),  .w_i(w12_i), .trun_mu_16(trun_mu_16),    .out_r(td3_tw_r),    .out_i(td3_tw_i) ); 

     multiplier_16_tw   iii_mu_1tf       (   .x_r(tf0_r),    .x_i(tf0_i),  .w_r(w0_r),  .w_i(w0_i),  .trun_mu_16(trun_mu_16),    .out_r(tf0_tw_r),    .out_i(tf0_tw_i) ); 
     multiplier_16_tw   iii_mu_2tf       (   .x_r(tf1_r),    .x_i(tf1_i),  .w_r(w4_r),  .w_i(w4_i),  .trun_mu_16(trun_mu_16),    .out_r(tf1_tw_r),    .out_i(tf1_tw_i) ); 
     multiplier_16_tw   iii_mu_3tf       (   .x_r(tf2_r),    .x_i(tf2_i),  .w_r(w8_r),  .w_i(w8_i),  .trun_mu_16(trun_mu_16),    .out_r(tf2_tw_r),    .out_i(tf2_tw_i) ); 
     multiplier_16_tw   iii_mu_4tf       (   .x_r(tf3_r),    .x_i(tf3_i),  .w_r(w12_r),  .w_i(w12_i), .trun_mu_16(trun_mu_16),    .out_r(tf3_tw_r),    .out_i(tf3_tw_i) ); 

     multiplier_16_tw   iii_mu_1th       (   .x_r(th0_r),    .x_i(th0_i),  .w_r(w0_r),  .w_i(w0_i),  .trun_mu_16(trun_mu_16),    .out_r(th0_tw_r),    .out_i(th0_tw_i) ); 
     multiplier_16_tw   iii_mu_2th       (   .x_r(th1_r),    .x_i(th1_i),  .w_r(w4_r),  .w_i(w4_i),  .trun_mu_16(trun_mu_16),    .out_r(th1_tw_r),    .out_i(th1_tw_i) ); 
     multiplier_16_tw   iii_mu_3th       (   .x_r(th2_r),    .x_i(th2_i),  .w_r(w8_r),  .w_i(w8_i),  .trun_mu_16(trun_mu_16),    .out_r(th2_tw_r),    .out_i(th2_tw_i) ); 
     multiplier_16_tw   iii_mu_4th       (   .x_r(th3_r),    .x_i(th3_i),  .w_r(w12_r),  .w_i(w12_i), .trun_mu_16(trun_mu_16),    .out_r(th3_tw_r),    .out_i(th3_tw_i) ); 
    
    
    //ta -> fa & fb//
    
    but_16  ii_but16_ta1    (   .in_r_0_8(ta0_tw_r), .in_i_0_8(ta0_tw_i), .in_r_8_16(ta2_tw_r),  .in_i_8_16(ta2_tw_i),   .out_p_r(fa0_r),  .out_n_r(fb0_r),  .out_p_i(fa0_i),  .out_n_i(fb0_i)  );
    but_16  ii_but16_ta2    (   .in_r_0_8(ta1_tw_r), .in_i_0_8(ta1_tw_i), .in_r_8_16(ta3_tw_r),  .in_i_8_16(ta3_tw_i),   .out_p_r(fa1_r),  .out_n_r(fb1_r),  .out_p_i(fa1_i),  .out_n_i(fb1_i)  );
    
    //tb -> fc & fd
    
    but_16  ii_but16_tb1    (   .in_r_0_8(tb0_tw_r), .in_i_0_8(tb0_tw_i), .in_r_8_16(tb2_tw_r),  .in_i_8_16(tb2_tw_i),  .out_p_r(fc0_r),  .out_n_r(fd0_r),  .out_p_i(fc0_i),  .out_n_i(fd0_i)  );
    but_16  ii_but16_tb2    (   .in_r_0_8(tb1_tw_r), .in_i_0_8(tb1_tw_i), .in_r_8_16(tb3_tw_r),  .in_i_8_16(tb3_tw_i),  .out_p_r(fc1_r),  .out_n_r(fd1_r),  .out_p_i(fc1_i),  .out_n_i(fd1_i)  );
    
    //tc -> fe & ff
    
    but_16  ii_but16_tc1    (   .in_r_0_8(tc0_tw_r), .in_i_0_8(tc0_tw_i), .in_r_8_16(tc2_tw_r),  .in_i_8_16(tc2_tw_i),   .out_p_r(fe0_r),  .out_n_r(ff0_r),  .out_p_i(fe0_i),  .out_n_i(ff0_i)  );
    but_16  ii_but16_tc2    (   .in_r_0_8(tc1_tw_r), .in_i_0_8(tc1_tw_i), .in_r_8_16(tc3_tw_r),  .in_i_8_16(tc3_tw_i),   .out_p_r(fe1_r),  .out_n_r(ff1_r),  .out_p_i(fe1_i),  .out_n_i(ff1_i)  );

    //td -> fg & fh
    
    but_16  ii_but16_td1    (   .in_r_0_8(td0_tw_r), .in_i_0_8(td0_tw_i), .in_r_8_16(td2_tw_r),  .in_i_8_16(td2_tw_i),  .out_p_r(fg0_r),  .out_n_r(fh0_r),  .out_p_i(fg0_i),  .out_n_i(fh0_i)  );
    but_16  ii_but16_td2    (   .in_r_0_8(td1_tw_r), .in_i_0_8(td1_tw_i), .in_r_8_16(td3_tw_r),  .in_i_8_16(td3_tw_i),  .out_p_r(fg1_r),  .out_n_r(fh1_r),  .out_p_i(fg1_i),  .out_n_i(fh1_i)  );



    //te -> fi & fj
    
    but_16  ii_but16_te1    (   .in_r_0_8(te0_tw_r), .in_i_0_8(te0_tw_i), .in_r_8_16(te2_tw_r),  .in_i_8_16(te2_tw_i),   .out_p_r(fi0_r),  .out_n_r(fj0_r),  .out_p_i(fi0_i),  .out_n_i(fj0_i)  );
    but_16  ii_but16_te2    (   .in_r_0_8(te1_tw_r), .in_i_0_8(te1_tw_i), .in_r_8_16(te3_tw_r),  .in_i_8_16(te3_tw_i),   .out_p_r(fi1_r),  .out_n_r(fj1_r),  .out_p_i(fi1_i),  .out_n_i(fj1_i)  );
    
    //tf-> fk & fl
    
    but_16  ii_but16_tf1    (   .in_r_0_8(tf0_tw_r), .in_i_0_8(tf0_tw_i), .in_r_8_16(tf2_tw_r),  .in_i_8_16(tf2_tw_i),   .out_p_r(fk0_r),  .out_n_r(fl0_r),  .out_p_i(fk0_i),  .out_n_i(fl0_i)  );
    but_16  ii_but16_tf2    (   .in_r_0_8(tf1_tw_r), .in_i_0_8(tf1_tw_i), .in_r_8_16(tf3_tw_r),  .in_i_8_16(tf3_tw_i),   .out_p_r(fk1_r),  .out_n_r(fl1_r),  .out_p_i(fk1_i),  .out_n_i(fl1_i)  );

    //tg-> fm & fn
    
    but_16  ii_but16_tg1    (   .in_r_0_8(tg0_tw_r), .in_i_0_8(tg0_tw_i), .in_r_8_16(tg2_tw_r),  .in_i_8_16(tg2_tw_i),   .out_p_r(fm0_r),  .out_n_r(fn0_r),  .out_p_i(fm0_i),  .out_n_i(fn0_i)  );
    but_16  ii_but16_tg2    (   .in_r_0_8(tg1_tw_r), .in_i_0_8(tg1_tw_i), .in_r_8_16(tg3_tw_r),  .in_i_8_16(tg3_tw_i),   .out_p_r(fm1_r),  .out_n_r(fn1_r),  .out_p_i(fm1_i),  .out_n_i(fn1_i)  );

    //tg-> fm & fn
    
    but_16  ii_but16_th1    (   .in_r_0_8(th0_tw_r), .in_i_0_8(th0_tw_i), .in_r_8_16(th2_tw_r),  .in_i_8_16(th2_tw_i),   .out_p_r(fo0_r),  .out_n_r(fp0_r),  .out_p_i(fo0_i),  .out_n_i(fp0_i)  );
    but_16  ii_but16_th2    (   .in_r_0_8(th1_tw_r), .in_i_0_8(th1_tw_i), .in_r_8_16(th3_tw_r),  .in_i_8_16(th3_tw_i),   .out_p_r(fo1_r),  .out_n_r(fp1_r),  .out_p_i(fo1_i),  .out_n_i(fp1_i)  );


endmodule
