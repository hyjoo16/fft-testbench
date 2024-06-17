
`timescale 1ns/1fs
module multiplier_tw(
    input       signed  [8:0]   x_r,
    input       signed  [8:0]   x_i,
    input       signed  [9:0]   w_r,
    input       signed  [9:0]   w_i,
    input       signed  [19:0]  trun,

    output      signed  [14:0]    out_r,
    output      signed  [14:0]    out_i
	);


            wire    signed  [19:0]  y_i; 
            wire    signed  [19:0]  y_r; 
            wire    signed  [19:0]  y_tr_i; 
            wire    signed  [19:0]  y_tr_r; 


    assign  y_r =   (x_r*w_r) - (x_i*w_i);
    assign  y_i =   (x_r*w_i) + (x_i*w_r);

    assign  y_tr_r  =  (y_r[19] == 1'b0) ? (y_r + trun) : (y_r - trun) ;  
    assign  y_tr_i  =  (y_i[19] == 1'b0) ? (y_i + trun) : (y_i - trun) ;  


    assign  out_r =  ({y_tr_r[19], y_tr_r[16:3]});
    assign  out_i =  ({y_tr_i[19], y_tr_i[16:3]});





endmodule
