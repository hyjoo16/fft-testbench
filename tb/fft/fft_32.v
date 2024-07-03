

`timescale 1ns/1fs

module fft_32 #(parameter IN_W = 8, OUT_W = 4, TW_W = 10,
                W_16 = 4, W_8 = 4, W_4 = 4, W_2 = 4)(
    
    input                               clk,
    input                               arstb,
    
    input       signed      [IN_W-1:0]      x0_r_in,
    input       signed      [IN_W-1:0]      x1_r_in,
    input       signed      [IN_W-1:0]      x2_r_in,
    input       signed      [IN_W-1:0]      x3_r_in,
    input       signed      [IN_W-1:0]      x4_r_in,
    input       signed      [IN_W-1:0]      x5_r_in,
    input       signed      [IN_W-1:0]      x6_r_in,
    input       signed      [IN_W-1:0]      x7_r_in,
    input       signed      [IN_W-1:0]      x8_r_in,
    input       signed      [IN_W-1:0]      x9_r_in,
    input       signed      [IN_W-1:0]      x10_r_in,
    input       signed      [IN_W-1:0]      x11_r_in,
    input       signed      [IN_W-1:0]      x12_r_in,
    input       signed      [IN_W-1:0]      x13_r_in,
    input       signed      [IN_W-1:0]      x14_r_in,
    input       signed      [IN_W-1:0]      x15_r_in,
    input       signed      [IN_W-1:0]      x16_r_in,
    input       signed      [IN_W-1:0]      x17_r_in,
    input       signed      [IN_W-1:0]      x18_r_in,
    input       signed      [IN_W-1:0]      x19_r_in,
    input       signed      [IN_W-1:0]      x20_r_in,
    input       signed      [IN_W-1:0]      x21_r_in,
    input       signed      [IN_W-1:0]      x22_r_in,
    input       signed      [IN_W-1:0]      x23_r_in,
    input       signed      [IN_W-1:0]      x24_r_in,
    input       signed      [IN_W-1:0]      x25_r_in,
    input       signed      [IN_W-1:0]      x26_r_in,
    input       signed      [IN_W-1:0]      x27_r_in,
    input       signed      [IN_W-1:0]      x28_r_in,
    input       signed      [IN_W-1:0]      x29_r_in,
    input       signed      [IN_W-1:0]      x30_r_in,
    input       signed      [IN_W-1:0]      x31_r_in,

    input                               i2c_en_tw,


    input       signed      [TW_W-1:0]       i2c_w15_i, 
    input       signed      [TW_W-1:0]       i2c_w14_i, 
    input       signed      [TW_W-1:0]       i2c_w13_i, 
    input       signed      [TW_W-1:0]       i2c_w12_i, 
    input       signed      [TW_W-1:0]       i2c_w11_i, 
    input       signed      [TW_W-1:0]       i2c_w10_i, 
    input       signed      [TW_W-1:0]       i2c_w9_i, 
    input       signed      [TW_W-1:0]       i2c_w8_i, 
    input       signed      [TW_W-1:0]       i2c_w7_i, 
    input       signed      [TW_W-1:0]       i2c_w6_i, 
    input       signed      [TW_W-1:0]       i2c_w5_i, 
    input       signed      [TW_W-1:0]       i2c_w4_i, 
    input       signed      [TW_W-1:0]       i2c_w3_i, 
    input       signed      [TW_W-1:0]       i2c_w2_i, 
    input       signed      [TW_W-1:0]       i2c_w1_i, 
    input       signed      [TW_W-1:0]       i2c_w0_i, 



    input       signed      [TW_W-1:0]       i2c_w0_r,
    input       signed      [TW_W-1:0]       i2c_w1_r,
    input       signed      [TW_W-1:0]       i2c_w2_r,
    input       signed      [TW_W-1:0]       i2c_w3_r,
    input       signed      [TW_W-1:0]       i2c_w4_r,
    input       signed      [TW_W-1:0]       i2c_w5_r,
    input       signed      [TW_W-1:0]       i2c_w6_r,
    input       signed      [TW_W-1:0]       i2c_w7_r,
    input       signed      [TW_W-1:0]       i2c_w8_r,
    input       signed      [TW_W-1:0]       i2c_w9_r,
    input       signed      [TW_W-1:0]       i2c_w10_r,
    input       signed      [TW_W-1:0]       i2c_w11_r,
    input       signed      [TW_W-1:0]       i2c_w12_r,
    input       signed      [TW_W-1:0]       i2c_w13_r,
    input       signed      [TW_W-1:0]       i2c_w14_r,
    input       signed      [TW_W-1:0]       i2c_w15_r,

    output      signed [OUT_W-1:0] fft_out_r_0,  
    output      signed [OUT_W-1:0] fft_out_r_1,  
    output      signed [OUT_W-1:0] fft_out_r_2,  
    output      signed [OUT_W-1:0] fft_out_r_3,  
    output      signed [OUT_W-1:0] fft_out_r_4,  
    output      signed [OUT_W-1:0] fft_out_r_5,  
    output      signed [OUT_W-1:0] fft_out_r_6,  
    output      signed [OUT_W-1:0] fft_out_r_7,  
    output      signed [OUT_W-1:0] fft_out_r_8,  
    output      signed [OUT_W-1:0] fft_out_r_9,  
    output      signed [OUT_W-1:0] fft_out_r_10,  
    output      signed [OUT_W-1:0] fft_out_r_11,  
    output      signed [OUT_W-1:0] fft_out_r_12,  
    output      signed [OUT_W-1:0] fft_out_r_13,  
    output      signed [OUT_W-1:0] fft_out_r_14,  
    output      signed [OUT_W-1:0] fft_out_r_15,  
    output      signed [OUT_W-1:0] fft_out_r_16,  
    output      signed [OUT_W-1:0] fft_out_r_17,  
    output      signed [OUT_W-1:0] fft_out_r_18,  
    output      signed [OUT_W-1:0] fft_out_r_19,  
    output      signed [OUT_W-1:0] fft_out_r_20,  
    output      signed [OUT_W-1:0] fft_out_r_21,  
    output      signed [OUT_W-1:0] fft_out_r_22,  
    output      signed [OUT_W-1:0] fft_out_r_23,  
    output      signed [OUT_W-1:0] fft_out_r_24,  
    output      signed [OUT_W-1:0] fft_out_r_25,  
    output      signed [OUT_W-1:0] fft_out_r_26,  
    output      signed [OUT_W-1:0] fft_out_r_27,  
    output      signed [OUT_W-1:0] fft_out_r_28,  
    output      signed [OUT_W-1:0] fft_out_r_29,  
    output      signed [OUT_W-1:0] fft_out_r_30,  
    output      signed [OUT_W-1:0] fft_out_r_31,  
    
    output signed [OUT_W-1:0] fft_out_i_0,  
    output signed [OUT_W-1:0] fft_out_i_1,  
    output signed [OUT_W-1:0] fft_out_i_2,  
    output signed [OUT_W-1:0] fft_out_i_3,  
    output signed [OUT_W-1:0] fft_out_i_4,  
    output signed [OUT_W-1:0] fft_out_i_5,  
    output signed [OUT_W-1:0] fft_out_i_6,  
    output signed [OUT_W-1:0] fft_out_i_7,  
    output signed [OUT_W-1:0] fft_out_i_8,  
    output signed [OUT_W-1:0] fft_out_i_9,  
    output signed [OUT_W-1:0] fft_out_i_10,  
    output signed [OUT_W-1:0] fft_out_i_11,  
    output signed [OUT_W-1:0] fft_out_i_12,  
    output signed [OUT_W-1:0] fft_out_i_13,  
    output signed [OUT_W-1:0] fft_out_i_14,  
    output signed [OUT_W-1:0] fft_out_i_15,  
    output signed [OUT_W-1:0] fft_out_i_16,  
    output signed [OUT_W-1:0] fft_out_i_17,  
    output signed [OUT_W-1:0] fft_out_i_18,  
    output signed [OUT_W-1:0] fft_out_i_19,  
    output signed [OUT_W-1:0] fft_out_i_20,  
    output signed [OUT_W-1:0] fft_out_i_21,  
    output signed [OUT_W-1:0] fft_out_i_22,  
    output signed [OUT_W-1:0] fft_out_i_23,  
    output signed [OUT_W-1:0] fft_out_i_24,  
    output signed [OUT_W-1:0] fft_out_i_25,  
    output signed [OUT_W-1:0] fft_out_i_26,  
    output signed [OUT_W-1:0] fft_out_i_27,  
    output signed [OUT_W-1:0] fft_out_i_28,  
    output signed [OUT_W-1:0] fft_out_i_29,  
    output signed [OUT_W-1:0] fft_out_i_30,  
    output signed [OUT_W-1:0] fft_out_i_31  
 
            
            );

    
    reg rstb;

    always @(posedge clk or negedge arstb) begin
        if(!arstb) begin
            rstb    <=  1'b0;
        end
        else begin
            rstb    <=  1'b1;
        end
    end

    reg [TW_W-1:0] w0_r,w1_r,w2_r,w3_r,w4_r,w5_r,w6_r,w7_r,w8_r,w9_r,w10_r,w11_r,w12_r,w13_r,w14_r,w15_r ;
    reg [TW_W-1:0] w0_i,w1_i,w2_i,w3_i,w4_i,w5_i,w6_i,w7_i,w8_i,w9_i,w10_i,w11_i,w12_i,w13_i,w14_i,w15_i ;

    
    always @(posedge clk or negedge arstb) begin
        if(!arstb) begin
               w0_r  <=  10'b01_0000_0000; 
               w1_r  <=  10'b00_1111_1011; 
               w2_r  <=  10'b00_1110_1100; 
               w3_r  <=  10'b00_1101_0100; 
               w4_r  <=  10'b00_1011_0100; 
               w5_r  <=  10'b00_1000_1101;
               w6_r  <=  10'b00_0110_0000;
               w7_r  <=  10'b00_0011_0000;
               w8_r  <=  10'b00_0000_0000;
               w9_r  <=  10'b11_1101_0000;
               w10_r <=  10'b11_1010_0000;
               w11_r <=  10'b11_0111_0011;
               w12_r <=  10'b11_0100_1100;  
               w13_r <=  10'b11_0010_1100;
               w14_r <=  10'b11_0001_0100; 
               w15_r <=  10'b11_0000_0101;   


               w0_i  <=  10'b00_0000_0000; 
               w1_i  <=  10'b11_1101_0000;
               w2_i  <=  10'b11_1010_0000; 
               w3_i  <=  10'b11_0111_0011; 
               w4_i  <=  10'b11_0100_1100;  
               w5_i  <=  10'b11_0010_1100;
               w6_i  <=  10'b11_0001_0100;
               w7_i  <=  10'b11_0000_0101;  
               w8_i  <=  10'b11_0000_0000;  
               w9_i  <=  10'b11_0000_0101;  
               w10_i  <=  10'b11_0001_0100;
               w11_i  <=  10'b11_0010_1100;
               w12_i  <=  10'b11_0100_1100;  
               w13_i  <=  10'b11_0111_0011; 
               w14_i  <=  10'b11_1010_0000; 
               w15_i  <=  10'b11_1101_0000;
        end
        else if(!rstb) begin
               w0_r  <=  10'b01_0000_0000; 
               w1_r  <=  10'b00_1111_1011;
               w2_r  <=  10'b00_1110_1100;
               w3_r  <=  10'b00_1101_0100;
               w4_r  <=  10'b00_1011_0100;
               w5_r  <=  10'b00_1000_1101;
               w6_r  <=  10'b00_0110_0000;
               w7_r  <=  10'b00_0011_0000;
               w8_r  <=  10'b00_0000_0000;
               w9_r  <=  10'b11_1101_0000;
               w10_r <=  10'b11_1010_0000;
               w11_r <=  10'b11_0111_0011;
               w12_r <=  10'b11_0100_1100;  
               w13_r <=  10'b11_0010_1100;
               w14_r <=  10'b11_0001_0100; 
               w15_r <=  10'b11_0000_0101;   


               w0_i  <=  10'b00_0000_0000; 
               w1_i  <=  10'b11_1101_0000;
               w2_i  <=  10'b11_1010_0000; 
               w3_i  <=  10'b11_0111_0011; 
               w4_i  <=  10'b11_0100_1100;  
               w5_i  <=  10'b11_0010_1100;
               w6_i  <=  10'b11_0001_0100;
               w7_i  <=  10'b11_0000_0101;  
               w8_i  <=  10'b11_0000_0000;  
               w9_i  <=  10'b11_0000_0101;  
               w10_i  <=  10'b11_0001_0100;
               w11_i  <=  10'b11_0010_1100;
               w12_i  <=  10'b11_0100_1100;  
               w13_i  <=  10'b11_0111_0011; 
               w14_i  <=  10'b11_1010_0000; 
               w15_i  <=  10'b11_1101_0000;
        end
        else begin
            if(i2c_en_tw) begin
                w15_i <=  i2c_w15_i; 
                w14_i <=  i2c_w14_i; 
                w13_i <=  i2c_w13_i; 
                w12_i <=  i2c_w12_i; 
                w11_i <=  i2c_w11_i; 
                w10_i <=  i2c_w10_i; 
                 w9_i <=   i2c_w9_i; 
                 w8_i <=   i2c_w8_i; 
                 w7_i <=   i2c_w7_i; 
                 w6_i <=   i2c_w6_i; 
                 w5_i <=   i2c_w5_i; 
                 w4_i <=   i2c_w4_i; 
                 w3_i <=   i2c_w3_i; 
                 w2_i <=   i2c_w2_i; 
                 w1_i <=   i2c_w1_i; 
                 w0_i <=   i2c_w0_i; 
                                
                 w0_r <=   i2c_w0_r;
                 w1_r <=   i2c_w1_r;
                 w2_r <=   i2c_w2_r;
                 w3_r <=   i2c_w3_r;
                 w4_r <=   i2c_w4_r;
                 w5_r <=   i2c_w5_r;
                 w6_r <=   i2c_w6_r;
                 w7_r <=   i2c_w7_r;
                 w8_r <=   i2c_w8_r;
                 w9_r <=   i2c_w9_r;
                 w10_r <=  i2c_w10_r;
                 w11_r <=  i2c_w11_r;
                 w12_r <=  i2c_w12_r;
                 w13_r <=  i2c_w13_r;
                 w14_r <=  i2c_w14_r;
                 w15_r <=  i2c_w15_r;
            end
            else begin
                w15_i <=  w15_i ;
                w14_i <=  w14_i ;
                w13_i <=  w13_i ;
                w12_i <=  w12_i ;
                w11_i <=  w11_i ;
                w10_i <=  w10_i ;
                 w9_i <=   w9_i ;
                 w8_i <=   w8_i ;
                 w7_i <=   w7_i ;
                 w6_i <=   w6_i ;
                 w5_i <=   w5_i ;
                 w4_i <=   w4_i ;
                 w3_i <=   w3_i ;
                 w2_i <=   w2_i ;
                 w1_i <=   w1_i ;
                 w0_i <=   w0_i ;
                                               
                 w0_r  <=  w0_r ; 
                 w1_r  <=  w1_r ; 
                 w2_r  <=  w2_r ; 
                 w3_r  <=  w3_r ; 
                 w4_r  <=  w4_r ; 
                 w5_r  <=  w5_r ; 
                 w6_r  <=  w6_r ; 
                 w7_r  <=  w7_r ; 
                 w8_r  <=  w8_r ; 
                 w9_r  <=  w9_r ; 
                 w10_r <=  w10_r;
                 w11_r <=  w11_r;
                 w12_r <=  w12_r;
                 w13_r <=  w13_r;
                 w14_r <=  w14_r;
                 w15_r <=  w15_r;
            end
        end
    end

    reg [IN_W-1:0]   x0_r,x1_r,x2_r,x3_r,x4_r,x5_r,x6_r,x7_r,x8_r,x9_r,x10_r,x11_r,x12_r,x13_r,x14_r,x15_r,x16_r,x17_r,x18_r,x19_r,x20_r,x21_r,x22_r,x23_r,x24_r,x25_r,x26_r,x27_r,x28_r,x29_r,x30_r,x31_r;
    

    //data rst//
    always @(posedge clk or negedge arstb) begin
        if(!arstb) begin
             x0_r    <=       {IN_W{1'b0}}; 
             x1_r    <=       {IN_W{1'b0}};
             x2_r    <=       {IN_W{1'b0}};
             x3_r    <=       {IN_W{1'b0}};
             x4_r    <=       {IN_W{1'b0}};
             x5_r    <=       {IN_W{1'b0}};
             x6_r    <=       {IN_W{1'b0}};
             x7_r    <=       {IN_W{1'b0}};
             x8_r    <=       {IN_W{1'b0}};
             x9_r    <=       {IN_W{1'b0}};
            x10_r    <=       {IN_W{1'b0}};
            x11_r    <=       {IN_W{1'b0}};
            x12_r    <=       {IN_W{1'b0}};
            x13_r    <=       {IN_W{1'b0}};
            x14_r    <=       {IN_W{1'b0}};
            x15_r    <=       {IN_W{1'b0}};
            x16_r    <=       {IN_W{1'b0}};
            x17_r    <=       {IN_W{1'b0}};
            x18_r    <=       {IN_W{1'b0}};
            x19_r    <=       {IN_W{1'b0}};
            x20_r    <=       {IN_W{1'b0}};
            x21_r    <=       {IN_W{1'b0}};
            x22_r    <=       {IN_W{1'b0}};
            x23_r    <=       {IN_W{1'b0}};
            x24_r    <=       {IN_W{1'b0}};
            x25_r    <=       {IN_W{1'b0}};
            x26_r    <=       {IN_W{1'b0}};
            x27_r    <=       {IN_W{1'b0}};
            x28_r    <=       {IN_W{1'b0}};
            x29_r    <=       {IN_W{1'b0}};
            x30_r    <=       {IN_W{1'b0}};
            x31_r    <=       {IN_W{1'b0}};
        end
        else if(!rstb) begin
              x0_r    <=       {IN_W{1'b0}}; 
             x1_r    <=       {IN_W{1'b0}};
             x2_r    <=       {IN_W{1'b0}};
             x3_r    <=       {IN_W{1'b0}};
             x4_r    <=       {IN_W{1'b0}};
             x5_r    <=       {IN_W{1'b0}};
             x6_r    <=       {IN_W{1'b0}};
             x7_r    <=       {IN_W{1'b0}};
             x8_r    <=       {IN_W{1'b0}};
             x9_r    <=       {IN_W{1'b0}};
            x10_r    <=       {IN_W{1'b0}};
            x11_r    <=       {IN_W{1'b0}};
            x12_r    <=       {IN_W{1'b0}};
            x13_r    <=       {IN_W{1'b0}};
            x14_r    <=       {IN_W{1'b0}};
            x15_r    <=       {IN_W{1'b0}};
            x16_r    <=       {IN_W{1'b0}};
            x17_r    <=       {IN_W{1'b0}};
            x18_r    <=       {IN_W{1'b0}};
            x19_r    <=       {IN_W{1'b0}};
            x20_r    <=       {IN_W{1'b0}};
            x21_r    <=       {IN_W{1'b0}};
            x22_r    <=       {IN_W{1'b0}};
            x23_r    <=       {IN_W{1'b0}};
            x24_r    <=       {IN_W{1'b0}};
            x25_r    <=       {IN_W{1'b0}};
            x26_r    <=       {IN_W{1'b0}};
            x27_r    <=       {IN_W{1'b0}};
            x28_r    <=       {IN_W{1'b0}};
            x29_r    <=       {IN_W{1'b0}};
            x30_r    <=       {IN_W{1'b0}};
            x31_r    <=       {IN_W{1'b0}};
        end
        else begin
             x0_r    <=        x0_r_in; 
             x1_r    <=        x1_r_in;
             x2_r    <=        x2_r_in;
             x3_r    <=        x3_r_in;
             x4_r    <=        x4_r_in;
             x5_r    <=        x5_r_in;
             x6_r    <=        x6_r_in;
             x7_r    <=        x7_r_in;
             x8_r    <=        x8_r_in;
             x9_r    <=        x9_r_in;
            x10_r    <=       x10_r_in;
            x11_r    <=       x11_r_in;
            x12_r    <=       x12_r_in;
            x13_r    <=       x13_r_in;
            x14_r    <=       x14_r_in;
            x15_r    <=       x15_r_in;
            x16_r    <=       x16_r_in;
            x17_r    <=       x17_r_in;
            x18_r    <=       x18_r_in;
            x19_r    <=       x19_r_in;
            x20_r    <=       x20_r_in;
            x21_r    <=       x21_r_in;
            x22_r    <=       x22_r_in;
            x23_r    <=       x23_r_in;
            x24_r    <=       x24_r_in;
            x25_r    <=       x25_r_in;
            x26_r    <=       x26_r_in;
            x27_r    <=       x27_r_in;
            x28_r    <=       x28_r_in;
            x29_r    <=       x29_r_in;
            x30_r    <=       x30_r_in;
            x31_r    <=       x31_r_in;
        end
    end
    
                                   
    wire    signed  [W_16-1:0]   fsta0_r; 
    wire    signed  [W_16-1:0]   fsta1_r; 
    wire    signed  [W_16-1:0]   fsta2_r; 
    wire    signed  [W_16-1:0]   fsta3_r; 
    wire    signed  [W_16-1:0]   fsta4_r; 
    wire    signed  [W_16-1:0]   fsta5_r; 
    wire    signed  [W_16-1:0]   fsta6_r; 
    wire    signed  [W_16-1:0]   fsta7_r; 
    wire    signed  [W_16-1:0]   fsta8_r; 
    wire    signed  [W_16-1:0]   fsta9_r; 
    wire    signed  [W_16-1:0]   fsta10_r;
    wire    signed  [W_16-1:0]   fsta11_r;
    wire    signed  [W_16-1:0]   fsta12_r;
    wire    signed  [W_16-1:0]   fsta13_r;
    wire    signed  [W_16-1:0]   fsta14_r;
    wire    signed  [W_16-1:0]   fsta15_r;
                                
    wire    signed  [W_16-1:0]   fstb0_r; 
    wire    signed  [W_16-1:0]   fstb1_r; 
    wire    signed  [W_16-1:0]   fstb2_r; 
    wire    signed  [W_16-1:0]   fstb3_r; 
    wire    signed  [W_16-1:0]   fstb4_r; 
    wire    signed  [W_16-1:0]   fstb5_r; 
    wire    signed  [W_16-1:0]   fstb6_r; 
    wire    signed  [W_16-1:0]   fstb7_r; 
    wire    signed  [W_16-1:0]   fstb8_r; 
    wire    signed  [W_16-1:0]   fstb9_r; 
    wire    signed  [W_16-1:0]   fstb10_r;
    wire    signed  [W_16-1:0]   fstb11_r;
    wire    signed  [W_16-1:0]   fstb12_r;
    wire    signed  [W_16-1:0]   fstb13_r;
    wire    signed  [W_16-1:0]   fstb14_r;
    wire    signed  [W_16-1:0]   fstb15_r;

    wire    signed  [W_16-1:0]   fsta0_r_d; 
    wire    signed  [W_16-1:0]   fsta1_r_d; 
    wire    signed  [W_16-1:0]   fsta2_r_d; 
    wire    signed  [W_16-1:0]   fsta3_r_d; 
    wire    signed  [W_16-1:0]   fsta4_r_d; 
    wire    signed  [W_16-1:0]   fsta5_r_d; 
    wire    signed  [W_16-1:0]   fsta6_r_d; 
    wire    signed  [W_16-1:0]   fsta7_r_d; 
    wire    signed  [W_16-1:0]   fsta8_r_d; 
    wire    signed  [W_16-1:0]   fsta9_r_d; 
    wire    signed  [W_16-1:0]   fsta10_r_d;
    wire    signed  [W_16-1:0]   fsta11_r_d;
    wire    signed  [W_16-1:0]   fsta12_r_d;
    wire    signed  [W_16-1:0]   fsta13_r_d;
    wire    signed  [W_16-1:0]   fsta14_r_d;
    wire    signed  [W_16-1:0]   fsta15_r_d;
                                
    wire    signed  [W_16-1:0]   fstb0_r_d; 
    wire    signed  [W_16-1:0]   fstb1_r_d; 
    wire    signed  [W_16-1:0]   fstb2_r_d; 
    wire    signed  [W_16-1:0]   fstb3_r_d; 
    wire    signed  [W_16-1:0]   fstb4_r_d; 
    wire    signed  [W_16-1:0]   fstb5_r_d; 
    wire    signed  [W_16-1:0]   fstb6_r_d; 
    wire    signed  [W_16-1:0]   fstb7_r_d; 
    wire    signed  [W_16-1:0]   fstb8_r_d; 
    wire    signed  [W_16-1:0]   fstb9_r_d; 
    wire    signed  [W_16-1:0]   fstb10_r_d;
    wire    signed  [W_16-1:0]   fstb11_r_d;
    wire    signed  [W_16-1:0]   fstb12_r_d;
    wire    signed  [W_16-1:0]   fstb13_r_d;
    wire    signed  [W_16-1:0]   fstb14_r_d;
    wire    signed  [W_16-1:0]   fstb15_r_d;

//dft_32_to_16
dft_32to16  #(IN_W, W_16)    i_dft32_1       
                                (   .x0_r(x0_r) ,
                                    .x1_r(x1_r) ,                                    
                                    .x2_r(x2_r) ,                                    
                                    .x3_r(x3_r) ,                                    
                                    .x4_r(x4_r) ,                                    
                                    .x5_r(x5_r) ,                                    
                                    .x6_r(x6_r) ,                                    
                                    .x7_r(x7_r) ,                                    
                                    .x8_r(x8_r) ,                                    
                                    .x9_r(x9_r) ,                                    
                                    .x10_r(x10_r) ,                                    
                                    .x11_r(x11_r) ,                                    
                                    .x12_r(x12_r) ,                                    
                                    .x13_r(x13_r) ,                                    
                                    .x14_r(x14_r) ,                                    
                                    .x15_r(x15_r) ,                                    
                                    .x16_r(x16_r) ,                                    
                                    .x17_r(x17_r) ,                                    
                                    .x18_r(x18_r) ,                                    
                                    .x19_r(x19_r) ,                                    
                                    .x20_r(x20_r) ,                                    
                                    .x21_r(x21_r) ,                                    
                                    .x22_r(x22_r) ,                                    
                                    .x23_r(x23_r) ,                                    
                                    .x24_r(x24_r) ,                                    
                                    .x25_r(x25_r) ,                                    
                                    .x26_r(x26_r) ,                                    
                                    .x27_r(x27_r) ,                                    
                                    .x28_r(x28_r) ,                                    
                                    .x29_r(x29_r) ,                                    
                                    .x30_r(x30_r) ,                                    
                                    .x31_r(x31_r) ,
                                    
                                    .fa0_r (fsta0_r ) ,
                                    .fa1_r (fsta1_r ) ,
                                    .fa2_r (fsta2_r ) ,
                                    .fa3_r (fsta3_r ) ,
                                    .fa4_r (fsta4_r ) ,
                                    .fa5_r (fsta5_r ) ,
                                    .fa6_r (fsta6_r ) ,
                                    .fa7_r (fsta7_r ) ,
                                    .fa8_r (fsta8_r ) ,
                                    .fa9_r (fsta9_r ) ,
                                    .fa10_r(fsta10_r) ,
                                    .fa11_r(fsta11_r) ,
                                    .fa12_r(fsta12_r) ,
                                    .fa13_r(fsta13_r) ,
                                    .fa14_r(fsta14_r) ,
                                    .fa15_r(fsta15_r) ,
                                    
                                    .fb0_r (fstb0_r ) ,
                                    .fb1_r (fstb1_r ) ,
                                    .fb2_r (fstb2_r ) ,
                                    .fb3_r (fstb3_r ) ,
                                    .fb4_r (fstb4_r ) ,
                                    .fb5_r (fstb5_r ) ,
                                    .fb6_r (fstb6_r ) ,
                                    .fb7_r (fstb7_r ) ,
                                    .fb8_r (fstb8_r ) ,
                                    .fb9_r (fstb9_r ) ,
                                    .fb10_r(fstb10_r) ,
                                    .fb11_r(fstb11_r) ,
                                    .fb12_r(fstb12_r) ,
                                    .fb13_r(fstb13_r) ,
                                    .fb14_r(fstb14_r) ,
                                    .fb15_r(fstb15_r) 
                                    );


pipe_r  #(W_16)      i_pipe_r              
                                    (       .clk(clk),
                                            .arstb(arstb),
                                            .rstb(rstb),
                                            
                                            .d_r_0 (fsta0_r ),
                                            .d_r_1 (fsta1_r ),
                                            .d_r_2 (fsta2_r ),
                                            .d_r_3 (fsta3_r ),
                                            .d_r_4 (fsta4_r ),
                                            .d_r_5 (fsta5_r ),
                                            .d_r_6 (fsta6_r ),
                                            .d_r_7 (fsta7_r ),
                                            .d_r_8 (fsta8_r ),
                                            .d_r_9 (fsta9_r ),
                                            .d_r_10(fsta10_r),
                                            .d_r_11(fsta11_r),
                                            .d_r_12(fsta12_r),
                                            .d_r_13(fsta13_r),
                                            .d_r_14(fsta14_r),
                                            .d_r_15(fsta15_r),
                                            .d_r_16(fstb0_r ),
                                            .d_r_17(fstb1_r ),
                                            .d_r_18(fstb2_r ),
                                            .d_r_19(fstb3_r ),
                                            .d_r_20(fstb4_r ),
                                            .d_r_21(fstb5_r ),
                                            .d_r_22(fstb6_r ),
                                            .d_r_23(fstb7_r ),
                                            .d_r_24(fstb8_r ),
                                            .d_r_25(fstb9_r ),
                                            .d_r_26(fstb10_r),
                                            .d_r_27(fstb11_r),
                                            .d_r_28(fstb12_r),
                                            .d_r_29(fstb13_r),
                                            .d_r_30(fstb14_r),
                                            .d_r_31(fstb15_r),

                                        
                                            .q_r_0 (fsta0_r_d ),
                                            .q_r_1 (fsta1_r_d ),
                                            .q_r_2 (fsta2_r_d ),
                                            .q_r_3 (fsta3_r_d ),
                                            .q_r_4 (fsta4_r_d ),
                                            .q_r_5 (fsta5_r_d ),
                                            .q_r_6 (fsta6_r_d ),
                                            .q_r_7 (fsta7_r_d ),
                                            .q_r_8 (fsta8_r_d ),
                                            .q_r_9 (fsta9_r_d ),
                                            .q_r_10(fsta10_r_d),
                                            .q_r_11(fsta11_r_d),
                                            .q_r_12(fsta12_r_d),
                                            .q_r_13(fsta13_r_d),
                                            .q_r_14(fsta14_r_d),
                                            .q_r_15(fsta15_r_d),
                                            .q_r_16(fstb0_r_d ),
                                            .q_r_17(fstb1_r_d ),
                                            .q_r_18(fstb2_r_d ),
                                            .q_r_19(fstb3_r_d ),
                                            .q_r_20(fstb4_r_d ),
                                            .q_r_21(fstb5_r_d ),
                                            .q_r_22(fstb6_r_d ),
                                            .q_r_23(fstb7_r_d ),
                                            .q_r_24(fstb8_r_d ),
                                            .q_r_25(fstb9_r_d ),
                                            .q_r_26(fstb10_r_d),
                                            .q_r_27(fstb11_r_d),
                                            .q_r_28(fstb12_r_d),
                                            .q_r_29(fstb13_r_d),
                                            .q_r_30(fstb14_r_d),
                                            .q_r_31(fstb15_r_d)
                                            
                                             );
    wire    signed  [W_8-1:0]   sa0_r,  sa0_i;
    wire    signed  [W_8-1:0]   sa1_r,  sa1_i;
    wire    signed  [W_8-1:0]   sa2_r,  sa2_i;
    wire    signed  [W_8-1:0]   sa3_r,  sa3_i;
    wire    signed  [W_8-1:0]   sa4_r,  sa4_i;
    wire    signed  [W_8-1:0]   sa5_r,  sa5_i;
    wire    signed  [W_8-1:0]   sa6_r,  sa6_i;
    wire    signed  [W_8-1:0]   sa7_r,  sa7_i;
    
    wire    signed  [W_8-1:0]   sb0_r,  sb0_i;
    wire    signed  [W_8-1:0]   sb1_r,  sb1_i;
    wire    signed  [W_8-1:0]   sb2_r,  sb2_i;
    wire    signed  [W_8-1:0]   sb3_r,  sb3_i;
    wire    signed  [W_8-1:0]   sb4_r,  sb4_i;
    wire    signed  [W_8-1:0]   sb5_r,  sb5_i;
    wire    signed  [W_8-1:0]   sb6_r,  sb6_i;
    wire    signed  [W_8-1:0]   sb7_r,  sb7_i;
    
    wire    signed  [W_8-1:0]   sc0_r,  sc0_i;
    wire    signed  [W_8-1:0]   sc1_r,  sc1_i;
    wire    signed  [W_8-1:0]   sc2_r,  sc2_i;
    wire    signed  [W_8-1:0]   sc3_r,  sc3_i;
    wire    signed  [W_8-1:0]   sc4_r,  sc4_i;
    wire    signed  [W_8-1:0]   sc5_r,  sc5_i;
    wire    signed  [W_8-1:0]   sc6_r,  sc6_i;
    wire    signed  [W_8-1:0]   sc7_r,  sc7_i;
    
    wire    signed  [W_8-1:0]   sd0_r,  sd0_i;
    wire    signed  [W_8-1:0]   sd1_r,  sd1_i;
    wire    signed  [W_8-1:0]   sd2_r,  sd2_i;
    wire    signed  [W_8-1:0]   sd3_r,  sd3_i;
    wire    signed  [W_8-1:0]   sd4_r,  sd4_i;
    wire    signed  [W_8-1:0]   sd5_r,  sd5_i;
    wire    signed  [W_8-1:0]   sd6_r,  sd6_i;
    wire    signed  [W_8-1:0]   sd7_r,  sd7_i;

    wire    signed  [W_8-1:0]   sa0_r_d,  sa0_i_d;
    wire    signed  [W_8-1:0]   sa1_r_d,  sa1_i_d;
    wire    signed  [W_8-1:0]   sa2_r_d,  sa2_i_d;
    wire    signed  [W_8-1:0]   sa3_r_d,  sa3_i_d;
    wire    signed  [W_8-1:0]   sa4_r_d,  sa4_i_d;
    wire    signed  [W_8-1:0]   sa5_r_d,  sa5_i_d;
    wire    signed  [W_8-1:0]   sa6_r_d,  sa6_i_d;
    wire    signed  [W_8-1:0]   sa7_r_d,  sa7_i_d;
    
    wire    signed  [W_8-1:0]   sb0_r_d,  sb0_i_d;
    wire    signed  [W_8-1:0]   sb1_r_d,  sb1_i_d;
    wire    signed  [W_8-1:0]   sb2_r_d,  sb2_i_d;
    wire    signed  [W_8-1:0]   sb3_r_d,  sb3_i_d;
    wire    signed  [W_8-1:0]   sb4_r_d,  sb4_i_d;
    wire    signed  [W_8-1:0]   sb5_r_d,  sb5_i_d;
    wire    signed  [W_8-1:0]   sb6_r_d,  sb6_i_d;
    wire    signed  [W_8-1:0]   sb7_r_d,  sb7_i_d;
    
    wire    signed  [W_8-1:0]   sc0_r_d,  sc0_i_d;
    wire    signed  [W_8-1:0]   sc1_r_d,  sc1_i_d;
    wire    signed  [W_8-1:0]   sc2_r_d,  sc2_i_d;
    wire    signed  [W_8-1:0]   sc3_r_d,  sc3_i_d;
    wire    signed  [W_8-1:0]   sc4_r_d,  sc4_i_d;
    wire    signed  [W_8-1:0]   sc5_r_d,  sc5_i_d;
    wire    signed  [W_8-1:0]   sc6_r_d,  sc6_i_d;
    wire    signed  [W_8-1:0]   sc7_r_d,  sc7_i_d;
    
    wire    signed  [W_8-1:0]   sd0_r_d,  sd0_i_d;
    wire    signed  [W_8-1:0]   sd1_r_d,  sd1_i_d;
    wire    signed  [W_8-1:0]   sd2_r_d,  sd2_i_d;
    wire    signed  [W_8-1:0]   sd3_r_d,  sd3_i_d;
    wire    signed  [W_8-1:0]   sd4_r_d,  sd4_i_d;
    wire    signed  [W_8-1:0]   sd5_r_d,  sd5_i_d;
    wire    signed  [W_8-1:0]   sd6_r_d,  sd6_i_d;
    wire    signed  [W_8-1:0]   sd7_r_d,  sd7_i_d;

dft_16to8   #(W_16, W_8, TW_W)   i_dft_16to8     (
                                 
                                  .w0_r(w0_r)   ,
                                  .w1_r(w1_r)   ,
                                  .w2_r(w2_r)   ,
                                  .w3_r(w3_r)   ,
                                  .w4_r(w4_r)   ,
                                  .w5_r(w5_r)   ,
                                  .w6_r(w6_r)   ,
                                  .w7_r(w7_r)   ,
                                  .w8_r(w8_r)   ,
                                  .w9_r(w9_r)   ,
                                  .w10_r(w10_r)   ,
                                  .w11_r(w11_r)   ,
                                  .w12_r(w12_r)   ,
                                  .w13_r(w13_r)   ,
                                  .w14_r(w14_r)   ,
                                  .w15_r(w15_r)   ,

                                  .w0_i(w0_i)   ,
                                  .w1_i(w1_i)   ,
                                  .w2_i(w2_i)   ,
                                  .w3_i(w3_i)   ,
                                  .w4_i(w4_i)   ,
                                  .w5_i(w5_i)   ,
                                  .w6_i(w6_i)   ,
                                  .w7_i(w7_i)   ,
                                  .w8_i(w8_i)   ,
                                  .w9_i(w9_i)   ,
                                  .w10_i(w10_i)   ,
                                  .w11_i(w11_i)   ,
                                  .w12_i(w12_i)   ,
                                  .w13_i(w13_i)   ,
                                  .w14_i(w14_i)   ,
                                  .w15_i(w15_i)   ,
                                  
                                  .fa0_r(fsta0_r_d) ,
                                  .fa1_r(fsta1_r_d) ,
                                  .fa2_r(fsta2_r_d) ,
                                  .fa3_r(fsta3_r_d) ,
                                  .fa4_r(fsta4_r_d) ,
                                  .fa5_r(fsta5_r_d) ,
                                  .fa6_r(fsta6_r_d) ,
                                  .fa7_r(fsta7_r_d) ,
                                  .fa8_r(fsta8_r_d) ,
                                  .fa9_r(fsta9_r_d) ,
                                  .fa10_r(fsta10_r_d) ,
                                  .fa11_r(fsta11_r_d) ,
                                  .fa12_r(fsta12_r_d) ,
                                  .fa13_r(fsta13_r_d) ,
                                  .fa14_r(fsta14_r_d) ,
                                  .fa15_r(fsta15_r_d) ,
                                  
                                  .fb0_r(fstb0_r_d) ,
                                  .fb1_r(fstb1_r_d) ,
                                  .fb2_r(fstb2_r_d) ,
                                  .fb3_r(fstb3_r_d) ,
                                  .fb4_r(fstb4_r_d) ,
                                  .fb5_r(fstb5_r_d) ,
                                  .fb6_r(fstb6_r_d) ,
                                  .fb7_r(fstb7_r_d) ,
                                  .fb8_r(fstb8_r_d) ,
                                  .fb9_r(fstb9_r_d) ,
                                  .fb10_r(fstb10_r_d) ,
                                  .fb11_r(fstb11_r_d) ,
                                  .fb12_r(fstb12_r_d) ,
                                  .fb13_r(fstb13_r_d) ,
                                  .fb14_r(fstb14_r_d) ,
                                  .fb15_r(fstb15_r_d) , 
                                  
                                  .sa0_r(sa0_r) ,
                                  .sa1_r(sa1_r) ,
                                  .sa2_r(sa2_r) ,
                                  .sa3_r(sa3_r) ,
                                  .sa4_r(sa4_r) ,
                                  .sa5_r(sa5_r) ,
                                  .sa6_r(sa6_r) ,
                                  .sa7_r(sa7_r) ,
                                  
                                  .sa0_i(sa0_i) ,
                                  .sa1_i(sa1_i) ,
                                  .sa2_i(sa2_i) ,
                                  .sa3_i(sa3_i) ,
                                  .sa4_i(sa4_i) ,
                                  .sa5_i(sa5_i) ,
                                  .sa6_i(sa6_i) ,
                                  .sa7_i(sa7_i) ,

                                  .sb0_r(sb0_r) ,
                                  .sb1_r(sb1_r) ,
                                  .sb2_r(sb2_r) ,
                                  .sb3_r(sb3_r) ,
                                  .sb4_r(sb4_r) ,
                                  .sb5_r(sb5_r) ,
                                  .sb6_r(sb6_r) ,
                                  .sb7_r(sb7_r) ,
                                  
                                  .sb0_i(sb0_i) ,
                                  .sb1_i(sb1_i) ,
                                  .sb2_i(sb2_i) ,
                                  .sb3_i(sb3_i) ,
                                  .sb4_i(sb4_i) ,
                                  .sb5_i(sb5_i) ,
                                  .sb6_i(sb6_i) ,
                                  .sb7_i(sb7_i) ,

                                  .sc0_r(sc0_r) ,
                                  .sc1_r(sc1_r) ,
                                  .sc2_r(sc2_r) ,
                                  .sc3_r(sc3_r) ,
                                  .sc4_r(sc4_r) ,
                                  .sc5_r(sc5_r) ,
                                  .sc6_r(sc6_r) ,
                                  .sc7_r(sc7_r) ,
                                  
                                  .sc0_i(sc0_i) ,
                                  .sc1_i(sc1_i) ,
                                  .sc2_i(sc2_i) ,
                                  .sc3_i(sc3_i) ,
                                  .sc4_i(sc4_i) ,
                                  .sc5_i(sc5_i) ,
                                  .sc6_i(sc6_i) ,
                                  .sc7_i(sc7_i) ,

                                  .sd0_r(sd0_r) ,
                                  .sd1_r(sd1_r) ,
                                  .sd2_r(sd2_r) ,
                                  .sd3_r(sd3_r) ,
                                  .sd4_r(sd4_r) ,
                                  .sd5_r(sd5_r) ,
                                  .sd6_r(sd6_r) ,
                                  .sd7_r(sd7_r) ,
                                  
                                  .sd0_i(sd0_i) ,
                                  .sd1_i(sd1_i) ,
                                  .sd2_i(sd2_i) ,
                                  .sd3_i(sd3_i) ,
                                  .sd4_i(sd4_i) ,
                                  .sd5_i(sd5_i) ,
                                  .sd6_i(sd6_i) ,
                                  .sd7_i(sd7_i) 
                                  );
                                
    wire    signed  [W_4-1:0]   ta0_r,  ta0_i;
    wire    signed  [W_4-1:0]   ta1_r,  ta1_i;
    wire    signed  [W_4-1:0]   ta2_r,  ta2_i;
    wire    signed  [W_4-1:0]   ta3_r,  ta3_i;
    
    wire    signed  [W_4-1:0]   tb0_r,  tb0_i;
    wire    signed  [W_4-1:0]   tb1_r,  tb1_i;
    wire    signed  [W_4-1:0]   tb2_r,  tb2_i;
    wire    signed  [W_4-1:0]   tb3_r,  tb3_i;
    
    wire    signed  [W_4-1:0]   tc0_r,  tc0_i;
    wire    signed  [W_4-1:0]   tc1_r,  tc1_i;
    wire    signed  [W_4-1:0]   tc2_r,  tc2_i;
    wire    signed  [W_4-1:0]   tc3_r,  tc3_i;
    
    wire    signed  [W_4-1:0]   td0_r,  td0_i;
    wire    signed  [W_4-1:0]   td1_r,  td1_i;
    wire    signed  [W_4-1:0]   td2_r,  td2_i;
    wire    signed  [W_4-1:0]   td3_r,  td3_i;
    
    wire    signed  [W_4-1:0]   te0_r,  te0_i;
    wire    signed  [W_4-1:0]   te1_r,  te1_i;
    wire    signed  [W_4-1:0]   te2_r,  te2_i;
    wire    signed  [W_4-1:0]   te3_r,  te3_i;
    
    wire    signed  [W_4-1:0]   tf0_r,  tf0_i;
    wire    signed  [W_4-1:0]   tf1_r,  tf1_i;
    wire    signed  [W_4-1:0]   tf2_r,  tf2_i;
    wire    signed  [W_4-1:0]   tf3_r,  tf3_i;
    
    wire    signed  [W_4-1:0]   tg0_r,  tg0_i;
    wire    signed  [W_4-1:0]   tg1_r,  tg1_i;
    wire    signed  [W_4-1:0]   tg2_r,  tg2_i;
    wire    signed  [W_4-1:0]   tg3_r,  tg3_i;
    
    wire    signed  [W_4-1:0]   th0_r,  th0_i;
    wire    signed  [W_4-1:0]   th1_r,  th1_i;
    wire    signed  [W_4-1:0]   th2_r,  th2_i;
    wire    signed  [W_4-1:0]   th3_r,  th3_i;

    wire    signed  [W_4-1:0]   ta0_r_d,  ta0_i_d;
    wire    signed  [W_4-1:0]   ta1_r_d,  ta1_i_d;
    wire    signed  [W_4-1:0]   ta2_r_d,  ta2_i_d;
    wire    signed  [W_4-1:0]   ta3_r_d,  ta3_i_d;
    
    wire    signed  [W_4-1:0]   tb0_r_d,  tb0_i_d;
    wire    signed  [W_4-1:0]   tb1_r_d,  tb1_i_d;
    wire    signed  [W_4-1:0]   tb2_r_d,  tb2_i_d;
    wire    signed  [W_4-1:0]   tb3_r_d,  tb3_i_d;
    
    wire    signed  [W_4-1:0]   tc0_r_d,  tc0_i_d;
    wire    signed  [W_4-1:0]   tc1_r_d,  tc1_i_d;
    wire    signed  [W_4-1:0]   tc2_r_d,  tc2_i_d;
    wire    signed  [W_4-1:0]   tc3_r_d,  tc3_i_d;
    
    wire    signed  [W_4-1:0]   td0_r_d,  td0_i_d;
    wire    signed  [W_4-1:0]   td1_r_d,  td1_i_d;
    wire    signed  [W_4-1:0]   td2_r_d,  td2_i_d;
    wire    signed  [W_4-1:0]   td3_r_d,  td3_i_d;
    
    wire    signed  [W_4-1:0]   te0_r_d,  te0_i_d;
    wire    signed  [W_4-1:0]   te1_r_d,  te1_i_d;
    wire    signed  [W_4-1:0]   te2_r_d,  te2_i_d;
    wire    signed  [W_4-1:0]   te3_r_d,  te3_i_d;
    
    wire    signed  [W_4-1:0]   tf0_r_d,  tf0_i_d;
    wire    signed  [W_4-1:0]   tf1_r_d,  tf1_i_d;
    wire    signed  [W_4-1:0]   tf2_r_d,  tf2_i_d;
    wire    signed  [W_4-1:0]   tf3_r_d,  tf3_i_d;
    
    wire    signed  [W_4-1:0]   tg0_r_d,  tg0_i_d;
    wire    signed  [W_4-1:0]   tg1_r_d,  tg1_i_d;
    wire    signed  [W_4-1:0]   tg2_r_d,  tg2_i_d;
    wire    signed  [W_4-1:0]   tg3_r_d,  tg3_i_d;
    
    wire    signed  [W_4-1:0]   th0_r_d,  th0_i_d;
    wire    signed  [W_4-1:0]   th1_r_d,  th1_i_d;
    wire    signed  [W_4-1:0]   th2_r_d,  th2_i_d;
    wire    signed  [W_4-1:0]   th3_r_d,  th3_i_d;
    
    wire    signed  [W_2-1:0]   fa0_r,  fa0_i;
    wire    signed  [W_2-1:0]   fa1_r,  fa1_i;
    
    wire    signed  [W_2-1:0]   fb0_r,  fb0_i;
    wire    signed  [W_2-1:0]   fb1_r,  fb1_i;
    
    wire    signed  [W_2-1:0]   fc0_r,  fc0_i;
    wire    signed  [W_2-1:0]   fc1_r,  fc1_i;
    
    wire    signed  [W_2-1:0]   fd0_r,  fd0_i;
    wire    signed  [W_2-1:0]   fd1_r,  fd1_i;
    
    wire    signed  [W_2-1:0]   fe0_r,  fe0_i;
    wire    signed  [W_2-1:0]   fe1_r,  fe1_i;
   
    wire    signed  [W_2-1:0]   ff0_r,  ff0_i;
    wire    signed  [W_2-1:0]   ff1_r,  ff1_i;
   
    wire    signed  [W_2-1:0]   fg0_r,  fg0_i;
    wire    signed  [W_2-1:0]   fg1_r,  fg1_i;
   
    wire    signed  [W_2-1:0]   fh0_r,  fh0_i;
    wire    signed  [W_2-1:0]   fh1_r,  fh1_i;
   
    wire    signed  [W_2-1:0]   fi0_r,  fi0_i;
    wire    signed  [W_2-1:0]   fi1_r,  fi1_i;
    
    wire    signed  [W_2-1:0]   fj0_r,  fj0_i;
    wire    signed  [W_2-1:0]   fj1_r,  fj1_i;
    
    wire    signed  [W_2-1:0]   fk0_r,  fk0_i;
    wire    signed  [W_2-1:0]   fk1_r,  fk1_i;
    
    wire    signed  [W_2-1:0]   fl0_r,  fl0_i;
    wire    signed  [W_2-1:0]   fl1_r,  fl1_i;
    
    wire    signed  [W_2-1:0]   fm0_r,  fm0_i;
    wire    signed  [W_2-1:0]   fm1_r,  fm1_i;
    
    wire    signed  [W_2-1:0]   fn0_r,  fn0_i;
    wire    signed  [W_2-1:0]   fn1_r,  fn1_i;
   
    wire    signed  [W_2-1:0]   fo0_r,  fo0_i;
    wire    signed  [W_2-1:0]   fo1_r,  fo1_i;
   
    wire    signed  [W_2-1:0]   fp0_r,  fp0_i;
    wire    signed  [W_2-1:0]   fp1_r,  fp1_i;

    wire    signed  [W_2-1:0]   fa0_r_d,  fa0_i_d;
    wire    signed  [W_2-1:0]   fa1_r_d,  fa1_i_d;
    
    wire    signed  [W_2-1:0]   fb0_r_d,  fb0_i_d;
    wire    signed  [W_2-1:0]   fb1_r_d,  fb1_i_d;
    
    wire    signed  [W_2-1:0]   fc0_r_d,  fc0_i_d;
    wire    signed  [W_2-1:0]   fc1_r_d,  fc1_i_d;
    
    wire    signed  [W_2-1:0]   fd0_r_d,  fd0_i_d;
    wire    signed  [W_2-1:0]   fd1_r_d,  fd1_i_d;
    
    wire    signed  [W_2-1:0]   fe0_r_d,  fe0_i_d;
    wire    signed  [W_2-1:0]   fe1_r_d,  fe1_i_d;
   
    wire    signed  [W_2-1:0]   ff0_r_d,  ff0_i_d;
    wire    signed  [W_2-1:0]   ff1_r_d,  ff1_i_d;
   
    wire    signed  [W_2-1:0]   fg0_r_d,  fg0_i_d;
    wire    signed  [W_2-1:0]   fg1_r_d,  fg1_i_d;
   
    wire    signed  [W_2-1:0]   fh0_r_d,  fh0_i_d;
    wire    signed  [W_2-1:0]   fh1_r_d,  fh1_i_d;
   
    wire    signed  [W_2-1:0]   fi0_r_d,  fi0_i_d;
    wire    signed  [W_2-1:0]   fi1_r_d,  fi1_i_d;
    
    wire    signed  [W_2-1:0]   fj0_r_d,  fj0_i_d;
    wire    signed  [W_2-1:0]   fj1_r_d,  fj1_i_d;
    
    wire    signed  [W_2-1:0]   fk0_r_d,  fk0_i_d;
    wire    signed  [W_2-1:0]   fk1_r_d,  fk1_i_d;
    
    wire    signed  [W_2-1:0]   fl0_r_d,  fl0_i_d;
    wire    signed  [W_2-1:0]   fl1_r_d,  fl1_i_d;
    
    wire    signed  [W_2-1:0]   fm0_r_d,  fm0_i_d;
    wire    signed  [W_2-1:0]   fm1_r_d,  fm1_i_d;
    
    wire    signed  [W_2-1:0]   fn0_r_d,  fn0_i_d;
    wire    signed  [W_2-1:0]   fn1_r_d,  fn1_i_d;
   
    wire    signed  [W_2-1:0]   fo0_r_d,  fo0_i_d;
    wire    signed  [W_2-1:0]   fo1_r_d,  fo1_i_d;
   
    wire    signed  [W_2-1:0]   fp0_r_d,  fp0_i_d;
    wire    signed  [W_2-1:0]   fp1_r_d,  fp1_i_d;

pipe    #(W_8)    i_pipe_1              
                                    (       .clk(clk),
                                            .arstb(arstb),
                                            .rstb(rstb),
                                            
                                            .d_r_0 (sa0_r),
                                            .d_r_1 (sa1_r),
                                            .d_r_2 (sa2_r),
                                            .d_r_3 (sa3_r),
                                            .d_r_4 (sa4_r),
                                            .d_r_5 (sa5_r),
                                            .d_r_6 (sa6_r),
                                            .d_r_7 (sa7_r),
                                            .d_r_8 (sb0_r),
                                            .d_r_9 (sb1_r),
                                            .d_r_10(sb2_r),
                                            .d_r_11(sb3_r),
                                            .d_r_12(sb4_r),
                                            .d_r_13(sb5_r),
                                            .d_r_14(sb6_r),
                                            .d_r_15(sb7_r),
                                            .d_r_16(sc0_r),
                                            .d_r_17(sc1_r),
                                            .d_r_18(sc2_r),
                                            .d_r_19(sc3_r),
                                            .d_r_20(sc4_r),
                                            .d_r_21(sc5_r),
                                            .d_r_22(sc6_r),
                                            .d_r_23(sc7_r),
                                            .d_r_24(sd0_r),
                                            .d_r_25(sd1_r),
                                            .d_r_26(sd2_r),
                                            .d_r_27(sd3_r),
                                            .d_r_28(sd4_r),
                                            .d_r_29(sd5_r),
                                            .d_r_30(sd6_r),
                                            .d_r_31(sd7_r),

                                            .d_i_0 (sa0_i),
                                            .d_i_1 (sa1_i),
                                            .d_i_2 (sa2_i),
                                            .d_i_3 (sa3_i),
                                            .d_i_4 (sa4_i),
                                            .d_i_5 (sa5_i),
                                            .d_i_6 (sa6_i),
                                            .d_i_7 (sa7_i),
                                            .d_i_8 (sb0_i),
                                            .d_i_9 (sb1_i),
                                            .d_i_10(sb2_i),
                                            .d_i_11(sb3_i),
                                            .d_i_12(sb4_i),
                                            .d_i_13(sb5_i),
                                            .d_i_14(sb6_i),
                                            .d_i_15(sb7_i),
                                            .d_i_16(sc0_i),
                                            .d_i_17(sc1_i),
                                            .d_i_18(sc2_i),
                                            .d_i_19(sc3_i),
                                            .d_i_20(sc4_i),
                                            .d_i_21(sc5_i),
                                            .d_i_22(sc6_i),
                                            .d_i_23(sc7_i),
                                            .d_i_24(sd0_i),
                                            .d_i_25(sd1_i),
                                            .d_i_26(sd2_i),
                                            .d_i_27(sd3_i),
                                            .d_i_28(sd4_i),
                                            .d_i_29(sd5_i),
                                            .d_i_30(sd6_i),
                                            .d_i_31(sd7_i),
                                        
                                            .q_r_0 (sa0_r_d),
                                            .q_r_1 (sa1_r_d),
                                            .q_r_2 (sa2_r_d),
                                            .q_r_3 (sa3_r_d),
                                            .q_r_4 (sa4_r_d),
                                            .q_r_5 (sa5_r_d),
                                            .q_r_6 (sa6_r_d),
                                            .q_r_7 (sa7_r_d),
                                            .q_r_8 (sb0_r_d),
                                            .q_r_9 (sb1_r_d),
                                            .q_r_10(sb2_r_d),
                                            .q_r_11(sb3_r_d),
                                            .q_r_12(sb4_r_d),
                                            .q_r_13(sb5_r_d),
                                            .q_r_14(sb6_r_d),
                                            .q_r_15(sb7_r_d),
                                            .q_r_16(sc0_r_d),
                                            .q_r_17(sc1_r_d),
                                            .q_r_18(sc2_r_d),
                                            .q_r_19(sc3_r_d),
                                            .q_r_20(sc4_r_d),
                                            .q_r_21(sc5_r_d),
                                            .q_r_22(sc6_r_d),
                                            .q_r_23(sc7_r_d),
                                            .q_r_24(sd0_r_d),
                                            .q_r_25(sd1_r_d),
                                            .q_r_26(sd2_r_d),
                                            .q_r_27(sd3_r_d),
                                            .q_r_28(sd4_r_d),
                                            .q_r_29(sd5_r_d),
                                            .q_r_30(sd6_r_d),
                                            .q_r_31(sd7_r_d),
                                                         
                                            .q_i_0 (sa0_i_d),
                                            .q_i_1 (sa1_i_d),
                                            .q_i_2 (sa2_i_d),
                                            .q_i_3 (sa3_i_d),
                                            .q_i_4 (sa4_i_d),
                                            .q_i_5 (sa5_i_d),
                                            .q_i_6 (sa6_i_d),
                                            .q_i_7 (sa7_i_d),
                                            .q_i_8 (sb0_i_d),
                                            .q_i_9 (sb1_i_d),
                                            .q_i_10(sb2_i_d),
                                            .q_i_11(sb3_i_d),
                                            .q_i_12(sb4_i_d),
                                            .q_i_13(sb5_i_d),
                                            .q_i_14(sb6_i_d),
                                            .q_i_15(sb7_i_d),
                                            .q_i_16(sc0_i_d),
                                            .q_i_17(sc1_i_d),
                                            .q_i_18(sc2_i_d),
                                            .q_i_19(sc3_i_d),
                                            .q_i_20(sc4_i_d),
                                            .q_i_21(sc5_i_d),
                                            .q_i_22(sc6_i_d),
                                            .q_i_23(sc7_i_d),
                                            .q_i_24(sd0_i_d),
                                            .q_i_25(sd1_i_d),
                                            .q_i_26(sd2_i_d),
                                            .q_i_27(sd3_i_d),
                                            .q_i_28(sd4_i_d),
                                            .q_i_29(sd5_i_d),
                                            .q_i_30(sd6_i_d),
                                            .q_i_31(sd7_i_d)
                                            
                                             );




dft_8to4    #(W_8, W_4, TW_W) i_dft_8_to_4        (
                                 
                                  .w0_r(w0_r)   ,
                                  .w2_r(w2_r)   ,
                                  .w4_r(w4_r)   ,
                                  .w6_r(w6_r)   ,
                                  .w8_r(w8_r)   ,
                                  .w10_r(w10_r)   ,
                                  .w12_r(w12_r)   ,
                                  .w14_r(w14_r)   ,

                                  .w0_i(w0_i)   ,
                                  .w2_i(w2_i)   ,
                                  .w4_i(w4_i)   ,
                                  .w6_i(w6_i)   ,
                                  .w8_i(w8_i)   ,
                                  .w10_i(w10_i)   ,
                                  .w12_i(w12_i)   ,
                                  .w14_i(w14_i)   ,

                                  .sa0_r(sa0_r_d) ,
                                  .sa1_r(sa1_r_d) ,
                                  .sa2_r(sa2_r_d) ,
                                  .sa3_r(sa3_r_d) ,
                                  .sa4_r(sa4_r_d) ,
                                  .sa5_r(sa5_r_d) ,
                                  .sa6_r(sa6_r_d) ,
                                  .sa7_r(sa7_r_d) ,
                                  
                                  .sa0_i(sa0_i_d) ,
                                  .sa1_i(sa1_i_d) ,
                                  .sa2_i(sa2_i_d) ,
                                  .sa3_i(sa3_i_d) ,
                                  .sa4_i(sa4_i_d) ,
                                  .sa5_i(sa5_i_d) ,
                                  .sa6_i(sa6_i_d) ,
                                  .sa7_i(sa7_i_d) ,

                                  .sb0_r(sb0_r_d) ,
                                  .sb1_r(sb1_r_d) ,
                                  .sb2_r(sb2_r_d) ,
                                  .sb3_r(sb3_r_d) ,
                                  .sb4_r(sb4_r_d) ,
                                  .sb5_r(sb5_r_d) ,
                                  .sb6_r(sb6_r_d) ,
                                  .sb7_r(sb7_r_d) ,
                                  
                                  .sb0_i(sb0_i_d) ,
                                  .sb1_i(sb1_i_d) ,
                                  .sb2_i(sb2_i_d) ,
                                  .sb3_i(sb3_i_d) ,
                                  .sb4_i(sb4_i_d) ,
                                  .sb5_i(sb5_i_d) ,
                                  .sb6_i(sb6_i_d) ,
                                  .sb7_i(sb7_i_d) ,

                                  .sc0_r(sc0_r_d) ,
                                  .sc1_r(sc1_r_d) ,
                                  .sc2_r(sc2_r_d) ,
                                  .sc3_r(sc3_r_d) ,
                                  .sc4_r(sc4_r_d) ,
                                  .sc5_r(sc5_r_d) ,
                                  .sc6_r(sc6_r_d) ,
                                  .sc7_r(sc7_r_d) ,
                                  
                                  .sc0_i(sc0_i_d) ,
                                  .sc1_i(sc1_i_d) ,
                                  .sc2_i(sc2_i_d) ,
                                  .sc3_i(sc3_i_d) ,
                                  .sc4_i(sc4_i_d) ,
                                  .sc5_i(sc5_i_d) ,
                                  .sc6_i(sc6_i_d) ,
                                  .sc7_i(sc7_i_d) ,

                                  .sd0_r(sd0_r_d) ,
                                  .sd1_r(sd1_r_d) ,
                                  .sd2_r(sd2_r_d) ,
                                  .sd3_r(sd3_r_d) ,
                                  .sd4_r(sd4_r_d) ,
                                  .sd5_r(sd5_r_d) ,
                                  .sd6_r(sd6_r_d) ,
                                  .sd7_r(sd7_r_d) ,
                                  
                                  .sd0_i(sd0_i_d) ,
                                  .sd1_i(sd1_i_d) ,
                                  .sd2_i(sd2_i_d) ,
                                  .sd3_i(sd3_i_d) ,
                                  .sd4_i(sd4_i_d) ,
                                  .sd5_i(sd5_i_d) ,
                                  .sd6_i(sd6_i_d) ,
                                  .sd7_i(sd7_i_d) ,
                                  
                                  .ta0_r(ta0_r),  .ta0_i(ta0_i),
                                  .ta1_r(ta1_r),  .ta1_i(ta1_i),   
                                  .ta2_r(ta2_r),  .ta2_i(ta2_i),   
                                  .ta3_r(ta3_r),  .ta3_i(ta3_i),   
                                                             
                                  .tb0_r(tb0_r),  .tb0_i(tb0_i),   
                                  .tb1_r(tb1_r),  .tb1_i(tb1_i),   
                                  .tb2_r(tb2_r),  .tb2_i(tb2_i),   
                                  .tb3_r(tb3_r),  .tb3_i(tb3_i),   
                                                             
                                  .tc0_r(tc0_r),  .tc0_i(tc0_i),   
                                  .tc1_r(tc1_r),  .tc1_i(tc1_i),   
                                  .tc2_r(tc2_r),  .tc2_i(tc2_i),   
                                  .tc3_r(tc3_r),  .tc3_i(tc3_i),   
                                                             
                                  .td0_r(td0_r),  .td0_i(td0_i),   
                                  .td1_r(td1_r),  .td1_i(td1_i),   
                                  .td2_r(td2_r),  .td2_i(td2_i),   
                                  .td3_r(td3_r),  .td3_i(td3_i),   
                                                             
                                  .te0_r(te0_r),  .te0_i(te0_i),   
                                  .te1_r(te1_r),  .te1_i(te1_i),   
                                  .te2_r(te2_r),  .te2_i(te2_i),   
                                  .te3_r(te3_r),  .te3_i(te3_i),   
                                                             
                                  .tf0_r(tf0_r),  .tf0_i(tf0_i),   
                                  .tf1_r(tf1_r),  .tf1_i(tf1_i),   
                                  .tf2_r(tf2_r),  .tf2_i(tf2_i),   
                                  .tf3_r(tf3_r),  .tf3_i(tf3_i),   
                                                             
                                  .tg0_r(tg0_r),  .tg0_i(tg0_i),   
                                  .tg1_r(tg1_r),  .tg1_i(tg1_i),   
                                  .tg2_r(tg2_r),  .tg2_i(tg2_i),   
                                  .tg3_r(tg3_r),  .tg3_i(tg3_i),   
                                                             
                                  .th0_r(th0_r),  .th0_i(th0_i),   
                                  .th1_r(th1_r),  .th1_i(th1_i),   
                                  .th2_r(th2_r),  .th2_i(th2_i),   
                                  .th3_r(th3_r),  .th3_i(th3_i)
                                
                                );
                   

pipe    #(W_4)    i_pipe_2              
                                    (       .clk(clk),
                                            .arstb(arstb),
                                            .rstb(rstb),
                                            
                                            .d_r_0 (ta0_r),
                                            .d_r_1 (ta1_r),
                                            .d_r_2 (ta2_r),
                                            .d_r_3 (ta3_r),
                                            
                                            .d_r_4 (tb0_r),
                                            .d_r_5 (tb1_r),
                                            .d_r_6 (tb2_r),
                                            .d_r_7 (tb3_r),
                                            
                                            .d_r_8 (tc0_r),
                                            .d_r_9 (tc1_r),
                                            .d_r_10(tc2_r),
                                            .d_r_11(tc3_r),
                                            
                                            .d_r_12(td0_r),
                                            .d_r_13(td1_r),
                                            .d_r_14(td2_r),
                                            .d_r_15(td3_r),
                                            
                                            .d_r_16(te0_r),
                                            .d_r_17(te1_r),
                                            .d_r_18(te2_r),
                                            .d_r_19(te3_r),
                                            
                                            .d_r_20(tf0_r),
                                            .d_r_21(tf1_r),
                                            .d_r_22(tf2_r),
                                            .d_r_23(tf3_r),
                                            
                                            .d_r_24(tg0_r),
                                            .d_r_25(tg1_r),
                                            .d_r_26(tg2_r),
                                            .d_r_27(tg3_r),
                                            
                                            .d_r_28(th0_r),
                                            .d_r_29(th1_r),
                                            .d_r_30(th2_r),
                                            .d_r_31(th3_r),

                                            .d_i_0 (ta0_i),
                                            .d_i_1 (ta1_i),
                                            .d_i_2 (ta2_i),
                                            .d_i_3 (ta3_i),
                                            
                                            .d_i_4 (tb0_i),
                                            .d_i_5 (tb1_i),
                                            .d_i_6 (tb2_i),
                                            .d_i_7 (tb3_i),
                                            
                                            .d_i_8 (tc0_i),
                                            .d_i_9 (tc1_i),
                                            .d_i_10(tc2_i),
                                            .d_i_11(tc3_i),
                                            
                                            .d_i_12(td0_i),
                                            .d_i_13(td1_i),
                                            .d_i_14(td2_i),
                                            .d_i_15(td3_i),
                                            
                                            .d_i_16(te0_i),
                                            .d_i_17(te1_i),
                                            .d_i_18(te2_i),
                                            .d_i_19(te3_i),
                                            
                                            .d_i_20(tf0_i),
                                            .d_i_21(tf1_i),
                                            .d_i_22(tf2_i),
                                            .d_i_23(tf3_i),
                                            
                                            .d_i_24(tg0_i),
                                            .d_i_25(tg1_i),
                                            .d_i_26(tg2_i),
                                            .d_i_27(tg3_i),
                                            
                                            .d_i_28(th0_i),
                                            .d_i_29(th1_i),
                                            .d_i_30(th2_i),
                                            .d_i_31(th3_i),
                                        
                                            .q_r_0 (ta0_r_d),
                                            .q_r_1 (ta1_r_d),
                                            .q_r_2 (ta2_r_d),
                                            .q_r_3 (ta3_r_d),
                                                         
                                            .q_r_4 (tb0_r_d),
                                            .q_r_5 (tb1_r_d),
                                            .q_r_6 (tb2_r_d),
                                            .q_r_7 (tb3_r_d),
                                                         
                                            .q_r_8 (tc0_r_d),
                                            .q_r_9 (tc1_r_d),
                                            .q_r_10(tc2_r_d),
                                            .q_r_11(tc3_r_d),
                                                         
                                            .q_r_12(td0_r_d),
                                            .q_r_13(td1_r_d),
                                            .q_r_14(td2_r_d),
                                            .q_r_15(td3_r_d),
                                                         
                                            .q_r_16(te0_r_d),
                                            .q_r_17(te1_r_d),
                                            .q_r_18(te2_r_d),
                                            .q_r_19(te3_r_d),
                                                         
                                            .q_r_20(tf0_r_d),
                                            .q_r_21(tf1_r_d),
                                            .q_r_22(tf2_r_d),
                                            .q_r_23(tf3_r_d),
                                                         
                                            .q_r_24(tg0_r_d),
                                            .q_r_25(tg1_r_d),
                                            .q_r_26(tg2_r_d),
                                            .q_r_27(tg3_r_d),
                                                         
                                            .q_r_28(th0_r_d),
                                            .q_r_29(th1_r_d),
                                            .q_r_30(th2_r_d),
                                            .q_r_31(th3_r_d),
                                                         
                                            .q_i_0 (ta0_i_d),
                                            .q_i_1 (ta1_i_d),
                                            .q_i_2 (ta2_i_d),
                                            .q_i_3 (ta3_i_d),
                                                         
                                            .q_i_4 (tb0_i_d),
                                            .q_i_5 (tb1_i_d),
                                            .q_i_6 (tb2_i_d),
                                            .q_i_7 (tb3_i_d),
                                                         
                                            .q_i_8 (tc0_i_d),
                                            .q_i_9 (tc1_i_d),
                                            .q_i_10(tc2_i_d),
                                            .q_i_11(tc3_i_d),
                                                         
                                            .q_i_12(td0_i_d),
                                            .q_i_13(td1_i_d),
                                            .q_i_14(td2_i_d),
                                            .q_i_15(td3_i_d),
                                                         
                                            .q_i_16(te0_i_d),
                                            .q_i_17(te1_i_d),
                                            .q_i_18(te2_i_d),
                                            .q_i_19(te3_i_d),
                                                         
                                            .q_i_20(tf0_i_d),
                                            .q_i_21(tf1_i_d),
                                            .q_i_22(tf2_i_d),
                                            .q_i_23(tf3_i_d),
                                                         
                                            .q_i_24(tg0_i_d),
                                            .q_i_25(tg1_i_d),
                                            .q_i_26(tg2_i_d),
                                            .q_i_27(tg3_i_d),
                                                         
                                            .q_i_28(th0_i_d),
                                            .q_i_29(th1_i_d),
                                            .q_i_30(th2_i_d),
                                            .q_i_31(th3_i_d)
                                            
                                             );





dft_4to2    #(W_4, W_2, TW_W)    i_dft_4to2      
                                (    
                                     .w12_i(w12_i) ,
                                     .w8_i(w8_i) ,
                                     .w4_i(w4_i) ,
                                     .w0_i(w0_i) ,
                                                     
                                     .w0_r(w0_r) , 
                                     .w4_r(w4_r) , 
                                     .w8_r(w8_r) , 
                                     .w12_r(w12_r),
                                                     
                                                     
                                    .ta0_r(ta0_r_d),  .ta0_i(ta0_i_d),
                                    .ta1_r(ta1_r_d),  .ta1_i(ta1_i_d),
                                    .ta2_r(ta2_r_d),  .ta2_i(ta2_i_d),
                                    .ta3_r(ta3_r_d),  .ta3_i(ta3_i_d),
                                                              
                                    .tb0_r(tb0_r_d),  .tb0_i(tb0_i_d),
                                    .tb1_r(tb1_r_d),  .tb1_i(tb1_i_d),
                                    .tb2_r(tb2_r_d),  .tb2_i(tb2_i_d),
                                    .tb3_r(tb3_r_d),  .tb3_i(tb3_i_d),
                                                              
                                    .tc0_r(tc0_r_d),  .tc0_i(tc0_i_d),
                                    .tc1_r(tc1_r_d),  .tc1_i(tc1_i_d),
                                    .tc2_r(tc2_r_d),  .tc2_i(tc2_i_d),
                                    .tc3_r(tc3_r_d),  .tc3_i(tc3_i_d),
                                                              
                                    .td0_r(td0_r_d),  .td0_i(td0_i_d),
                                    .td1_r(td1_r_d),  .td1_i(td1_i_d),
                                    .td2_r(td2_r_d),  .td2_i(td2_i_d),
                                    .td3_r(td3_r_d),  .td3_i(td3_i_d),
                                                              
                                    .te0_r(te0_r_d),  .te0_i(te0_i_d),
                                    .te1_r(te1_r_d),  .te1_i(te1_i_d),
                                    .te2_r(te2_r_d),  .te2_i(te2_i_d),
                                    .te3_r(te3_r_d),  .te3_i(te3_i_d),
                                                              
                                    .tf0_r(tf0_r_d),  .tf0_i(tf0_i_d),
                                    .tf1_r(tf1_r_d),  .tf1_i(tf1_i_d),
                                    .tf2_r(tf2_r_d),  .tf2_i(tf2_i_d),
                                    .tf3_r(tf3_r_d),  .tf3_i(tf3_i_d),
                                                              
                                    .tg0_r(tg0_r_d),  .tg0_i(tg0_i_d),
                                    .tg1_r(tg1_r_d),  .tg1_i(tg1_i_d),
                                    .tg2_r(tg2_r_d),  .tg2_i(tg2_i_d),
                                    .tg3_r(tg3_r_d),  .tg3_i(tg3_i_d),
                                                              
                                    .th0_r(th0_r_d),  .th0_i(th0_i_d),
                                    .th1_r(th1_r_d),  .th1_i(th1_i_d),
                                    .th2_r(th2_r_d),  .th2_i(th2_i_d),
                                    .th3_r(th3_r_d),  .th3_i(th3_i_d),
                                                     
                                    .fa0_r(fa0_r),  .fa0_i(fa0_i),
                                    .fa1_r(fa1_r),  .fa1_i(fa1_i),
                                                             
                                    .fb0_r(fb0_r),  .fb0_i(fb0_i),
                                    .fb1_r(fb1_r),  .fb1_i(fb1_i),
                                                             
                                    .fc0_r(fc0_r),  .fc0_i(fc0_i),
                                    .fc1_r(fc1_r),  .fc1_i(fc1_i),
                                                             
                                    .fd0_r(fd0_r),  .fd0_i(fd0_i),
                                    .fd1_r(fd1_r),  .fd1_i(fd1_i),
                                                             
                                    .fe0_r(fe0_r),  .fe0_i(fe0_i),
                                    .fe1_r(fe1_r),  .fe1_i(fe1_i),
                                                             
                                    .ff0_r(ff0_r),  .ff0_i(ff0_i),
                                    .ff1_r(ff1_r),  .ff1_i(ff1_i),
                                                             
                                    .fg0_r(fg0_r),  .fg0_i(fg0_i),
                                    .fg1_r(fg1_r),  .fg1_i(fg1_i),
                                                             
                                    .fh0_r(fh0_r),  .fh0_i(fh0_i),
                                    .fh1_r(fh1_r),  .fh1_i(fh1_i),
                                                             
                                    .fi0_r(fi0_r),  .fi0_i(fi0_i),
                                    .fi1_r(fi1_r),  .fi1_i(fi1_i),
                                                             
                                    .fj0_r(fj0_r),  .fj0_i(fj0_i),
                                    .fj1_r(fj1_r),  .fj1_i(fj1_i),
                                                             
                                    .fk0_r(fk0_r),  .fk0_i(fk0_i),
                                    .fk1_r(fk1_r),  .fk1_i(fk1_i),
                                                             
                                    .fl0_r(fl0_r),  .fl0_i(fl0_i),
                                    .fl1_r(fl1_r),  .fl1_i(fl1_i),
                                                             
                                    .fm0_r(fm0_r),  .fm0_i(fm0_i),
                                    .fm1_r(fm1_r),  .fm1_i(fm1_i),
                                                             
                                    .fn0_r(fn0_r),  .fn0_i(fn0_i),
                                    .fn1_r(fn1_r),  .fn1_i(fn1_i),
                                                             
                                    .fo0_r(fo0_r),  .fo0_i(fo0_i),
                                    .fo1_r(fo1_r),  .fo1_i(fo1_i),
                                                             
                                    .fp0_r(fp0_r),  .fp0_i(fp0_i),
                                    .fp1_r(fp1_r),  .fp1_i(fp1_i)

                                       );



    wire    signed      [OUT_W-1:0]     fft_out_0_r; 
    wire    signed      [OUT_W-1:0]     fft_out_1_r; 
    wire    signed      [OUT_W-1:0]     fft_out_2_r; 
    wire    signed      [OUT_W-1:0]     fft_out_3_r; 
    wire    signed      [OUT_W-1:0]     fft_out_4_r; 
    wire    signed      [OUT_W-1:0]     fft_out_5_r; 
    wire    signed      [OUT_W-1:0]     fft_out_6_r; 
    wire    signed      [OUT_W-1:0]     fft_out_7_r; 
    wire    signed      [OUT_W-1:0]     fft_out_8_r; 
    wire    signed      [OUT_W-1:0]     fft_out_9_r; 
    wire    signed      [OUT_W-1:0]     fft_out_10_r; 
    wire    signed      [OUT_W-1:0]     fft_out_11_r; 
    wire    signed      [OUT_W-1:0]     fft_out_12_r; 
    wire    signed      [OUT_W-1:0]     fft_out_13_r; 
    wire    signed      [OUT_W-1:0]     fft_out_14_r; 
    wire    signed      [OUT_W-1:0]     fft_out_15_r; 
    wire    signed      [OUT_W-1:0]     fft_out_16_r; 
    wire    signed      [OUT_W-1:0]     fft_out_17_r; 
    wire    signed      [OUT_W-1:0]     fft_out_18_r; 
    wire    signed      [OUT_W-1:0]     fft_out_19_r; 
    wire    signed      [OUT_W-1:0]     fft_out_20_r; 
    wire    signed      [OUT_W-1:0]     fft_out_21_r; 
    wire    signed      [OUT_W-1:0]     fft_out_22_r; 
    wire    signed      [OUT_W-1:0]     fft_out_23_r; 
    wire    signed      [OUT_W-1:0]     fft_out_24_r; 
    wire    signed      [OUT_W-1:0]     fft_out_25_r; 
    wire    signed      [OUT_W-1:0]     fft_out_26_r; 
    wire    signed      [OUT_W-1:0]     fft_out_27_r; 
    wire    signed      [OUT_W-1:0]     fft_out_28_r; 
    wire    signed      [OUT_W-1:0]     fft_out_29_r; 
    wire    signed      [OUT_W-1:0]     fft_out_30_r; 
    wire    signed      [OUT_W-1:0]     fft_out_31_r; 

    wire    signed      [OUT_W-1:0]     fft_out_0_i; 
    wire    signed      [OUT_W-1:0]     fft_out_1_i; 
    wire    signed      [OUT_W-1:0]     fft_out_2_i; 
    wire    signed      [OUT_W-1:0]     fft_out_3_i; 
    wire    signed      [OUT_W-1:0]     fft_out_4_i; 
    wire    signed      [OUT_W-1:0]     fft_out_5_i; 
    wire    signed      [OUT_W-1:0]     fft_out_6_i; 
    wire    signed      [OUT_W-1:0]     fft_out_7_i; 
    wire    signed      [OUT_W-1:0]     fft_out_8_i; 
    wire    signed      [OUT_W-1:0]     fft_out_9_i; 
    wire    signed      [OUT_W-1:0]     fft_out_10_i; 
    wire    signed      [OUT_W-1:0]     fft_out_11_i; 
    wire    signed      [OUT_W-1:0]     fft_out_12_i; 
    wire    signed      [OUT_W-1:0]     fft_out_13_i; 
    wire    signed      [OUT_W-1:0]     fft_out_14_i; 
    wire    signed      [OUT_W-1:0]     fft_out_15_i; 
    wire    signed      [OUT_W-1:0]     fft_out_16_i; 
    wire    signed      [OUT_W-1:0]     fft_out_17_i; 
    wire    signed      [OUT_W-1:0]     fft_out_18_i; 
    wire    signed      [OUT_W-1:0]     fft_out_19_i; 
    wire    signed      [OUT_W-1:0]     fft_out_20_i; 
    wire    signed      [OUT_W-1:0]     fft_out_21_i; 
    wire    signed      [OUT_W-1:0]     fft_out_22_i; 
    wire    signed      [OUT_W-1:0]     fft_out_23_i; 
    wire    signed      [OUT_W-1:0]     fft_out_24_i; 
    wire    signed      [OUT_W-1:0]     fft_out_25_i; 
    wire    signed      [OUT_W-1:0]     fft_out_26_i; 
    wire    signed      [OUT_W-1:0]     fft_out_27_i; 
    wire    signed      [OUT_W-1:0]     fft_out_28_i; 
    wire    signed      [OUT_W-1:0]     fft_out_29_i; 
    wire    signed      [OUT_W-1:0]     fft_out_30_i; 
    wire    signed      [OUT_W-1:0]     fft_out_31_i; 

pipe    #(W_2)    i_pipe_3             
                                    (       .clk(clk),
                                            .arstb(arstb),
                                            .rstb(rstb),
                                            
                                            .d_r_0 (fa0_r),
                                            .d_r_1 (fa1_r),
                                            .d_r_2 (fb0_r),
                                            .d_r_3 (fb1_r),
                                            .d_r_4 (fc0_r),
                                            .d_r_5 (fc1_r),
                                            .d_r_6 (fd0_r),
                                            .d_r_7 (fd1_r),
                                            .d_r_8 (fe0_r),
                                            .d_r_9 (fe1_r),
                                            .d_r_10(ff0_r),
                                            .d_r_11(ff1_r),
                                            .d_r_12(fg0_r),
                                            .d_r_13(fg1_r),
                                            .d_r_14(fh0_r),
                                            .d_r_15(fh1_r),
                                            .d_r_16(fi0_r),
                                            .d_r_17(fi1_r),
                                            .d_r_18(fj0_r),
                                            .d_r_19(fj1_r),
                                            .d_r_20(fk0_r),
                                            .d_r_21(fk1_r),
                                            .d_r_22(fl0_r),
                                            .d_r_23(fl1_r),
                                            .d_r_24(fm0_r),
                                            .d_r_25(fm1_r),
                                            .d_r_26(fn0_r),
                                            .d_r_27(fn1_r),
                                            .d_r_28(fo0_r),
                                            .d_r_29(fo1_r),
                                            .d_r_30(fp0_r),
                                            .d_r_31(fp1_r),

                                            .d_i_0 (fa0_i),
                                            .d_i_1 (fa1_i),
                                            .d_i_2 (fb0_i),
                                            .d_i_3 (fb1_i),
                                            .d_i_4 (fc0_i),
                                            .d_i_5 (fc1_i),
                                            .d_i_6 (fd0_i),
                                            .d_i_7 (fd1_i),
                                            .d_i_8 (fe0_i),
                                            .d_i_9 (fe1_i),
                                            .d_i_10(ff0_i),
                                            .d_i_11(ff1_i),
                                            .d_i_12(fg0_i),
                                            .d_i_13(fg1_i),
                                            .d_i_14(fh0_i),
                                            .d_i_15(fh1_i),
                                            .d_i_16(fi0_i),
                                            .d_i_17(fi1_i),
                                            .d_i_18(fj0_i),
                                            .d_i_19(fj1_i),
                                            .d_i_20(fk0_i),
                                            .d_i_21(fk1_i),
                                            .d_i_22(fl0_i),
                                            .d_i_23(fl1_i),
                                            .d_i_24(fm0_i),
                                            .d_i_25(fm1_i),
                                            .d_i_26(fn0_i),
                                            .d_i_27(fn1_i),
                                            .d_i_28(fo0_i),
                                            .d_i_29(fo1_i),
                                            .d_i_30(fp0_i),
                                            .d_i_31(fp1_i),
                                        
                                            .q_r_0 (fa0_r_d),
                                            .q_r_1 (fa1_r_d),
                                            .q_r_2 (fb0_r_d),
                                            .q_r_3 (fb1_r_d),
                                            .q_r_4 (fc0_r_d),
                                            .q_r_5 (fc1_r_d),
                                            .q_r_6 (fd0_r_d),
                                            .q_r_7 (fd1_r_d),
                                            .q_r_8 (fe0_r_d),
                                            .q_r_9 (fe1_r_d),
                                            .q_r_10(ff0_r_d),
                                            .q_r_11(ff1_r_d),
                                            .q_r_12(fg0_r_d),
                                            .q_r_13(fg1_r_d),
                                            .q_r_14(fh0_r_d),
                                            .q_r_15(fh1_r_d),
                                            .q_r_16(fi0_r_d),
                                            .q_r_17(fi1_r_d),
                                            .q_r_18(fj0_r_d),
                                            .q_r_19(fj1_r_d),
                                            .q_r_20(fk0_r_d),
                                            .q_r_21(fk1_r_d),
                                            .q_r_22(fl0_r_d),
                                            .q_r_23(fl1_r_d),
                                            .q_r_24(fm0_r_d),
                                            .q_r_25(fm1_r_d),
                                            .q_r_26(fn0_r_d),
                                            .q_r_27(fn1_r_d),
                                            .q_r_28(fo0_r_d),
                                            .q_r_29(fo1_r_d),
                                            .q_r_30(fp0_r_d),
                                            .q_r_31(fp1_r_d),
                                                         
                                            .q_i_0 (fa0_i_d),
                                            .q_i_1 (fa1_i_d),
                                            .q_i_2 (fb0_i_d),
                                            .q_i_3 (fb1_i_d),
                                            .q_i_4 (fc0_i_d),
                                            .q_i_5 (fc1_i_d),
                                            .q_i_6 (fd0_i_d),
                                            .q_i_7 (fd1_i_d),
                                            .q_i_8 (fe0_i_d),
                                            .q_i_9 (fe1_i_d),
                                            .q_i_10(ff0_i_d),
                                            .q_i_11(ff1_i_d),
                                            .q_i_12(fg0_i_d),
                                            .q_i_13(fg1_i_d),
                                            .q_i_14(fh0_i_d),
                                            .q_i_15(fh1_i_d),
                                            .q_i_16(fi0_i_d),
                                            .q_i_17(fi1_i_d),
                                            .q_i_18(fj0_i_d),
                                            .q_i_19(fj1_i_d),
                                            .q_i_20(fk0_i_d),
                                            .q_i_21(fk1_i_d),
                                            .q_i_22(fl0_i_d),
                                            .q_i_23(fl1_i_d),
                                            .q_i_24(fm0_i_d),
                                            .q_i_25(fm1_i_d),
                                            .q_i_26(fn0_i_d),
                                            .q_i_27(fn1_i_d),
                                            .q_i_28(fo0_i_d),
                                            .q_i_29(fo1_i_d),
                                            .q_i_30(fp0_i_d),
                                            .q_i_31(fp1_i_d)
                                            
                                             );





dft_2to1    #(W_2, OUT_W, TW_W)    i_dft_2to1          
                                (
                                     .w8_r(w8_r) ,
                                     .w0_r(w0_r) ,
                                     .w8_i(w8_i) ,
                                     .w0_i(w0_i) ,
                                    
                                    
                                    .fa0_r(fa0_r_d),  .fa0_i(fa0_i_d),
                                    .fa1_r(fa1_r_d),  .fa1_i(fa1_i_d),   
                                                             
                                    .fb0_r(fb0_r_d),  .fb0_i(fb0_i_d),
                                    .fb1_r(fb1_r_d),  .fb1_i(fb1_i_d),
                                                             
                                    .fc0_r(fc0_r_d),  .fc0_i(fc0_i_d),
                                    .fc1_r(fc1_r_d),  .fc1_i(fc1_i_d),
                                                             
                                    .fd0_r(fd0_r_d),  .fd0_i(fd0_i_d),
                                    .fd1_r(fd1_r_d),  .fd1_i(fd1_i_d),
                                                             
                                    .fe0_r(fe0_r_d),  .fe0_i(fe0_i_d),
                                    .fe1_r(fe1_r_d),  .fe1_i(fe1_i_d),
                                                             
                                    .ff0_r(ff0_r_d),  .ff0_i(ff0_i_d),
                                    .ff1_r(ff1_r_d),  .ff1_i(ff1_i_d),
                                                             
                                    .fg0_r(fg0_r_d),  .fg0_i(fg0_i_d),
                                    .fg1_r(fg1_r_d),  .fg1_i(fg1_i_d),
                                                             
                                    .fh0_r(fh0_r_d),  .fh0_i(fh0_i_d),
                                    .fh1_r(fh1_r_d),  .fh1_i(fh1_i_d),
                                                             
                                    .fi0_r(fi0_r_d),  .fi0_i(fi0_i_d),
                                    .fi1_r(fi1_r_d),  .fi1_i(fi1_i_d),
                                                             
                                    .fj0_r(fj0_r_d),  .fj0_i(fj0_i_d),
                                    .fj1_r(fj1_r_d),  .fj1_i(fj1_i_d),
                                                             
                                    .fk0_r(fk0_r_d),  .fk0_i(fk0_i_d),
                                    .fk1_r(fk1_r_d),  .fk1_i(fk1_i_d),
                                                             
                                    .fl0_r(fl0_r_d),  .fl0_i(fl0_i_d),
                                    .fl1_r(fl1_r_d),  .fl1_i(fl1_i_d),
                                                             
                                    .fm0_r(fm0_r_d),  .fm0_i(fm0_i_d),
                                    .fm1_r(fm1_r_d),  .fm1_i(fm1_i_d),
                                                             
                                    .fn0_r(fn0_r_d),  .fn0_i(fn0_i_d),
                                    .fn1_r(fn1_r_d),  .fn1_i(fn1_i_d),
                                                             
                                    .fo0_r(fo0_r_d),  .fo0_i(fo0_i_d),
                                    .fo1_r(fo1_r_d),  .fo1_i(fo1_i_d),
                                                             
                                    .fp0_r(fp0_r_d),  .fp0_i(fp0_i_d),
                                    .fp1_r(fp1_r_d),  .fp1_i(fp1_i_d),
                                    
                                    .fft_out_0_r(fft_out_0_r),  
                                    .fft_out_1_r(fft_out_1_r),  
                                    .fft_out_2_r(fft_out_2_r),  
                                    .fft_out_3_r(fft_out_3_r),  
                                    .fft_out_4_r(fft_out_4_r),  
                                    .fft_out_5_r(fft_out_5_r),  
                                    .fft_out_6_r(fft_out_6_r),  
                                    .fft_out_7_r(fft_out_7_r),  
                                    .fft_out_8_r(fft_out_8_r),  
                                    .fft_out_9_r(fft_out_9_r),  
                                    .fft_out_10_r(fft_out_10_r),  
                                    .fft_out_11_r(fft_out_11_r),  
                                    .fft_out_12_r(fft_out_12_r),  
                                    .fft_out_13_r(fft_out_13_r),  
                                    .fft_out_14_r(fft_out_14_r),  
                                    .fft_out_15_r(fft_out_15_r),  
                                    .fft_out_16_r(fft_out_16_r),  
                                    .fft_out_17_r(fft_out_17_r),  
                                    .fft_out_18_r(fft_out_18_r),  
                                    .fft_out_19_r(fft_out_19_r),  
                                    .fft_out_20_r(fft_out_20_r),  
                                    .fft_out_21_r(fft_out_21_r),  
                                    .fft_out_22_r(fft_out_22_r),  
                                    .fft_out_23_r(fft_out_23_r),  
                                    .fft_out_24_r(fft_out_24_r),  
                                    .fft_out_25_r(fft_out_25_r),  
                                    .fft_out_26_r(fft_out_26_r),  
                                    .fft_out_27_r(fft_out_27_r),  
                                    .fft_out_28_r(fft_out_28_r),  
                                    .fft_out_29_r(fft_out_29_r),  
                                    .fft_out_30_r(fft_out_30_r),  
                                    .fft_out_31_r(fft_out_31_r),  
                                                   
                                    .fft_out_0_i(fft_out_0_i),  
                                    .fft_out_1_i(fft_out_1_i),  
                                    .fft_out_2_i(fft_out_2_i),  
                                    .fft_out_3_i(fft_out_3_i),  
                                    .fft_out_4_i(fft_out_4_i),  
                                    .fft_out_5_i(fft_out_5_i),  
                                    .fft_out_6_i(fft_out_6_i),  
                                    .fft_out_7_i(fft_out_7_i),  
                                    .fft_out_8_i(fft_out_8_i),  
                                    .fft_out_9_i(fft_out_9_i),  
                                    .fft_out_10_i(fft_out_10_i),  
                                    .fft_out_11_i(fft_out_11_i),  
                                    .fft_out_12_i(fft_out_12_i),  
                                    .fft_out_13_i(fft_out_13_i),  
                                    .fft_out_14_i(fft_out_14_i),  
                                    .fft_out_15_i(fft_out_15_i),  
                                    .fft_out_16_i(fft_out_16_i),  
                                    .fft_out_17_i(fft_out_17_i),  
                                    .fft_out_18_i(fft_out_18_i),  
                                    .fft_out_19_i(fft_out_19_i),  
                                    .fft_out_20_i(fft_out_20_i),  
                                    .fft_out_21_i(fft_out_21_i),  
                                    .fft_out_22_i(fft_out_22_i),  
                                    .fft_out_23_i(fft_out_23_i),  
                                    .fft_out_24_i(fft_out_24_i),  
                                    .fft_out_25_i(fft_out_25_i),  
                                    .fft_out_26_i(fft_out_26_i),  
                                    .fft_out_27_i(fft_out_27_i),  
                                    .fft_out_28_i(fft_out_28_i),  
                                    .fft_out_29_i(fft_out_29_i),  
                                    .fft_out_30_i(fft_out_30_i),  
                                    .fft_out_31_i(fft_out_31_i)  
                                
                                );

pipe    #(OUT_W)    i_pipe_4              
                                    (       .clk(clk),
                                            .arstb(arstb),
                                            .rstb(rstb),
                                            
                                            .d_r_0(fft_out_0_r),
                                            .d_r_1(fft_out_1_r),
                                            .d_r_2(fft_out_2_r),
                                            .d_r_3(fft_out_3_r),
                                            .d_r_4(fft_out_4_r),
                                            .d_r_5(fft_out_5_r),
                                            .d_r_6(fft_out_6_r),
                                            .d_r_7(fft_out_7_r),
                                            .d_r_8(fft_out_8_r),
                                            .d_r_9(fft_out_9_r),
                                            .d_r_10(fft_out_10_r),
                                            .d_r_11(fft_out_11_r),
                                            .d_r_12(fft_out_12_r),
                                            .d_r_13(fft_out_13_r),
                                            .d_r_14(fft_out_14_r),
                                            .d_r_15(fft_out_15_r),
                                            .d_r_16(fft_out_16_r),
                                            .d_r_17(fft_out_17_r),
                                            .d_r_18(fft_out_18_r),
                                            .d_r_19(fft_out_19_r),
                                            .d_r_20(fft_out_20_r),
                                            .d_r_21(fft_out_21_r),
                                            .d_r_22(fft_out_22_r),
                                            .d_r_23(fft_out_23_r),
                                            .d_r_24(fft_out_24_r),
                                            .d_r_25(fft_out_25_r),
                                            .d_r_26(fft_out_26_r),
                                            .d_r_27(fft_out_27_r),
                                            .d_r_28(fft_out_28_r),
                                            .d_r_29(fft_out_29_r),
                                            .d_r_30(fft_out_30_r),
                                            .d_r_31(fft_out_31_r),

                                            .d_i_0(fft_out_0_i),
                                            .d_i_1(fft_out_1_i),
                                            .d_i_2(fft_out_2_i),
                                            .d_i_3(fft_out_3_i),
                                            .d_i_4(fft_out_4_i),
                                            .d_i_5(fft_out_5_i),
                                            .d_i_6(fft_out_6_i),
                                            .d_i_7(fft_out_7_i),
                                            .d_i_8(fft_out_8_i),
                                            .d_i_9(fft_out_9_i),
                                            .d_i_10(fft_out_10_i),
                                            .d_i_11(fft_out_11_i),
                                            .d_i_12(fft_out_12_i),
                                            .d_i_13(fft_out_13_i),
                                            .d_i_14(fft_out_14_i),
                                            .d_i_15(fft_out_15_i),
                                            .d_i_16(fft_out_16_i),
                                            .d_i_17(fft_out_17_i),
                                            .d_i_18(fft_out_18_i),
                                            .d_i_19(fft_out_19_i),
                                            .d_i_20(fft_out_20_i),
                                            .d_i_21(fft_out_21_i),
                                            .d_i_22(fft_out_22_i),
                                            .d_i_23(fft_out_23_i),
                                            .d_i_24(fft_out_24_i),
                                            .d_i_25(fft_out_25_i),
                                            .d_i_26(fft_out_26_i),
                                            .d_i_27(fft_out_27_i),
                                            .d_i_28(fft_out_28_i),
                                            .d_i_29(fft_out_29_i),
                                            .d_i_30(fft_out_30_i),
                                            .d_i_31(fft_out_31_i),
                                        
                                            .q_r_0(fft_out_r_0),
                                            .q_r_1(fft_out_r_1),
                                            .q_r_2(fft_out_r_2),
                                            .q_r_3(fft_out_r_3),
                                            .q_r_4(fft_out_r_4),
                                            .q_r_5(fft_out_r_5),
                                            .q_r_6(fft_out_r_6),
                                            .q_r_7(fft_out_r_7),
                                            .q_r_8(fft_out_r_8),
                                            .q_r_9(fft_out_r_9),
                                            .q_r_10(fft_out_r_10),
                                            .q_r_11(fft_out_r_11),
                                            .q_r_12(fft_out_r_12),
                                            .q_r_13(fft_out_r_13),
                                            .q_r_14(fft_out_r_14),
                                            .q_r_15(fft_out_r_15),
                                            .q_r_16(fft_out_r_16),
                                            .q_r_17(fft_out_r_17),
                                            .q_r_18(fft_out_r_18),
                                            .q_r_19(fft_out_r_19),
                                            .q_r_20(fft_out_r_20),
                                            .q_r_21(fft_out_r_21),
                                            .q_r_22(fft_out_r_22),
                                            .q_r_23(fft_out_r_23),
                                            .q_r_24(fft_out_r_24),
                                            .q_r_25(fft_out_r_25),
                                            .q_r_26(fft_out_r_26),
                                            .q_r_27(fft_out_r_27),
                                            .q_r_28(fft_out_r_28),
                                            .q_r_29(fft_out_r_29),
                                            .q_r_30(fft_out_r_30),
                                            .q_r_31(fft_out_r_31),

                                            .q_i_0(fft_out_i_0),
                                            .q_i_1(fft_out_i_1),
                                            .q_i_2(fft_out_i_2),
                                            .q_i_3(fft_out_i_3),
                                            .q_i_4(fft_out_i_4),
                                            .q_i_5(fft_out_i_5),
                                            .q_i_6(fft_out_i_6),
                                            .q_i_7(fft_out_i_7),
                                            .q_i_8(fft_out_i_8),
                                            .q_i_9(fft_out_i_9),
                                            .q_i_10(fft_out_i_10),
                                            .q_i_11(fft_out_i_11),
                                            .q_i_12(fft_out_i_12),
                                            .q_i_13(fft_out_i_13),
                                            .q_i_14(fft_out_i_14),
                                            .q_i_15(fft_out_i_15),
                                            .q_i_16(fft_out_i_16),
                                            .q_i_17(fft_out_i_17),
                                            .q_i_18(fft_out_i_18),
                                            .q_i_19(fft_out_i_19),
                                            .q_i_20(fft_out_i_20),
                                            .q_i_21(fft_out_i_21),
                                            .q_i_22(fft_out_i_22),
                                            .q_i_23(fft_out_i_23),
                                            .q_i_24(fft_out_i_24),
                                            .q_i_25(fft_out_i_25),
                                            .q_i_26(fft_out_i_26),
                                            .q_i_27(fft_out_i_27),
                                            .q_i_28(fft_out_i_28),
                                            .q_i_29(fft_out_i_29),
                                            .q_i_30(fft_out_i_30),
                                            .q_i_31(fft_out_i_31)
                                            );



endmodule
