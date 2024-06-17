

`timescale 1ns/1fs

module up_pwl(
    
    input                           clk, 
    input                           arstb, 
    input                           rstb, 

    input               [5:0]        x0 ,        
    input               [5:0]        x1 ,        
    input               [5:0]        x2 ,        
    input               [5:0]        x3 ,        
    input               [5:0]        x4 ,        
    input               [5:0]        x5 ,        
    input               [5:0]        x6 ,        
    input               [5:0]        x7 ,        
    
    output  signed      [7:0]        x0_in ,        
    output  signed      [7:0]        x1_in ,        
    output  signed      [7:0]        x2_in ,        
    output  signed      [7:0]        x3_in ,        
    output  signed      [7:0]        x4_in ,        
    output  signed      [7:0]        x5_in ,        
    output  signed      [7:0]        x6_in ,        
    output  signed      [7:0]        x7_in         
                );
    
    
    up_pwl_unit    i_pwl_0  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x_in(x0),  .x_out(x0_in) ) ;
    up_pwl_unit    i_pwl_1  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x_in(x1),  .x_out(x1_in) ) ;
    up_pwl_unit    i_pwl_2  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x_in(x2),  .x_out(x2_in) ) ;
    up_pwl_unit    i_pwl_3  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x_in(x3),  .x_out(x3_in) ) ;
    up_pwl_unit    i_pwl_4  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x_in(x4),  .x_out(x4_in) ) ;
    up_pwl_unit    i_pwl_5  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x_in(x5),  .x_out(x5_in) ) ;
    up_pwl_unit    i_pwl_6  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x_in(x6),  .x_out(x6_in) ) ;
    up_pwl_unit    i_pwl_7  ( .clk(clk), .arstb(arstb), .rstb(rstb),  .x_in(x7),  .x_out(x7_in) ) ;






endmodule
