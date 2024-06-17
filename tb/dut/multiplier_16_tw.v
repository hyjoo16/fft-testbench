
`timescale 1ns/1fs
module multiplier_16_tw(
    input       signed  [15:0]   x_r,
    input       signed  [15:0]   x_i,
    input       signed  [9:0]   w_r,
    input       signed  [9:0]   w_i,
    input       signed  [26:0]  trun_mu_16,

    output      signed  [14:0]    out_r,
    output      signed  [14:0]    out_i
	);


            wire    signed  [26:0]  y_i; 
            wire    signed  [26:0]  y_r; 
            wire    signed  [26:0]  y_tr_i; 
            wire    signed  [26:0]  y_tr_r; 



    assign  y_r =   (x_r*w_r) - (x_i*w_i);
    assign  y_i =   (x_r*w_i) + (x_i*w_r);

    assign  y_tr_r  =  (y_r[26] == 1'b0) ? (y_r + trun_mu_16) : (y_r - trun_mu_16) ;  
    assign  y_tr_i  =  (y_i[26] == 1'b0) ? (y_i + trun_mu_16) : (y_i - trun_mu_16) ;  


    assign  out_r =  ({y_tr_r[26], y_tr_r[23:10]});
    assign  out_i =  ({y_tr_i[26], y_tr_i[23:10]});





endmodule
