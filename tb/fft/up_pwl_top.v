

`timescale 1ns/1fs

module up_pwl_top(
    
    input                           clk, 
    input                           arstb, 
    input                           rstb, 

    input               [5:0]        x0_0 ,        
    input               [5:0]        x0_1 ,        
    input               [5:0]        x0_2 ,        
    input               [5:0]        x0_3 ,        
    input               [5:0]        x0_4 ,        
    input               [5:0]        x0_5 ,        
    input               [5:0]        x0_6 ,        
    input               [5:0]        x0_7 ,        
    
    input               [5:0]        x1_0 ,        
    input               [5:0]        x1_1 ,        
    input               [5:0]        x1_2 ,        
    input               [5:0]        x1_3 ,        
    input               [5:0]        x1_4 ,        
    input               [5:0]        x1_5 ,        
    input               [5:0]        x1_6 ,        
    input               [5:0]        x1_7 ,        
    
    input               [5:0]        x2_0 ,        
    input               [5:0]        x2_1 ,        
    input               [5:0]        x2_2 ,        
    input               [5:0]        x2_3 ,        
    input               [5:0]        x2_4 ,        
    input               [5:0]        x2_5 ,        
    input               [5:0]        x2_6 ,        
    input               [5:0]        x2_7 ,        
    
    input               [5:0]        x3_0 ,        
    input               [5:0]        x3_1 ,        
    input               [5:0]        x3_2 ,        
    input               [5:0]        x3_3 ,        
    input               [5:0]        x3_4 ,        
    input               [5:0]        x3_5 ,        
    input               [5:0]        x3_6 ,        
    input               [5:0]        x3_7 ,        
    
    
    output  reg    signed  [7:0]         x0_in_0_out,        
    output  reg    signed  [7:0]         x0_in_1_out,        
    output  reg    signed  [7:0]         x0_in_2_out,        
    output  reg    signed  [7:0]         x0_in_3_out,        
    output  reg    signed  [7:0]         x0_in_4_out,        
    output  reg    signed  [7:0]         x0_in_5_out,        
    output  reg    signed  [7:0]         x0_in_6_out,        
    output  reg    signed  [7:0]         x0_in_7_out,        
    
    output  reg    signed  [7:0]         x1_in_0_out,        
    output  reg    signed  [7:0]         x1_in_1_out,        
    output  reg    signed  [7:0]         x1_in_2_out,        
    output  reg    signed  [7:0]         x1_in_3_out,        
    output  reg    signed  [7:0]         x1_in_4_out,        
    output  reg    signed  [7:0]         x1_in_5_out,        
    output  reg    signed  [7:0]         x1_in_6_out,        
    output  reg    signed  [7:0]         x1_in_7_out,        
    
    output  reg    signed  [7:0]         x2_in_0_out,        
    output  reg    signed  [7:0]         x2_in_1_out,        
    output  reg    signed  [7:0]         x2_in_2_out,        
    output  reg    signed  [7:0]         x2_in_3_out,        
    output  reg    signed  [7:0]         x2_in_4_out,        
    output  reg    signed  [7:0]         x2_in_5_out,        
    output  reg    signed  [7:0]         x2_in_6_out,        
    output  reg    signed  [7:0]         x2_in_7_out,        
    
    output  reg    signed  [7:0]         x3_in_0_out,        
    output  reg    signed  [7:0]         x3_in_1_out,        
    output  reg    signed  [7:0]         x3_in_2_out,        
    output  reg    signed  [7:0]         x3_in_3_out,        
    output  reg    signed  [7:0]         x3_in_4_out,        
    output  reg    signed  [7:0]         x3_in_5_out,        
    output  reg    signed  [7:0]         x3_in_6_out,        
    output  reg    signed  [7:0]         x3_in_7_out        
    
   
);
 
    wire    signed           [7:0]        x0_in_0;        
    wire    signed           [7:0]        x0_in_1;        
    wire    signed           [7:0]        x0_in_2;        
    wire    signed           [7:0]        x0_in_3;        
    wire    signed           [7:0]        x0_in_4;        
    wire    signed           [7:0]        x0_in_5;        
    wire    signed           [7:0]        x0_in_6;        
    wire    signed           [7:0]        x0_in_7;        
    
    wire    signed           [7:0]        x1_in_0;        
    wire    signed           [7:0]        x1_in_1;        
    wire    signed           [7:0]        x1_in_2;        
    wire    signed           [7:0]        x1_in_3;        
    wire    signed           [7:0]        x1_in_4;        
    wire    signed           [7:0]        x1_in_5;        
    wire    signed           [7:0]        x1_in_6;        
    wire    signed           [7:0]        x1_in_7;        
    
    wire    signed           [7:0]        x2_in_0;        
    wire    signed           [7:0]        x2_in_1;        
    wire    signed           [7:0]        x2_in_2;        
    wire    signed           [7:0]        x2_in_3;        
    wire    signed           [7:0]        x2_in_4;        
    wire    signed           [7:0]        x2_in_5;        
    wire    signed           [7:0]        x2_in_6;        
    wire    signed           [7:0]        x2_in_7;        
    
    wire    signed           [7:0]        x3_in_0;        
    wire    signed           [7:0]        x3_in_1;        
    wire    signed           [7:0]        x3_in_2;        
    wire    signed           [7:0]        x3_in_3;        
    wire    signed           [7:0]        x3_in_4;        
    wire    signed           [7:0]        x3_in_5;        
    wire    signed           [7:0]        x3_in_6;        
    wire    signed           [7:0]        x3_in_7;        

    
    
    always @(posedge clk or negedge arstb) begin
        if(!arstb) begin
               x0_in_0_out <= 8'b0;        
               x0_in_1_out <= 8'b0;        
               x0_in_2_out <= 8'b0;        
               x0_in_3_out <= 8'b0;        
               x0_in_4_out <= 8'b0;        
               x0_in_5_out <= 8'b0;        
               x0_in_6_out <= 8'b0;        
               x0_in_7_out <= 8'b0;        
    
               x1_in_0_out <= 8'b0;        
               x1_in_1_out <= 8'b0;        
               x1_in_2_out <= 8'b0;        
               x1_in_3_out <= 8'b0;        
               x1_in_4_out <= 8'b0;        
               x1_in_5_out <= 8'b0;        
               x1_in_6_out <= 8'b0;        
               x1_in_7_out <= 8'b0;        
    
               x2_in_0_out <= 8'b0;        
               x2_in_1_out <= 8'b0;        
               x2_in_2_out <= 8'b0;        
               x2_in_3_out <= 8'b0;        
               x2_in_4_out <= 8'b0;        
               x2_in_5_out <= 8'b0;        
               x2_in_6_out <= 8'b0;        
               x2_in_7_out <= 8'b0;        
    
               x3_in_0_out <= 8'b0;        
               x3_in_1_out <= 8'b0;        
               x3_in_2_out <= 8'b0;        
               x3_in_3_out <= 8'b0;        
               x3_in_4_out <= 8'b0;        
               x3_in_5_out <= 8'b0;        
               x3_in_6_out <= 8'b0;        
               x3_in_7_out <= 8'b0;        
    
        end
        else if (!rstb) begin
               x0_in_0_out <= 8'b0;        
               x0_in_1_out <= 8'b0;        
               x0_in_2_out <= 8'b0;        
               x0_in_3_out <= 8'b0;        
               x0_in_4_out <= 8'b0;        
               x0_in_5_out <= 8'b0;        
               x0_in_6_out <= 8'b0;        
               x0_in_7_out <= 8'b0;        
    
               x1_in_0_out <= 8'b0;        
               x1_in_1_out <= 8'b0;        
               x1_in_2_out <= 8'b0;        
               x1_in_3_out <= 8'b0;        
               x1_in_4_out <= 8'b0;        
               x1_in_5_out <= 8'b0;        
               x1_in_6_out <= 8'b0;        
               x1_in_7_out <= 8'b0;        
    
               x2_in_0_out <= 8'b0;        
               x2_in_1_out <= 8'b0;        
               x2_in_2_out <= 8'b0;        
               x2_in_3_out <= 8'b0;        
               x2_in_4_out <= 8'b0;        
               x2_in_5_out <= 8'b0;        
               x2_in_6_out <= 8'b0;        
               x2_in_7_out <= 8'b0;        
    
               x3_in_0_out <= 8'b0;        
               x3_in_1_out <= 8'b0;        
               x3_in_2_out <= 8'b0;        
               x3_in_3_out <= 8'b0;        
               x3_in_4_out <= 8'b0;        
               x3_in_5_out <= 8'b0;        
               x3_in_6_out <= 8'b0;        
               x3_in_7_out <= 8'b0;        
        end
        else begin
               x0_in_0_out <=   x0_in_0;     
               x0_in_1_out <=   x0_in_1;     
               x0_in_2_out <=   x0_in_2;     
               x0_in_3_out <=   x0_in_3;     
               x0_in_4_out <=   x0_in_4;     
               x0_in_5_out <=   x0_in_5;     
               x0_in_6_out <=   x0_in_6;     
               x0_in_7_out <=   x0_in_7;     
                                      
               x1_in_0_out <=   x1_in_0;     
               x1_in_1_out <=   x1_in_1;     
               x1_in_2_out <=   x1_in_2;     
               x1_in_3_out <=   x1_in_3;     
               x1_in_4_out <=   x1_in_4;     
               x1_in_5_out <=   x1_in_5;     
               x1_in_6_out <=   x1_in_6;     
               x1_in_7_out <=   x1_in_7;     
                                       
               x2_in_0_out <=   x2_in_0;     
               x2_in_1_out <=   x2_in_1;     
               x2_in_2_out <=   x2_in_2;     
               x2_in_3_out <=   x2_in_3;     
               x2_in_4_out <=   x2_in_4;     
               x2_in_5_out <=   x2_in_5;     
               x2_in_6_out <=   x2_in_6;     
               x2_in_7_out <=   x2_in_7;     
                                       
               x3_in_0_out <=   x3_in_0;     
               x3_in_1_out <=   x3_in_1;     
               x3_in_2_out <=   x3_in_2;     
               x3_in_3_out <=   x3_in_3;     
               x3_in_4_out <=   x3_in_4;     
               x3_in_5_out <=   x3_in_5;     
               x3_in_6_out <=   x3_in_6;     
               x3_in_7_out <=   x3_in_7;     
        end
    end
    





    up_pwl    i_pwl_0  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x0(x0_0),   .x1(x0_1),  .x2(x0_2),  .x3(x0_3),  .x4(x0_4),  .x5(x0_5),  .x6(x0_6),  .x7(x0_7),  .x0_in(x0_in_0), .x1_in(x0_in_1), .x2_in(x0_in_2), .x3_in(x0_in_3), .x4_in(x0_in_4), .x5_in(x0_in_5), .x6_in(x0_in_6), .x7_in(x0_in_7)) ;
    up_pwl    i_pwl_1  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x0(x1_0),   .x1(x1_1),  .x2(x1_2),  .x3(x1_3),  .x4(x1_4),  .x5(x1_5),  .x6(x1_6),  .x7(x1_7),  .x0_in(x1_in_0), .x1_in(x1_in_1), .x2_in(x1_in_2), .x3_in(x1_in_3), .x4_in(x1_in_4), .x5_in(x1_in_5), .x6_in(x1_in_6), .x7_in(x1_in_7)) ;
    up_pwl    i_pwl_2  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x0(x2_0),   .x1(x2_1),  .x2(x2_2),  .x3(x2_3),  .x4(x2_4),  .x5(x2_5),  .x6(x2_6),  .x7(x2_7),  .x0_in(x2_in_0), .x1_in(x2_in_1), .x2_in(x2_in_2), .x3_in(x2_in_3), .x4_in(x2_in_4), .x5_in(x2_in_5), .x6_in(x2_in_6), .x7_in(x2_in_7)) ;
    up_pwl    i_pwl_3  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x0(x3_0),   .x1(x3_1),  .x2(x3_2),  .x3(x3_3),  .x4(x3_4),  .x5(x3_5),  .x6(x3_6),  .x7(x3_7),  .x0_in(x3_in_0), .x1_in(x3_in_1), .x2_in(x3_in_2), .x3_in(x3_in_3), .x4_in(x3_in_4), .x5_in(x3_in_5), .x6_in(x3_in_6), .x7_in(x3_in_7)) ;






endmodule
