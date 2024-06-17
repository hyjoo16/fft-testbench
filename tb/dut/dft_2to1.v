
`timescale 1ns/1fs
module dft_2to1(

    input   wire    signed  [9:0]   w0_r,
    input   wire    signed  [9:0]   w8_r,
    input   wire    signed  [9:0]   w0_i,
    input   wire    signed  [9:0]   w8_i,
    
    //input//
    input   wire    signed  [26:0]  trun_mu_16,

    input   wire    signed  [15:0]   fa0_r,  fa0_i,
    input   wire    signed  [15:0]   fa1_r,  fa1_i,
    input   wire    signed  [15:0]   fb0_r,  fb0_i,
    input   wire    signed  [15:0]   fb1_r,  fb1_i,
    input   wire    signed  [15:0]   fc0_r,  fc0_i,
    input   wire    signed  [15:0]   fc1_r,  fc1_i,
    input   wire    signed  [15:0]   fd0_r,  fd0_i,
    input   wire    signed  [15:0]   fd1_r,  fd1_i,
    input   wire    signed  [15:0]   fe0_r,  fe0_i,
    input   wire    signed  [15:0]   fe1_r,  fe1_i,
    input   wire    signed  [15:0]   ff0_r,  ff0_i,
    input   wire    signed  [15:0]   ff1_r,  ff1_i,
    input   wire    signed  [15:0]   fg0_r,  fg0_i,
    input   wire    signed  [15:0]   fg1_r,  fg1_i,
    input   wire    signed  [15:0]   fh0_r,  fh0_i,
    input   wire    signed  [15:0]   fh1_r,  fh1_i,
    input   wire    signed  [15:0]   fi0_r,  fi0_i,
    input   wire    signed  [15:0]   fi1_r,  fi1_i,
    input   wire    signed  [15:0]   fj0_r,  fj0_i,
    input   wire    signed  [15:0]   fj1_r,  fj1_i,
    input   wire    signed  [15:0]   fk0_r,  fk0_i,
    input   wire    signed  [15:0]   fk1_r,  fk1_i,
    input   wire    signed  [15:0]   fl0_r,  fl0_i,
    input   wire    signed  [15:0]   fl1_r,  fl1_i,
    input   wire    signed  [15:0]   fm0_r,  fm0_i,
    input   wire    signed  [15:0]   fm1_r,  fm1_i,
    input   wire    signed  [15:0]   fn0_r,  fn0_i,
    input   wire    signed  [15:0]   fn1_r,  fn1_i,
    input   wire    signed  [15:0]   fo0_r,  fo0_i,
    input   wire    signed  [15:0]   fo1_r,  fo1_i,
    input   wire    signed  [15:0]   fp0_r,  fp0_i,
    input   wire    signed  [15:0]   fp1_r,  fp1_i,
    
    //output//
    
    output  wire    signed  [15:0]   fft_out_0_r,  
    output  wire    signed  [15:0]   fft_out_1_r,  
    output  wire    signed  [15:0]   fft_out_2_r,  
    output  wire    signed  [15:0]   fft_out_3_r,  
    output  wire    signed  [15:0]   fft_out_4_r,  
    output  wire    signed  [15:0]   fft_out_5_r,  
    output  wire    signed  [15:0]   fft_out_6_r,  
    output  wire    signed  [15:0]   fft_out_7_r,  
    output  wire    signed  [15:0]   fft_out_8_r,  
    output  wire    signed  [15:0]   fft_out_9_r,  
    output  wire    signed  [15:0]   fft_out_10_r,  
    output  wire    signed  [15:0]   fft_out_11_r,  
    output  wire    signed  [15:0]   fft_out_12_r,  
    output  wire    signed  [15:0]   fft_out_13_r,  
    output  wire    signed  [15:0]   fft_out_14_r,  
    output  wire    signed  [15:0]   fft_out_15_r,  
    output  wire    signed  [15:0]   fft_out_16_r,  
    output  wire    signed  [15:0]   fft_out_17_r,  
    output  wire    signed  [15:0]   fft_out_18_r,  
    output  wire    signed  [15:0]   fft_out_19_r,  
    output  wire    signed  [15:0]   fft_out_20_r,  
    output  wire    signed  [15:0]   fft_out_21_r,  
    output  wire    signed  [15:0]   fft_out_22_r,  
    output  wire    signed  [15:0]   fft_out_23_r,  
    output  wire    signed  [15:0]   fft_out_24_r,  
    output  wire    signed  [15:0]   fft_out_25_r,  
    output  wire    signed  [15:0]   fft_out_26_r,  
    output  wire    signed  [15:0]   fft_out_27_r,  
    output  wire    signed  [15:0]   fft_out_28_r,  
    output  wire    signed  [15:0]   fft_out_29_r,  
    output  wire    signed  [15:0]   fft_out_30_r,  
    output  wire    signed  [15:0]   fft_out_31_r,  
    
    output  wire    signed  [15:0]   fft_out_0_i,  
    output  wire    signed  [15:0]   fft_out_1_i,  
    output  wire    signed  [15:0]   fft_out_2_i,  
    output  wire    signed  [15:0]   fft_out_3_i,  
    output  wire    signed  [15:0]   fft_out_4_i,  
    output  wire    signed  [15:0]   fft_out_5_i,  
    output  wire    signed  [15:0]   fft_out_6_i,  
    output  wire    signed  [15:0]   fft_out_7_i,  
    output  wire    signed  [15:0]   fft_out_8_i,  
    output  wire    signed  [15:0]   fft_out_9_i,  
    output  wire    signed  [15:0]   fft_out_10_i,  
    output  wire    signed  [15:0]   fft_out_11_i,  
    output  wire    signed  [15:0]   fft_out_12_i,  
    output  wire    signed  [15:0]   fft_out_13_i,  
    output  wire    signed  [15:0]   fft_out_14_i,  
    output  wire    signed  [15:0]   fft_out_15_i,  
    output  wire    signed  [15:0]   fft_out_16_i,  
    output  wire    signed  [15:0]   fft_out_17_i,  
    output  wire    signed  [15:0]   fft_out_18_i,  
    output  wire    signed  [15:0]   fft_out_19_i,  
    output  wire    signed  [15:0]   fft_out_20_i,  
    output  wire    signed  [15:0]   fft_out_21_i,  
    output  wire    signed  [15:0]   fft_out_22_i,  
    output  wire    signed  [15:0]   fft_out_23_i,  
    output  wire    signed  [15:0]   fft_out_24_i,  
    output  wire    signed  [15:0]   fft_out_25_i,  
    output  wire    signed  [15:0]   fft_out_26_i,  
    output  wire    signed  [15:0]   fft_out_27_i,  
    output  wire    signed  [15:0]   fft_out_28_i,  
    output  wire    signed  [15:0]   fft_out_29_i,  
    output  wire    signed  [15:0]   fft_out_30_i,  
    output  wire    signed  [15:0]   fft_out_31_i  
    
    
    );
    
    wire    signed  [14:0]   fa0_tw_r,  fa0_tw_i;
    wire    signed  [14:0]   fa1_tw_r,  fa1_tw_i;

    wire    signed  [14:0]   fc0_tw_r,  fc0_tw_i;
    wire    signed  [14:0]   fc1_tw_r,  fc1_tw_i;

    wire    signed  [14:0]   fe0_tw_r,  fe0_tw_i;
    wire    signed  [14:0]   fe1_tw_r,  fe1_tw_i;

    wire    signed  [14:0]   fg0_tw_r,  fg0_tw_i;
    wire    signed  [14:0]   fg1_tw_r,  fg1_tw_i;
    
    wire    signed  [14:0]   fi0_tw_r,  fi0_tw_i;
    wire    signed  [14:0]   fi1_tw_r,  fi1_tw_i;
    
    wire    signed  [14:0]   fk0_tw_r,  fk0_tw_i;
    wire    signed  [14:0]   fk1_tw_r,  fk1_tw_i;
    
    wire    signed  [14:0]   fm0_tw_r,  fm0_tw_i;
    wire    signed  [14:0]   fm1_tw_r,  fm1_tw_i;
    
    wire    signed  [14:0]   fo0_tw_r,  fo0_tw_i;
    wire    signed  [14:0]   fo1_tw_r,  fo1_tw_i;

    
    
    
    
    wire    signed  [14:0]   fb0_tw_r,  fb0_tw_i;
    wire    signed  [14:0]   fb1_tw_r,  fb1_tw_i;

    wire    signed  [14:0]   fd0_tw_r,  fd0_tw_i;
    wire    signed  [14:0]   fd1_tw_r,  fd1_tw_i;

    wire    signed  [14:0]   ff0_tw_r,  ff0_tw_i;
    wire    signed  [14:0]   ff1_tw_r,  ff1_tw_i;

    wire    signed  [14:0]   fh0_tw_r,  fh0_tw_i;
    wire    signed  [14:0]   fh1_tw_r,  fh1_tw_i;
    
    wire    signed  [14:0]   fj0_tw_r,  fj0_tw_i;
    wire    signed  [14:0]   fj1_tw_r,  fj1_tw_i;
    
    wire    signed  [14:0]   fl0_tw_r,  fl0_tw_i;
    wire    signed  [14:0]   fl1_tw_r,  fl1_tw_i;
    
    wire    signed  [14:0]   fn0_tw_r,  fn0_tw_i;
    wire    signed  [14:0]   fn1_tw_r,  fn1_tw_i;
    
    wire    signed  [14:0]   fp0_tw_r,  fp0_tw_i;
    wire    signed  [14:0]   fp1_tw_r,  fp1_tw_i;
    
    
    
    
    
   // multiplier_16_tw   iiacmu16_1       (    .x_r(fa0_r),    .x_i(fa0_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fa0_tw_r),    .out_i(fa0_tw_i) ); 
   // multiplier_16_tw   iiacmu16_2       (    .x_r(fa1_r),    .x_i(fa1_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fa1_tw_r),    .out_i(fa1_tw_i) ); 
   // 
   // multiplier_16_tw   iiacmu16_3       (    .x_r(fc0_r),    .x_i(fc0_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fc0_tw_r),    .out_i(fc0_tw_i) ); 
   // multiplier_16_tw   iiacmu16_4       (    .x_r(fc1_r),    .x_i(fc1_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fc1_tw_r),    .out_i(fc1_tw_i) ); 
   // 
   // multiplier_16_tw   iiacmu16_5       (    .x_r(fe0_r),    .x_i(fe0_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fe0_tw_r),    .out_i(fe0_tw_i) ); 
   // multiplier_16_tw   iiacmu16_6       (    .x_r(fe1_r),    .x_i(fe1_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fe1_tw_r),    .out_i(fe1_tw_i) ); 
   // 
   // multiplier_16_tw   iiacmu16_7       (    .x_r(fg0_r),    .x_i(fg0_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fg0_tw_r),    .out_i(fg0_tw_i) ); 
   // multiplier_16_tw   iiacmu16_8       (    .x_r(fg1_r),    .x_i(fg1_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fg1_tw_r),    .out_i(fg1_tw_i) ); 
   // 
   // multiplier_16_tw   iiacmu16_9       (    .x_r(fi0_r),    .x_i(fi0_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fi0_tw_r),    .out_i(fi0_tw_i) ); 
   // multiplier_16_tw   iiacmu16_10       (   .x_r(fi1_r),    .x_i(fi1_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fi1_tw_r),    .out_i(fi1_tw_i) ); 
   // 
   // multiplier_16_tw   iiacmu16_11       (   .x_r(fk0_r),    .x_i(fk0_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fk0_tw_r),    .out_i(fk0_tw_i) ); 
   // multiplier_16_tw   iiacmu16_12       (   .x_r(fk1_r),    .x_i(fk1_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fk1_tw_r),    .out_i(fk1_tw_i) ); 
   // 
   // multiplier_16_tw   iiacmu16_13       (   .x_r(fm0_r),    .x_i(fm0_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fm0_tw_r),    .out_i(fm0_tw_i) ); 
   // multiplier_16_tw   iiacmu16_14       (   .x_r(fm1_r),    .x_i(fm1_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fm1_tw_r),    .out_i(fm1_tw_i) ); 
   // 
   // multiplier_16_tw   iiacmu16_15       (   .x_r(fo0_r),    .x_i(fo0_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fo0_tw_r),    .out_i(fo0_tw_i) ); 
   // multiplier_16_tw   iiacmu16_16       (   .x_r(fo1_r),    .x_i(fo1_i),  .w_r(w0_r),  .w_i(10'b0), .trun_mu_16(trun_mu_16),     .out_r(fo1_tw_r),    .out_i(fo1_tw_i) ); 
   
    assign      fa0_tw_r    =   ({fa0_r[15],fa0_r[15:2]});
    assign      fa1_tw_r    =   ({fa1_r[15],fa1_r[15:2]});

    assign      fc0_tw_r    =   ({fc0_r[15],fc0_r[15:2]});
    assign      fc1_tw_r    =   ({fc1_r[15],fc1_r[15:2]});
    
    assign      fe0_tw_r    =   ({fe0_r[15],fe0_r[15:2]});
    assign      fe1_tw_r    =   ({fe1_r[15],fe1_r[15:2]});
    
    assign      fg0_tw_r    =   ({fg0_r[15],fg0_r[15:2]});
    assign      fg1_tw_r    =   ({fg1_r[15],fg1_r[15:2]});
   
    assign      fi0_tw_r    =   ({fi0_r[15],fi0_r[15:2]});
    assign      fi1_tw_r    =   ({fi1_r[15],fi1_r[15:2]});

    assign      fk0_tw_r    =   ({fk0_r[15],fk0_r[15:2]});
    assign      fk1_tw_r    =   ({fk1_r[15],fk1_r[15:2]});

    assign      fm0_tw_r    =   ({fm0_r[15],fm0_r[15:2]});
    assign      fm1_tw_r    =   ({fm1_r[15],fm1_r[15:2]});

    assign      fo0_tw_r    =   ({fo0_r[15],fo0_r[15:2]});
    assign      fo1_tw_r    =   ({fo1_r[15],fo1_r[15:2]});

    assign      fa0_tw_i    =   ({fa0_i[15],fa0_i[15:2]});
    assign      fa1_tw_i    =   ({fa1_i[15],fa1_i[15:2]});

    assign      fc0_tw_i    =   ({fc0_i[15],fc0_i[15:2]});
    assign      fc1_tw_i    =   ({fc1_i[15],fc1_i[15:2]});
    
    assign      fe0_tw_i    =   ({fe0_i[15],fe0_i[15:2]});
    assign      fe1_tw_i    =   ({fe1_i[15],fe1_i[15:2]});
    
    assign      fg0_tw_i    =   ({fg0_i[15],fg0_i[15:2]});
    assign      fg1_tw_i    =   ({fg1_i[15],fg1_i[15:2]});
   
    assign      fi0_tw_i    =   ({fi0_i[15],fi0_i[15:2]});
    assign      fi1_tw_i    =   ({fi1_i[15],fi1_i[15:2]});

    assign      fk0_tw_i    =   ({fk0_i[15],fk0_i[15:2]});
    assign      fk1_tw_i    =   ({fk1_i[15],fk1_i[15:2]});

    assign      fm0_tw_i    =   ({fm0_i[15],fm0_i[15:2]});
    assign      fm1_tw_i    =   ({fm1_i[15],fm1_i[15:2]});

    assign      fo0_tw_i    =   ({fo0_i[15],fo0_i[15:2]});
    assign      fo1_tw_i    =   ({fo1_i[15],fo1_i[15:2]});

    multiplier_16_tw   iia_mu16_1       (    .x_r(fb0_r),    .x_i(fb0_i),  .w_r(w0_r),  .w_i(w0_i), .trun_mu_16(trun_mu_16),     .out_r(fb0_tw_r),    .out_i(fb0_tw_i) ); 
    multiplier_16_tw   iia_mu16_2       (    .x_r(fb1_r),    .x_i(fb1_i),  .w_r(w8_r),  .w_i(w8_i), .trun_mu_16(trun_mu_16),     .out_r(fb1_tw_r),    .out_i(fb1_tw_i) ); 
    multiplier_16_tw   iia_mu16_3       (    .x_r(fd0_r),    .x_i(fd0_i),  .w_r(w0_r),  .w_i(w0_i), .trun_mu_16(trun_mu_16),     .out_r(fd0_tw_r),    .out_i(fd0_tw_i) ); 
    multiplier_16_tw   iia_mu16_4       (    .x_r(fd1_r),    .x_i(fd1_i),  .w_r(w8_r),  .w_i(w8_i), .trun_mu_16(trun_mu_16),     .out_r(fd1_tw_r),    .out_i(fd1_tw_i) ); 
    multiplier_16_tw   iia_mu16_5       (    .x_r(ff0_r),    .x_i(ff0_i),  .w_r(w0_r),  .w_i(w0_i), .trun_mu_16(trun_mu_16),     .out_r(ff0_tw_r),    .out_i(ff0_tw_i) ); 
    multiplier_16_tw   iia_mu16_6       (    .x_r(ff1_r),    .x_i(ff1_i),  .w_r(w8_r),  .w_i(w8_i), .trun_mu_16(trun_mu_16),     .out_r(ff1_tw_r),    .out_i(ff1_tw_i) ); 
    multiplier_16_tw   iia_mu16_7       (    .x_r(fh0_r),    .x_i(fh0_i),  .w_r(w0_r),  .w_i(w0_i), .trun_mu_16(trun_mu_16),     .out_r(fh0_tw_r),    .out_i(fh0_tw_i) ); 
    multiplier_16_tw   iia_mu16_8       (    .x_r(fh1_r),    .x_i(fh1_i),  .w_r(w8_r),  .w_i(w8_i), .trun_mu_16(trun_mu_16),     .out_r(fh1_tw_r),    .out_i(fh1_tw_i) ); 
    multiplier_16_tw   iia_mu16_9       (    .x_r(fj0_r),    .x_i(fj0_i),  .w_r(w0_r),  .w_i(w0_i), .trun_mu_16(trun_mu_16),     .out_r(fj0_tw_r),    .out_i(fj0_tw_i) ); 
    multiplier_16_tw   iia_mu16_10       (   .x_r(fj1_r),    .x_i(fj1_i),  .w_r(w8_r),  .w_i(w8_i), .trun_mu_16(trun_mu_16),     .out_r(fj1_tw_r),    .out_i(fj1_tw_i) ); 
    multiplier_16_tw   iia_mu16_11       (   .x_r(fl0_r),    .x_i(fl0_i),  .w_r(w0_r),  .w_i(w0_i), .trun_mu_16(trun_mu_16),     .out_r(fl0_tw_r),    .out_i(fl0_tw_i) ); 
    multiplier_16_tw   iia_mu16_12       (   .x_r(fl1_r),    .x_i(fl1_i),  .w_r(w8_r),  .w_i(w8_i), .trun_mu_16(trun_mu_16),     .out_r(fl1_tw_r),    .out_i(fl1_tw_i) ); 
    multiplier_16_tw   iia_mu16_13       (   .x_r(fn0_r),    .x_i(fn0_i),  .w_r(w0_r),  .w_i(w0_i), .trun_mu_16(trun_mu_16),     .out_r(fn0_tw_r),    .out_i(fn0_tw_i) ); 
    multiplier_16_tw   iia_mu16_14       (   .x_r(fn1_r),    .x_i(fn1_i),  .w_r(w8_r),  .w_i(w8_i), .trun_mu_16(trun_mu_16),     .out_r(fn1_tw_r),    .out_i(fn1_tw_i) ); 
    multiplier_16_tw   iia_mu16_15       (   .x_r(fp0_r),    .x_i(fp0_i),  .w_r(w0_r),  .w_i(w0_i), .trun_mu_16(trun_mu_16),     .out_r(fp0_tw_r),    .out_i(fp0_tw_i) ); 
    multiplier_16_tw   iia_mu16_16       (   .x_r(fp1_r),    .x_i(fp1_i),  .w_r(w8_r),  .w_i(w8_i), .trun_mu_16(trun_mu_16),     .out_r(fp1_tw_r),    .out_i(fp1_tw_i) ); 





    
    
    but_16  iii_but16_x0    (   .in_r_0_8(fa0_tw_r), .in_i_0_8(fa0_tw_i), .in_r_8_16(fa1_tw_r),  .in_i_8_16(fa1_tw_i),   .out_p_r(fft_out_0_r),  .out_n_r(fft_out_16_r),  .out_p_i(fft_out_0_i),  .out_n_i(fft_out_16_i)  );
    
    but_16  iii_but16_x1    (   .in_r_0_8(fb0_tw_r), .in_i_0_8(fb0_tw_i), .in_r_8_16(fb1_tw_r),  .in_i_8_16(fb1_tw_i),   .out_p_r(fft_out_8_r),  .out_n_r(fft_out_24_r),  .out_p_i(fft_out_8_i),  .out_n_i(fft_out_24_i)  );

    but_16  iii_but16_x2    (   .in_r_0_8(fc0_tw_r), .in_i_0_8(fc0_tw_i), .in_r_8_16(fc1_tw_r),  .in_i_8_16(fc1_tw_i),   .out_p_r(fft_out_4_r),  .out_n_r(fft_out_20_r),  .out_p_i(fft_out_4_i),  .out_n_i(fft_out_20_i)  );

    but_16  iii_but16_x3    (   .in_r_0_8(fd0_tw_r), .in_i_0_8(fd0_tw_i), .in_r_8_16(fd1_tw_r),  .in_i_8_16(fd1_tw_i),   .out_p_r(fft_out_12_r),  .out_n_r(fft_out_28_r),  .out_p_i(fft_out_12_i),  .out_n_i(fft_out_28_i)  );

    but_16  iii_but16_x4    (   .in_r_0_8(fe0_tw_r), .in_i_0_8(fe0_tw_i), .in_r_8_16(fe1_tw_r),  .in_i_8_16(fe1_tw_i),   .out_p_r(fft_out_2_r),  .out_n_r(fft_out_18_r),  .out_p_i(fft_out_2_i),  .out_n_i(fft_out_18_i)  );

    but_16  iii_but16_x5    (   .in_r_0_8(ff0_tw_r), .in_i_0_8(ff0_tw_i), .in_r_8_16(ff1_tw_r),  .in_i_8_16(ff1_tw_i),   .out_p_r(fft_out_10_r),  .out_n_r(fft_out_26_r),  .out_p_i(fft_out_10_i),  .out_n_i(fft_out_26_i)  );

    but_16  iii_but16_x6    (   .in_r_0_8(fg0_tw_r), .in_i_0_8(fg0_tw_i), .in_r_8_16(fg1_tw_r),  .in_i_8_16(fg1_tw_i),   .out_p_r(fft_out_6_r),  .out_n_r(fft_out_22_r),  .out_p_i(fft_out_6_i),  .out_n_i(fft_out_22_i)  );

    but_16  iii_but16_x7    (   .in_r_0_8(fh0_tw_r), .in_i_0_8(fh0_tw_i), .in_r_8_16(fh1_tw_r),  .in_i_8_16(fh1_tw_i),   .out_p_r(fft_out_14_r),  .out_n_r(fft_out_30_r),  .out_p_i(fft_out_14_i),  .out_n_i(fft_out_30_i)  );

    but_16  iii_but16_x8    (   .in_r_0_8(fi0_tw_r), .in_i_0_8(fi0_tw_i), .in_r_8_16(fi1_tw_r),  .in_i_8_16(fi1_tw_i),   .out_p_r(fft_out_1_r),  .out_n_r(fft_out_17_r),  .out_p_i(fft_out_1_i),  .out_n_i(fft_out_17_i)  );

    but_16  iii_but16_x9    (   .in_r_0_8(fj0_tw_r), .in_i_0_8(fj0_tw_i), .in_r_8_16(fj1_tw_r),  .in_i_8_16(fj1_tw_i),   .out_p_r(fft_out_9_r),  .out_n_r(fft_out_25_r),  .out_p_i(fft_out_9_i),  .out_n_i(fft_out_25_i)  );

    but_16  iii_but16_x10    (   .in_r_0_8(fk0_tw_r), .in_i_0_8(fk0_tw_i), .in_r_8_16(fk1_tw_r),  .in_i_8_16(fk1_tw_i),    .out_p_r(fft_out_5_r),  .out_n_r(fft_out_21_r),  .out_p_i(fft_out_5_i),  .out_n_i(fft_out_21_i)  );

    but_16  iii_but16_x11   (   .in_r_0_8(fl0_tw_r), .in_i_0_8(fl0_tw_i), .in_r_8_16(fl1_tw_r),  .in_i_8_16(fl1_tw_i),   .out_p_r(fft_out_13_r),  .out_n_r(fft_out_29_r),  .out_p_i(fft_out_13_i),  .out_n_i(fft_out_29_i)  );

    but_16  iii_but16_x12    (   .in_r_0_8(fm0_tw_r), .in_i_0_8(fm0_tw_i), .in_r_8_16(fm1_tw_r),  .in_i_8_16(fm1_tw_i),    .out_p_r(fft_out_3_r),  .out_n_r(fft_out_19_r),  .out_p_i(fft_out_3_i),  .out_n_i(fft_out_19_i)  );

    but_16  iii_but16_x13    (   .in_r_0_8(fn0_tw_r), .in_i_0_8(fn0_tw_i), .in_r_8_16(fn1_tw_r),  .in_i_8_16(fn1_tw_i),    .out_p_r(fft_out_11_r),  .out_n_r(fft_out_27_r),  .out_p_i(fft_out_11_i),  .out_n_i(fft_out_27_i)  );

    but_16  iii_but16_x14    (   .in_r_0_8(fo0_tw_r), .in_i_0_8(fo0_tw_i), .in_r_8_16(fo1_tw_r),  .in_i_8_16(fo1_tw_i),    .out_p_r(fft_out_7_r),  .out_n_r(fft_out_23_r),  .out_p_i(fft_out_7_i),  .out_n_i(fft_out_23_i)  );

    but_16  iii_but16_x15    (   .in_r_0_8(fp0_tw_r), .in_i_0_8(fp0_tw_i), .in_r_8_16(fp1_tw_r),  .in_i_8_16(fp1_tw_i),    .out_p_r(fft_out_15_r),  .out_n_r(fft_out_31_r),  .out_p_i(fft_out_15_i),  .out_n_i(fft_out_31_i)  );


endmodule
