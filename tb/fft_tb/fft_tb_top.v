`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// TB TOP MODULE
// - input : 32 * 8 bit signed integers
// - output: test signals
// 
// TODO: Add intermediate signals to output
//////////////////////////////////////////////////////////////////////////////////


module fft_tb_top #(parameter FFT_IN = 8, FFT_OUT = 13, PWR = 2*FFT_OUT+3, 
                    TW = 10,
                    FFT_16 = 9, FFT_8 = 10, FFT_4 = 11, FFT_2 = 12)(
    input       wire        arstb,
    input       wire        rst_retime,
    input       wire        freeze,
    input       wire        clk_fpga,
    
    input       wire    signed     [7:0]         pw_x0_r_in,    
    input       wire    signed     [7:0]         pw_x1_r_in,     
    input       wire    signed     [7:0]         pw_x2_r_in,     
    input       wire    signed     [7:0]         pw_x3_r_in,     
    input       wire    signed     [7:0]         pw_x4_r_in,     
    input       wire    signed     [7:0]         pw_x5_r_in,     
    input       wire    signed     [7:0]         pw_x6_r_in,     
    input       wire    signed     [7:0]         pw_x7_r_in,     
    input       wire    signed     [7:0]         pw_x8_r_in,     
    input       wire    signed     [7:0]         pw_x9_r_in,     
    input       wire    signed     [7:0]         pw_x10_r_in,     
    input       wire    signed     [7:0]         pw_x11_r_in,     
    input       wire    signed     [7:0]         pw_x12_r_in,     
    input       wire    signed     [7:0]         pw_x13_r_in,     
    input       wire    signed     [7:0]         pw_x14_r_in,     
    input       wire    signed     [7:0]         pw_x15_r_in,     
    input       wire    signed     [7:0]         pw_x16_r_in,     
    input       wire    signed     [7:0]         pw_x17_r_in,     
    input       wire    signed     [7:0]         pw_x18_r_in,     
    input       wire    signed     [7:0]         pw_x19_r_in,     
    input       wire    signed     [7:0]         pw_x20_r_in,     
    input       wire    signed     [7:0]         pw_x21_r_in,     
    input       wire    signed     [7:0]         pw_x22_r_in,     
    input       wire    signed     [7:0]         pw_x23_r_in,     
    input       wire    signed     [7:0]         pw_x24_r_in,     
    input       wire    signed     [7:0]         pw_x25_r_in,     
    input       wire    signed     [7:0]         pw_x26_r_in,     
    input       wire    signed     [7:0]         pw_x27_r_in,     
    input       wire    signed     [7:0]         pw_x28_r_in,     
    input       wire    signed     [7:0]         pw_x29_r_in,     
    input       wire    signed     [7:0]         pw_x30_r_in,     
    input       wire    signed     [7:0]         pw_x31_r_in,     
    
            
    output                  [3:0]      pwr_dec_0,  
    output                  [3:0]      pwr_dec_1,  
    output                  [3:0]      pwr_dec_2,  
    output                  [3:0]      pwr_dec_3,  
    output                  [3:0]      pwr_dec_4,  
    output                  [3:0]      pwr_dec_5,  
    output                  [3:0]      pwr_dec_6,  
    output                  [3:0]      pwr_dec_7,  
    output                  [3:0]      pwr_dec_8,  
    output                  [3:0]      pwr_dec_9,  
    output                  [3:0]      pwr_dec_10,  
    output                  [3:0]      pwr_dec_11,  
    output                  [3:0]      pwr_dec_12,  
    output                  [3:0]      pwr_dec_13,  
    output                  [3:0]      pwr_dec_14,  
    output                  [3:0]      pwr_dec_15,  
    output                  [3:0]      pwr_dec_16,  

    output                  [PWR-1:0]      pwr_0,
    output                  [PWR-1:0]      pwr_1,
    output                  [PWR-1:0]      pwr_2,
    output                  [PWR-1:0]      pwr_3,
    output                  [PWR-1:0]      pwr_4,
    output                  [PWR-1:0]      pwr_5,
    output                  [PWR-1:0]      pwr_6,
    output                  [PWR-1:0]      pwr_7,
    output                  [PWR-1:0]      pwr_8,
    output                  [PWR-1:0]      pwr_9,
    output                  [PWR-1:0]      pwr_10,
    output                  [PWR-1:0]      pwr_11,
    output                  [PWR-1:0]      pwr_12,
    output                  [PWR-1:0]      pwr_13,
    output                  [PWR-1:0]      pwr_14,
    output                  [PWR-1:0]      pwr_15,
    output                  [PWR-1:0]      pwr_16
    
);
    
    
   

    reg rstb = 1'b0; 
    always @(posedge clk_fpga or negedge arstb) begin
        if(!arstb) begin
            rstb    <=  1'b0;
        end
        else begin
            rstb    <=  1'b1;
        end
    end



    wire clk_fpga_in;
    assign clk_fpga_in = ~clk_fpga ;


    reg [7:0]   x0_r_fft,x1_r_fft,x2_r_fft,x3_r_fft,x4_r_fft,x5_r_fft,x6_r_fft,x7_r_fft,x8_r_fft,x9_r_fft,x10_r_fft,x11_r_fft,x12_r_fft,x13_r_fft,x14_r_fft,x15_r_fft,x16_r_fft,x17_r_fft,x18_r_fft,x19_r_fft,x20_r_fft,x21_r_fft,x22_r_fft,x23_r_fft,x24_r_fft,x25_r_fft,x26_r_fft,x27_r_fft,x28_r_fft,x29_r_fft,x30_r_fft,x31_r_fft;


    wire      signed      [FFT_OUT-1:0]      fft_out_r_0;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_1;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_2;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_3;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_4;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_5;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_6;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_7;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_8;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_9;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_10;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_11;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_12;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_13;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_14;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_15;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_16;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_17;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_18;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_19;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_20;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_21;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_22;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_23;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_24;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_25;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_26;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_27;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_28;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_29;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_30;  
    wire      signed      [FFT_OUT-1:0]      fft_out_r_31;  
    
   
    wire      signed      [FFT_OUT-1:0]      fft_out_i_0;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_1;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_2;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_3;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_4;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_5;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_6;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_7;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_8;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_9;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_10;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_11;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_12;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_13;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_14;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_15;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_16;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_17;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_18;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_19;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_20;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_21;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_22;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_23;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_24;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_25;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_26;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_27;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_28;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_29;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_30;  
    wire      signed      [FFT_OUT-1:0]      fft_out_i_31;  

    //fft//
    always @(posedge clk_fpga_in or negedge arstb) begin
        if(!arstb) begin
             x0_r_fft    <=       8'b0; 
             x1_r_fft    <=       8'b0;
             x2_r_fft    <=       8'b0;
             x3_r_fft    <=       8'b0;
             x4_r_fft    <=       8'b0;
             x5_r_fft    <=       8'b0;
             x6_r_fft    <=       8'b0;
             x7_r_fft    <=       8'b0;
             x8_r_fft    <=       8'b0;
             x9_r_fft    <=       8'b0;
            x10_r_fft    <=       8'b0;
            x11_r_fft    <=       8'b0;
            x12_r_fft    <=       8'b0;
            x13_r_fft    <=       8'b0;
            x14_r_fft    <=       8'b0;
            x15_r_fft    <=       8'b0;
            x16_r_fft    <=       8'b0;
            x17_r_fft    <=       8'b0;
            x18_r_fft    <=       8'b0;
            x19_r_fft    <=       8'b0;
            x20_r_fft    <=       8'b0;
            x21_r_fft    <=       8'b0;
            x22_r_fft    <=       8'b0;
            x23_r_fft    <=       8'b0;
            x24_r_fft    <=       8'b0;
            x25_r_fft    <=       8'b0;
            x26_r_fft    <=       8'b0;
            x27_r_fft    <=       8'b0;
            x28_r_fft    <=       8'b0;
            x29_r_fft    <=       8'b0;
            x30_r_fft    <=       8'b0;
            x31_r_fft    <=       8'b0;
        end
        else if(!rstb) begin
             x0_r_fft    <=       8'b0; 
             x1_r_fft    <=       8'b0;
             x2_r_fft    <=       8'b0;
             x3_r_fft    <=       8'b0;
             x4_r_fft    <=       8'b0;
             x5_r_fft    <=       8'b0;
             x6_r_fft    <=       8'b0;
             x7_r_fft    <=       8'b0;
             x8_r_fft    <=       8'b0;
             x9_r_fft    <=       8'b0;
            x10_r_fft    <=       8'b0;
            x11_r_fft    <=       8'b0;
            x12_r_fft    <=       8'b0;
            x13_r_fft    <=       8'b0;
            x14_r_fft    <=       8'b0;
            x15_r_fft    <=       8'b0;
            x16_r_fft    <=       8'b0;
            x17_r_fft    <=       8'b0;
            x18_r_fft    <=       8'b0;
            x19_r_fft    <=       8'b0;
            x20_r_fft    <=       8'b0;
            x21_r_fft    <=       8'b0;
            x22_r_fft    <=       8'b0;
            x23_r_fft    <=       8'b0;
            x24_r_fft    <=       8'b0;
            x25_r_fft    <=       8'b0;
            x26_r_fft    <=       8'b0;
            x27_r_fft    <=       8'b0;
            x28_r_fft    <=       8'b0;
            x29_r_fft    <=       8'b0;
            x30_r_fft    <=       8'b0;
            x31_r_fft    <=       8'b0;
        end
        else begin
             x0_r_fft    <=        pw_x0_r_in; 
             x1_r_fft    <=        pw_x1_r_in;
             x2_r_fft    <=        pw_x2_r_in;
             x3_r_fft    <=        pw_x3_r_in;
             x4_r_fft    <=        pw_x4_r_in;
             x5_r_fft    <=        pw_x5_r_in;
             x6_r_fft    <=        pw_x6_r_in;
             x7_r_fft    <=        pw_x7_r_in;
             x8_r_fft    <=        pw_x8_r_in;
             x9_r_fft    <=        pw_x9_r_in;
            x10_r_fft    <=       pw_x10_r_in;
            x11_r_fft    <=       pw_x11_r_in;
            x12_r_fft    <=       pw_x12_r_in;
            x13_r_fft    <=       pw_x13_r_in;
            x14_r_fft    <=       pw_x14_r_in;
            x15_r_fft    <=       pw_x15_r_in;
            x16_r_fft    <=       pw_x16_r_in;
            x17_r_fft    <=       pw_x17_r_in;
            x18_r_fft    <=       pw_x18_r_in;
            x19_r_fft    <=       pw_x19_r_in;
            x20_r_fft    <=       pw_x20_r_in;
            x21_r_fft    <=       pw_x21_r_in;
            x22_r_fft    <=       pw_x22_r_in;
            x23_r_fft    <=       pw_x23_r_in;
            x24_r_fft    <=       pw_x24_r_in;
            x25_r_fft    <=       pw_x25_r_in;
            x26_r_fft    <=       pw_x26_r_in;
            x27_r_fft    <=       pw_x27_r_in;
            x28_r_fft    <=       pw_x28_r_in;
            x29_r_fft    <=       pw_x29_r_in;
            x30_r_fft    <=       pw_x30_r_in;
            x31_r_fft    <=       pw_x31_r_in;
        end
    end
    


    fft_32  #(FFT_IN, FFT_OUT, 
            FFT_16, FFT_8, FFT_4, FFT_2, TW)
            i_fft_32                      
                                (
                                          .clk(clk_fpga_in),                                 
                                          .arstb(arstb), 
                                          
                                          .i2c_en_tw(1'b0),
                                          
                                    
                                          .i2c_w0_r(10'b0)   ,
                                          .i2c_w1_r(10'b0)   ,
                                          .i2c_w2_r(10'b0)   ,
                                          .i2c_w3_r(10'b0)   ,
                                          .i2c_w4_r(10'b0)   ,
                                          .i2c_w5_r(10'b0)   ,
                                          .i2c_w6_r(10'b0)   ,
                                          .i2c_w7_r(10'b0)   ,
                                          .i2c_w8_r(10'b0)   ,
                                          .i2c_w9_r(10'b0)   ,
                                          .i2c_w10_r(10'b0)   ,
                                          .i2c_w11_r(10'b0)   ,
                                          .i2c_w12_r(10'b0)   ,
                                          .i2c_w13_r(10'b0)   ,
                                          .i2c_w14_r(10'b0)   ,
                                          .i2c_w15_r(10'b0)   ,

                                          .i2c_w0_i(10'b0)   ,
                                          .i2c_w1_i(10'b0)   ,
                                          .i2c_w2_i(10'b0)   ,
                                          .i2c_w3_i(10'b0)   ,
                                          .i2c_w4_i(10'b0)   ,
                                          .i2c_w5_i(10'b0)   ,
                                          .i2c_w6_i(10'b0)   ,
                                          .i2c_w7_i(10'b0)   ,
                                          .i2c_w8_i(10'b0)   ,
                                          .i2c_w9_i(10'b0)   ,
                                          .i2c_w10_i(10'b0)   ,
                                          .i2c_w11_i(10'b0)   ,
                                          .i2c_w12_i(10'b0)   ,
                                          .i2c_w13_i(10'b0)   ,
                                          .i2c_w14_i(10'b0)   ,
                                          .i2c_w15_i(10'b0)   ,
                                          
                                          .x0_r_in(x0_r_fft),
                                          .x1_r_in(x1_r_fft),
                                          .x2_r_in(x2_r_fft),
                                          .x3_r_in(x3_r_fft),
                                          .x4_r_in(x4_r_fft),
                                          .x5_r_in(x5_r_fft),
                                          .x6_r_in(x6_r_fft),
                                          .x7_r_in(x7_r_fft),
                                          .x8_r_in(x8_r_fft),
                                          .x9_r_in(x9_r_fft),
                                          .x10_r_in(x10_r_fft),
                                          .x11_r_in(x11_r_fft),
                                          .x12_r_in(x12_r_fft),
                                          .x13_r_in(x13_r_fft),
                                          .x14_r_in(x14_r_fft),
                                          .x15_r_in(x15_r_fft),
                                          .x16_r_in(x16_r_fft),
                                          .x17_r_in(x17_r_fft),
                                          .x18_r_in(x18_r_fft),
                                          .x19_r_in(x19_r_fft),
                                          .x20_r_in(x20_r_fft),
                                          .x21_r_in(x21_r_fft),
                                          .x22_r_in(x22_r_fft),
                                          .x23_r_in(x23_r_fft),
                                          .x24_r_in(x24_r_fft),
                                          .x25_r_in(x25_r_fft),
                                          .x26_r_in(x26_r_fft),
                                          .x27_r_in(x27_r_fft),
                                          .x28_r_in(x28_r_fft),
                                          .x29_r_in(x29_r_fft),
                                          .x30_r_in(x30_r_fft),
                                          .x31_r_in(x31_r_fft),
                                          
                                           .fft_out_r_0 (fft_out_r_0),  
                                           .fft_out_r_1 (fft_out_r_1),  
                                           .fft_out_r_2 (fft_out_r_2),  
                                           .fft_out_r_3 (fft_out_r_3),  
                                           .fft_out_r_4 (fft_out_r_4),  
                                           .fft_out_r_5 (fft_out_r_5),  
                                           .fft_out_r_6 (fft_out_r_6),  
                                           .fft_out_r_7 (fft_out_r_7),  
                                           .fft_out_r_8 (fft_out_r_8),  
                                           .fft_out_r_9 (fft_out_r_9),  
                                           .fft_out_r_10(fft_out_r_10),  
                                           .fft_out_r_11(fft_out_r_11),  
                                           .fft_out_r_12(fft_out_r_12),  
                                           .fft_out_r_13(fft_out_r_13),  
                                           .fft_out_r_14(fft_out_r_14),  
                                           .fft_out_r_15(fft_out_r_15),  
                                           .fft_out_r_16(fft_out_r_16),  
                                           .fft_out_r_17(fft_out_r_17),  
                                           .fft_out_r_18(fft_out_r_18),  
                                           .fft_out_r_19(fft_out_r_19),  
                                           .fft_out_r_20(fft_out_r_20),  
                                           .fft_out_r_21(fft_out_r_21),  
                                           .fft_out_r_22(fft_out_r_22),  
                                           .fft_out_r_23(fft_out_r_23),  
                                           .fft_out_r_24(fft_out_r_24),  
                                           .fft_out_r_25(fft_out_r_25),  
                                           .fft_out_r_26(fft_out_r_26),  
                                           .fft_out_r_27(fft_out_r_27),  
                                           .fft_out_r_28(fft_out_r_28),  
                                           .fft_out_r_29(fft_out_r_29),  
                                           .fft_out_r_30(fft_out_r_30),  
                                           .fft_out_r_31(fft_out_r_31),  
                                     

                                           .fft_out_i_0 (fft_out_i_0 ),  
                                           .fft_out_i_1 (fft_out_i_1 ),  
                                           .fft_out_i_2 (fft_out_i_2 ),  
                                           .fft_out_i_3 (fft_out_i_3 ),  
                                           .fft_out_i_4 (fft_out_i_4 ),  
                                           .fft_out_i_5 (fft_out_i_5 ),  
                                           .fft_out_i_6 (fft_out_i_6 ),  
                                           .fft_out_i_7 (fft_out_i_7 ),  
                                           .fft_out_i_8 (fft_out_i_8 ),  
                                           .fft_out_i_9 (fft_out_i_9 ),  
                                           .fft_out_i_10(fft_out_i_10),  
                                           .fft_out_i_11(fft_out_i_11),  
                                           .fft_out_i_12(fft_out_i_12),  
                                           .fft_out_i_13(fft_out_i_13),  
                                           .fft_out_i_14(fft_out_i_14),  
                                           .fft_out_i_15(fft_out_i_15),  
                                           .fft_out_i_16(fft_out_i_16),  
                                           .fft_out_i_17(fft_out_i_17),  
                                           .fft_out_i_18(fft_out_i_18),  
                                           .fft_out_i_19(fft_out_i_19),  
                                           .fft_out_i_20(fft_out_i_20),  
                                           .fft_out_i_21(fft_out_i_21),  
                                           .fft_out_i_22(fft_out_i_22),  
                                           .fft_out_i_23(fft_out_i_23),  
                                           .fft_out_i_24(fft_out_i_24),  
                                           .fft_out_i_25(fft_out_i_25),  
                                           .fft_out_i_26(fft_out_i_26),  
                                           .fft_out_i_27(fft_out_i_27),  
                                           .fft_out_i_28(fft_out_i_28),  
                                           .fft_out_i_29(fft_out_i_29),  
                                           .fft_out_i_30(fft_out_i_30),  
                                           .fft_out_i_31(fft_out_i_31)  
                                    );


        fft_power   #(FFT_OUT)  i_fft_power     
                                    (   
                                            .clk(clk_fpga_in),
                                            .arstb(arstb),
                                            
                                            .fft_out_r_0 (fft_out_r_0 ),  
                                            .fft_out_r_1 (fft_out_r_1 ),  
                                            .fft_out_r_2 (fft_out_r_2 ),  
                                            .fft_out_r_3 (fft_out_r_3 ),  
                                            .fft_out_r_4 (fft_out_r_4 ),  
                                            .fft_out_r_5 (fft_out_r_5 ),  
                                            .fft_out_r_6 (fft_out_r_6 ),  
                                            .fft_out_r_7 (fft_out_r_7 ),  
                                            .fft_out_r_8 (fft_out_r_8 ),  
                                            .fft_out_r_9 (fft_out_r_9 ),  
                                            .fft_out_r_10(fft_out_r_10),  
                                            .fft_out_r_11(fft_out_r_11),  
                                            .fft_out_r_12(fft_out_r_12),  
                                            .fft_out_r_13(fft_out_r_13),  
                                            .fft_out_r_14(fft_out_r_14),  
                                            .fft_out_r_15(fft_out_r_15),  
                                            .fft_out_r_16(fft_out_r_16),  
                                            .fft_out_r_17(fft_out_r_17),  
                                            .fft_out_r_18(fft_out_r_18),  
                                            .fft_out_r_19(fft_out_r_19),  
                                            .fft_out_r_20(fft_out_r_20),  
                                            .fft_out_r_21(fft_out_r_21),  
                                            .fft_out_r_22(fft_out_r_22),  
                                            .fft_out_r_23(fft_out_r_23),  
                                            .fft_out_r_24(fft_out_r_24),  
                                            .fft_out_r_25(fft_out_r_25),  
                                            .fft_out_r_26(fft_out_r_26),  
                                            .fft_out_r_27(fft_out_r_27),  
                                            .fft_out_r_28(fft_out_r_28),  
                                            .fft_out_r_29(fft_out_r_29),  
                                            .fft_out_r_30(fft_out_r_30),  
                                            .fft_out_r_31(fft_out_r_31),  
                                            
                                            .fft_out_i_0 (fft_out_i_0 ),  
                                            .fft_out_i_1 (fft_out_i_1 ),  
                                            .fft_out_i_2 (fft_out_i_2 ),  
                                            .fft_out_i_3 (fft_out_i_3 ),  
                                            .fft_out_i_4 (fft_out_i_4 ),  
                                            .fft_out_i_5 (fft_out_i_5 ),  
                                            .fft_out_i_6 (fft_out_i_6 ),  
                                            .fft_out_i_7 (fft_out_i_7 ),  
                                            .fft_out_i_8 (fft_out_i_8 ),  
                                            .fft_out_i_9 (fft_out_i_9 ),  
                                            .fft_out_i_10(fft_out_i_10),  
                                            .fft_out_i_11(fft_out_i_11),  
                                            .fft_out_i_12(fft_out_i_12),  
                                            .fft_out_i_13(fft_out_i_13),  
                                            .fft_out_i_14(fft_out_i_14),  
                                            .fft_out_i_15(fft_out_i_15),  
                                            .fft_out_i_16(fft_out_i_16),  
                                            .fft_out_i_17(fft_out_i_17),  
                                            .fft_out_i_18(fft_out_i_18),  
                                            .fft_out_i_19(fft_out_i_19),  
                                            .fft_out_i_20(fft_out_i_20),  
                                            .fft_out_i_21(fft_out_i_21),  
                                            .fft_out_i_22(fft_out_i_22),  
                                            .fft_out_i_23(fft_out_i_23),  
                                            .fft_out_i_24(fft_out_i_24),  
                                            .fft_out_i_25(fft_out_i_25),  
                                            .fft_out_i_26(fft_out_i_26),  
                                            .fft_out_i_27(fft_out_i_27),  
                                            .fft_out_i_28(fft_out_i_28),  
                                            .fft_out_i_29(fft_out_i_29),  
                                            .fft_out_i_30(fft_out_i_30),  
                                            .fft_out_i_31(fft_out_i_31),  
                                           
                                            .pwr_0 (pwr_0 ),  
                                            .pwr_1 (pwr_1 ),  
                                            .pwr_2 (pwr_2 ),  
                                            .pwr_3 (pwr_3 ),  
                                            .pwr_4 (pwr_4 ),  
                                            .pwr_5 (pwr_5 ),  
                                            .pwr_6 (pwr_6 ),  
                                            .pwr_7 (pwr_7 ),  
                                            .pwr_8 (pwr_8 ),  
                                            .pwr_9 (pwr_9 ),  
                                            .pwr_10(pwr_10),  
                                            .pwr_11(pwr_11),  
                                            .pwr_12(pwr_12),  
                                            .pwr_13(pwr_13),  
                                            .pwr_14(pwr_14),  
                                            .pwr_15(pwr_15),  
                                            .pwr_16(pwr_16)  
                                            
                                            );



    // new_power_dec_top       i_power_dec_top     (   
    //                                                 .clk(clk_fpga_in) ,
    //                                                 .arstb(arstb),
    //                                                 .freeze(freeze),
                                                               
    //                                                 .pwr_0 (pwr_0 ),  
    //                                                 .pwr_1 (pwr_1 ),  
    //                                                 .pwr_2 (pwr_2 ),  
    //                                                 .pwr_3 (pwr_3 ),  
    //                                                 .pwr_4 (pwr_4 ),  
    //                                                 .pwr_5 (pwr_5 ),  
    //                                                 .pwr_6 (pwr_6 ),  
    //                                                 .pwr_7 (pwr_7 ),  
    //                                                 .pwr_8 (pwr_8 ),  
    //                                                 .pwr_9 (pwr_9 ),  
    //                                                 .pwr_10(pwr_10),  
    //                                                 .pwr_11(pwr_11),  
    //                                                 .pwr_12(pwr_12),  
    //                                                 .pwr_13(pwr_13),  
    //                                                 .pwr_14(pwr_14),  
    //                                                 .pwr_15(pwr_15), 
    //                                                 .pwr_16(pwr_16), 
                                                               
    //                                                 .pwr_dec_0 (pwr_dec_0 ),
    //                                                 .pwr_dec_1 (pwr_dec_1 ),
    //                                                 .pwr_dec_2 (pwr_dec_2 ),
    //                                                 .pwr_dec_3 (pwr_dec_3 ),
    //                                                 .pwr_dec_4 (pwr_dec_4 ),
    //                                                 .pwr_dec_5 (pwr_dec_5 ),
    //                                                 .pwr_dec_6 (pwr_dec_6 ),
    //                                                 .pwr_dec_7 (pwr_dec_7 ),
    //                                                 .pwr_dec_8 (pwr_dec_8 ),
    //                                                 .pwr_dec_9 (pwr_dec_9 ),
    //                                                 .pwr_dec_10(pwr_dec_10),
    //                                                 .pwr_dec_11(pwr_dec_11),
    //                                                 .pwr_dec_12(pwr_dec_12),
    //                                                 .pwr_dec_13(pwr_dec_13),
    //                                                 .pwr_dec_14(pwr_dec_14),
    //                                                 .pwr_dec_15(pwr_dec_15),
    //                                                 .pwr_dec_16(pwr_dec_16)
    //                                         );



endmodule
