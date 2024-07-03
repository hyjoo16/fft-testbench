
//////////////////////////////////////////
//	DFT_8to4				//
//	Author : KHLEE93			//
//	Update : 2022		                    
//////////////////////////////////////////



`timescale 1ns/1fs
module dft_32to16 #(parameter IN_W = 8, OUT_W = 8)(
    //input//

    input   wire    signed  [IN_W-1:0]   x0_r,   	
    input   wire    signed  [IN_W-1:0]   x1_r,   	
    input   wire    signed  [IN_W-1:0]   x2_r,   	
    input   wire    signed  [IN_W-1:0]   x3_r,   	
    input   wire    signed  [IN_W-1:0]   x4_r,   	
    input   wire    signed  [IN_W-1:0]   x5_r,   	
    input   wire    signed  [IN_W-1:0]   x6_r,   	
    input   wire    signed  [IN_W-1:0]   x7_r,   	
    input   wire    signed  [IN_W-1:0]   x8_r,   	
    input   wire    signed  [IN_W-1:0]   x9_r,   	
    input   wire    signed  [IN_W-1:0]   x10_r,  	
    input   wire    signed  [IN_W-1:0]   x11_r,  	
    input   wire    signed  [IN_W-1:0]   x12_r,  	
    input   wire    signed  [IN_W-1:0]   x13_r,  	
    input   wire    signed  [IN_W-1:0]   x14_r,  	
    input   wire    signed  [IN_W-1:0]   x15_r,  	
    input   wire    signed  [IN_W-1:0]   x16_r,  	
    input   wire    signed  [IN_W-1:0]   x17_r,  	
    input   wire    signed  [IN_W-1:0]   x18_r,  	
    input   wire    signed  [IN_W-1:0]   x19_r,  	
    input   wire    signed  [IN_W-1:0]   x20_r,  	
    input   wire    signed  [IN_W-1:0]   x21_r,  	
    input   wire    signed  [IN_W-1:0]   x22_r,  	
    input   wire    signed  [IN_W-1:0]   x23_r,  	
    input   wire    signed  [IN_W-1:0]   x24_r,  	
    input   wire    signed  [IN_W-1:0]   x25_r,  	
    input   wire    signed  [IN_W-1:0]   x26_r,  	
    input   wire    signed  [IN_W-1:0]   x27_r,  	
    input   wire    signed  [IN_W-1:0]   x28_r,  	
    input   wire    signed  [IN_W-1:0]   x29_r,  	
    input   wire    signed  [IN_W-1:0]   x30_r,  	
    input   wire    signed  [IN_W-1:0]   x31_r,  	

    //output//
    output  wire    signed  [OUT_W-1:0]   fa0_r, 
    output  wire    signed  [OUT_W-1:0]   fa1_r, 
    output  wire    signed  [OUT_W-1:0]   fa2_r, 
    output  wire    signed  [OUT_W-1:0]   fa3_r, 
    output  wire    signed  [OUT_W-1:0]   fa4_r, 
    output  wire    signed  [OUT_W-1:0]   fa5_r, 
    output  wire    signed  [OUT_W-1:0]   fa6_r, 
    output  wire    signed  [OUT_W-1:0]   fa7_r, 
    output  wire    signed  [OUT_W-1:0]   fa8_r, 
    output  wire    signed  [OUT_W-1:0]   fa9_r, 
    output  wire    signed  [OUT_W-1:0]   fa10_r,
    output  wire    signed  [OUT_W-1:0]   fa11_r,
    output  wire    signed  [OUT_W-1:0]   fa12_r,
    output  wire    signed  [OUT_W-1:0]   fa13_r,
    output  wire    signed  [OUT_W-1:0]   fa14_r,
    output  wire    signed  [OUT_W-1:0]   fa15_r,

    output  wire    signed  [OUT_W-1:0]   fb0_r, 
    output  wire    signed  [OUT_W-1:0]   fb1_r, 
    output  wire    signed  [OUT_W-1:0]   fb2_r, 
    output  wire    signed  [OUT_W-1:0]   fb3_r, 
    output  wire    signed  [OUT_W-1:0]   fb4_r, 
    output  wire    signed  [OUT_W-1:0]   fb5_r, 
    output  wire    signed  [OUT_W-1:0]   fb6_r, 
    output  wire    signed  [OUT_W-1:0]   fb7_r, 
    output  wire    signed  [OUT_W-1:0]   fb8_r, 
    output  wire    signed  [OUT_W-1:0]   fb9_r, 
    output  wire    signed  [OUT_W-1:0]   fb10_r,
    output  wire    signed  [OUT_W-1:0]   fb11_r,
    output  wire    signed  [OUT_W-1:0]   fb12_r,
    output  wire    signed  [OUT_W-1:0]   fb13_r,
    output  wire    signed  [OUT_W-1:0]   fb14_r,
    output  wire    signed  [OUT_W-1:0]   fb15_r

	);

    but_real #(IN_W, OUT_W)  i_cal_1    (   .in_r_0_16(x0_r),  .in_r_16_32(x16_r),  .out_p_r(fa0_r),  .out_n_r(fb0_r)    );
    but_real #(IN_W, OUT_W) i_cal_2    (   .in_r_0_16(x1_r),  .in_r_16_32(x17_r),  .out_p_r(fa1_r),  .out_n_r(fb1_r)    );
    but_real #(IN_W, OUT_W) i_cal_3    (   .in_r_0_16(x2_r),  .in_r_16_32(x18_r),  .out_p_r(fa2_r),  .out_n_r(fb2_r)    );
    but_real #(IN_W, OUT_W) i_cal_4    (   .in_r_0_16(x3_r),  .in_r_16_32(x19_r),  .out_p_r(fa3_r),  .out_n_r(fb3_r)    );
    but_real #(IN_W, OUT_W) i_cal_5    (   .in_r_0_16(x4_r),  .in_r_16_32(x20_r),  .out_p_r(fa4_r),  .out_n_r(fb4_r)    );
    but_real #(IN_W, OUT_W) i_cal_6    (   .in_r_0_16(x5_r),  .in_r_16_32(x21_r),  .out_p_r(fa5_r),  .out_n_r(fb5_r)    );
    but_real #(IN_W, OUT_W) i_cal_7    (   .in_r_0_16(x6_r),  .in_r_16_32(x22_r),  .out_p_r(fa6_r),  .out_n_r(fb6_r)    );
    but_real #(IN_W, OUT_W) i_cal_8    (   .in_r_0_16(x7_r),  .in_r_16_32(x23_r),  .out_p_r(fa7_r),  .out_n_r(fb7_r)    );
    but_real #(IN_W, OUT_W) i_cal_9    (   .in_r_0_16(x8_r),  .in_r_16_32(x24_r),  .out_p_r(fa8_r),  .out_n_r(fb8_r)    );
    but_real #(IN_W, OUT_W) i_cal_10    (   .in_r_0_16(x9_r), .in_r_16_32(x25_r),  .out_p_r(fa9_r),  .out_n_r(fb9_r)    );
    but_real #(IN_W, OUT_W) i_cal_11    (   .in_r_0_16(x10_r),  .in_r_16_32(x26_r),  .out_p_r(fa10_r),  .out_n_r(fb10_r));
    but_real #(IN_W, OUT_W) i_cal_12    (   .in_r_0_16(x11_r),  .in_r_16_32(x27_r),  .out_p_r(fa11_r),  .out_n_r(fb11_r));
    but_real #(IN_W, OUT_W) i_cal_13    (   .in_r_0_16(x12_r),  .in_r_16_32(x28_r),  .out_p_r(fa12_r),  .out_n_r(fb12_r));
    but_real #(IN_W, OUT_W) i_cal_14    (   .in_r_0_16(x13_r),  .in_r_16_32(x29_r),  .out_p_r(fa13_r),  .out_n_r(fb13_r));
    but_real #(IN_W, OUT_W) i_cal_15    (   .in_r_0_16(x14_r),  .in_r_16_32(x30_r),  .out_p_r(fa14_r),  .out_n_r(fb14_r));
    but_real #(IN_W, OUT_W) i_cal_16    (   .in_r_0_16(x15_r),  .in_r_16_32(x31_r),  .out_p_r(fa15_r),  .out_n_r(fb15_r));


endmodule







