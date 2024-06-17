//////////////////////////////////////////
//	Dflipflop				//
//	Author : KHLEE93			//
//	Update : 2020.12.27		//
//////////////////////////////////////////

`timescale 1ns/1fs
module lvds_retime(
	input	  wire	clk,	
    input     wire  arstb,	
    input     wire  rstb,	
    input     wire  rst_retime,

    input	  wire  la0_p,	
    input	  wire  la1_p,	
    input	  wire  la2_p,	
    input	  wire  la3_p,	
    input	  wire  la4_p,	
    input	  wire  la5_p,	
    input	  wire  la6_p,	
    input	  wire  la7_p,	
    input	  wire  la8_p,	
    input	  wire  la9_p,	
    input	  wire  la10_p,	
    input	  wire  la11_p,	
    input	  wire  la12_p,	
    input	  wire  la13_p,	
    input	  wire  la14_p,	
    input	  wire  la15_p,	
    input	  wire  la16_p,	
    input	  wire  la17_p,	
    input	  wire  la18_p,	
    input	  wire  la19_p,	
    
    output    wire   clk_fpga,
    output    reg       [5:0]        x0_0 ,        
    output    reg       [5:0]        x0_1 ,        
    output    reg       [5:0]        x0_2 ,        
    output    reg       [5:0]        x0_3 ,        
    output    reg       [5:0]        x0_4 ,        
    output    reg       [5:0]        x0_5 ,        
    output    reg       [5:0]        x0_6 ,        
    output    reg       [5:0]        x0_7 ,        
    
    output    reg       [5:0]        x1_0 ,        
    output    reg       [5:0]        x1_1 ,        
    output    reg       [5:0]        x1_2 ,        
    output    reg       [5:0]        x1_3 ,        
    output    reg       [5:0]        x1_4 ,        
    output    reg       [5:0]        x1_5 ,        
    output    reg       [5:0]        x1_6 ,        
    output    reg       [5:0]        x1_7 ,        
    
    output    reg       [5:0]        x2_0 ,        
    output    reg       [5:0]        x2_1 ,        
    output    reg       [5:0]        x2_2 ,        
    output    reg       [5:0]        x2_3 ,        
    output    reg       [5:0]        x2_4 ,        
    output    reg       [5:0]        x2_5 ,        
    output    reg       [5:0]        x2_6 ,        
    output    reg       [5:0]        x2_7 ,        
    
    output    reg       [5:0]        x3_0 ,        
    output    reg       [5:0]        x3_1 ,        
    output    reg       [5:0]        x3_2 ,        
    output    reg       [5:0]        x3_3 ,        
    output    reg       [5:0]        x3_4 ,        
    output    reg       [5:0]        x3_5 ,        
    output    reg       [5:0]        x3_6 ,        
    output    reg       [5:0]        x3_7         
	);


    reg la0 , la0_d , la0_dd , la0_ddd ;
    reg la1 , la1_d , la1_dd , la1_ddd ;
    reg la2 , la2_d , la2_dd , la2_ddd ;
    reg la3 , la3_d , la3_dd , la3_ddd ;
    reg la4 , la4_d , la4_dd , la4_ddd ;
    reg la5 , la5_d , la5_dd , la5_ddd ;
    reg la6 , la6_d , la6_dd , la6_ddd ;
    reg la7 , la7_d , la7_dd , la7_ddd ;
    reg la8 , la8_d , la8_dd , la8_ddd ;
    reg la9 , la9_d , la9_dd , la9_ddd ;
    reg la10, la10_d, la10_dd, la10_ddd;
    reg la11, la11_d, la11_dd, la11_ddd;
    reg la12, la12_d, la12_dd, la12_ddd;
    reg la13, la13_d, la13_dd, la13_ddd;
    reg la14, la14_d, la14_dd, la14_ddd;
    reg la15, la15_d, la15_dd, la15_ddd;
    reg la16, la16_d, la16_dd, la16_ddd;
    reg la17, la17_d, la17_dd, la17_ddd;
    reg la18, la18_d, la18_dd, la18_ddd;
    reg la19, la19_d, la19_dd, la19_ddd;
    reg la20, la20_d, la20_dd, la20_ddd;
    reg la21, la21_d, la21_dd, la21_ddd;
    reg la22, la22_d, la22_dd, la22_ddd;
    reg la23, la23_d, la23_dd, la23_ddd;
    reg la24, la24_d, la24_dd, la24_ddd;
    reg la25, la25_d, la25_dd, la25_ddd;
    reg la26, la26_d, la26_dd, la26_ddd;
    reg la27, la27_d, la27_dd, la27_ddd;
    reg la28, la28_d, la28_dd, la28_ddd;
    reg la29, la29_d, la29_dd, la29_ddd;
    reg la30, la30_d, la30_dd, la30_ddd;
    reg la31, la31_d, la31_dd, la31_ddd;
    reg la32, la32_d, la32_dd, la32_ddd;
    reg la33, la33_d, la33_dd, la33_ddd;
    reg la34, la34_d, la34_dd, la34_ddd;
    reg la35, la35_d, la35_dd, la35_ddd;
    reg la36, la36_d, la36_dd, la36_ddd;
    reg la37, la37_d, la37_dd, la37_ddd;
    reg la38, la38_d, la38_dd, la38_ddd;
    reg la39, la39_d, la39_dd, la39_ddd;
    
    reg [1:0] cnt;
    reg clk_div2; 
    reg clk_div4;

    always @(posedge clk or negedge arstb) begin
		if(!arstb) begin
            cnt     <=  2'b0;
        end
        else if (!rst_retime) begin
            cnt     <=  2'b0;
        end
        else if (cnt == 2'd3) begin
            cnt     <=  2'b0;
        end
        else begin 
            cnt     <= cnt + 2'b1;
        end
    end

    always @(posedge clk or negedge arstb) begin
        if(!arstb) begin
            clk_div2 <= 1'b0;
        end
        else if (!rst_retime) begin
            clk_div2 <= 1'b0;
        end
        else begin 
            clk_div2 <= ~clk_div2;
        end
    end
            
    always @(posedge clk_div2 or negedge arstb) begin
        if(!arstb) begin
            clk_div4 <= 1'b1;
        end
        else if (!rst_retime) begin
            clk_div4 <= 1'b1;
        end
        else begin 
            clk_div4 <= ~clk_div4;
        end
    end

    assign  clk_fpga = clk_div4; 
   
   // reg  q;
   // always @(posedge clk or negedge arstb) begin
   //     if(!arstb) begin
   //         q <= 1'd0;
   //     end
   //     else if (!rst_retime) begin
   //         q <= 1'd0;
   //     end 
   //     else begin
   //         if (q == 1'd1) begin
   //             q <= 1'd0;
   //         end
   //         else begin
   //            q <= q + 1'd1;
   //         end 
   //     end
   // end
    
   // assign  clk_div = (q < 1'd1) ? 1'b1 : 1'b0 ; 



    always @(posedge clk or negedge arstb) begin
		if(!arstb) begin
            la0     <= 1'b0;
            la1     <= 1'b0;
            la2     <= 1'b0;
            la3     <= 1'b0;
            la4     <= 1'b0;
            la5     <= 1'b0;
            la6     <= 1'b0;
            la7     <= 1'b0;
            la8     <= 1'b0;
            la9     <= 1'b0;
            la10    <= 1'b0;
            la11    <= 1'b0;
            la12    <= 1'b0;
            la13    <= 1'b0;
            la14    <= 1'b0;
            la15    <= 1'b0;
            la16    <= 1'b0;
            la17    <= 1'b0;
            la18    <= 1'b0;
            la19    <= 1'b0;
            la20    <= 1'b0;
            la21    <= 1'b0;
            la22    <= 1'b0;
            la23    <= 1'b0;
            la24    <= 1'b0;
            la25    <= 1'b0;
            la26    <= 1'b0;
            la27    <= 1'b0;
            la28    <= 1'b0;
            la29    <= 1'b0;
            la30    <= 1'b0;
            la31    <= 1'b0;
            la32    <= 1'b0;
            la33    <= 1'b0;
            la34    <= 1'b0;
            la35    <= 1'b0;
            la36    <= 1'b0;
            la37    <= 1'b0;
            la38    <= 1'b0;
            la39    <= 1'b0;
            
            la0_d   <= 1'b0;
            la1_d   <= 1'b0;
            la2_d   <= 1'b0;
            la3_d   <= 1'b0;
            la4_d   <= 1'b0;
            la5_d   <= 1'b0;
            la6_d   <= 1'b0;
            la7_d   <= 1'b0;
            la8_d   <= 1'b0;
            la9_d   <= 1'b0;
            la10_d  <= 1'b0;
            la11_d  <= 1'b0;
            la12_d  <= 1'b0;
            la13_d  <= 1'b0;
            la14_d  <= 1'b0;
            la15_d  <= 1'b0;
            la16_d  <= 1'b0;
            la17_d  <= 1'b0;
            la18_d  <= 1'b0;
            la19_d  <= 1'b0;
            la20_d  <= 1'b0;
            la21_d  <= 1'b0;
            la22_d  <= 1'b0;
            la23_d  <= 1'b0;
            la24_d  <= 1'b0;
            la25_d  <= 1'b0;
            la26_d  <= 1'b0;
            la27_d  <= 1'b0;
            la28_d  <= 1'b0;
            la29_d  <= 1'b0;
            la30_d  <= 1'b0;
            la31_d  <= 1'b0;
            la32_d  <= 1'b0;
            la33_d  <= 1'b0;
            la34_d  <= 1'b0;
            la35_d  <= 1'b0;
            la36_d  <= 1'b0;
            la37_d  <= 1'b0;
            la38_d  <= 1'b0;
            la39_d  <= 1'b0;
        
            la0_dd  <= 1'b0;
            la1_dd  <= 1'b0;
            la2_dd  <= 1'b0;
            la3_dd  <= 1'b0;
            la4_dd  <= 1'b0;
            la5_dd  <= 1'b0;
            la6_dd  <= 1'b0;
            la7_dd  <= 1'b0;
            la8_dd  <= 1'b0;
            la9_dd  <= 1'b0;
            la10_dd <= 1'b0;
            la11_dd <= 1'b0;
            la12_dd <= 1'b0;
            la13_dd <= 1'b0;
            la14_dd <= 1'b0;
            la15_dd <= 1'b0;
            la16_dd <= 1'b0;
            la17_dd <= 1'b0;
            la18_dd <= 1'b0;
            la19_dd <= 1'b0;
            la20_dd <= 1'b0;
            la21_dd <= 1'b0;
            la22_dd <= 1'b0;
            la23_dd <= 1'b0;
            la24_dd <= 1'b0;
            la25_dd <= 1'b0;
            la26_dd <= 1'b0;
            la27_dd <= 1'b0;
            la28_dd <= 1'b0;
            la29_dd <= 1'b0;
            la30_dd <= 1'b0;
            la31_dd <= 1'b0;
            la32_dd <= 1'b0;
            la33_dd <= 1'b0;
            la34_dd <= 1'b0;
            la35_dd <= 1'b0;
            la36_dd <= 1'b0;
            la37_dd <= 1'b0;
            la38_dd <= 1'b0;
            la39_dd <= 1'b0;
        
            la0_ddd     <= 1'b0;
            la1_ddd     <= 1'b0;
            la2_ddd     <= 1'b0;
            la3_ddd     <= 1'b0;
            la4_ddd     <= 1'b0;
            la5_ddd     <= 1'b0;
            la6_ddd     <= 1'b0;
            la7_ddd     <= 1'b0;
            la8_ddd     <= 1'b0;
            la9_ddd     <= 1'b0;
            la10_ddd    <= 1'b0;
            la11_ddd    <= 1'b0;
            la12_ddd    <= 1'b0;
            la13_ddd    <= 1'b0;
            la14_ddd    <= 1'b0;
            la15_ddd    <= 1'b0;
            la16_ddd    <= 1'b0;
            la17_ddd    <= 1'b0;
            la18_ddd    <= 1'b0;
            la19_ddd    <= 1'b0;
            la20_ddd    <= 1'b0;
            la21_ddd    <= 1'b0;
            la22_ddd    <= 1'b0;
            la23_ddd    <= 1'b0;
            la24_ddd    <= 1'b0;
            la25_ddd    <= 1'b0;
            la26_ddd    <= 1'b0;
            la27_ddd    <= 1'b0;
            la28_ddd    <= 1'b0;
            la29_ddd    <= 1'b0;
            la30_ddd    <= 1'b0;
            la31_ddd    <= 1'b0;
            la32_ddd    <= 1'b0;
            la33_ddd    <= 1'b0;
            la34_ddd    <= 1'b0;
            la35_ddd    <= 1'b0;
            la36_ddd    <= 1'b0;
            la37_ddd    <= 1'b0;
            la38_ddd    <= 1'b0;
            la39_ddd    <= 1'b0;
		end
        else if(!rst_retime) begin
            la0     <= 1'b0;
            la1     <= 1'b0;
            la2     <= 1'b0;
            la3     <= 1'b0;
            la4     <= 1'b0;
            la5     <= 1'b0;
            la6     <= 1'b0;
            la7     <= 1'b0;
            la8     <= 1'b0;
            la9     <= 1'b0;
            la10    <= 1'b0;
            la11    <= 1'b0;
            la12    <= 1'b0;
            la13    <= 1'b0;
            la14    <= 1'b0;
            la15    <= 1'b0;
            la16    <= 1'b0;
            la17    <= 1'b0;
            la18    <= 1'b0;
            la19    <= 1'b0;
            la20    <= 1'b0;
            la21    <= 1'b0;
            la22    <= 1'b0;
            la23    <= 1'b0;
            la24    <= 1'b0;
            la25    <= 1'b0;
            la26    <= 1'b0;
            la27    <= 1'b0;
            la28    <= 1'b0;
            la29    <= 1'b0;
            la30    <= 1'b0;
            la31    <= 1'b0;
            la32    <= 1'b0;
            la33    <= 1'b0;
            la34    <= 1'b0;
            la35    <= 1'b0;
            la36    <= 1'b0;
            la37    <= 1'b0;
            la38    <= 1'b0;
            la39    <= 1'b0;
            
            la0_d   <= 1'b0;
            la1_d   <= 1'b0;
            la2_d   <= 1'b0;
            la3_d   <= 1'b0;
            la4_d   <= 1'b0;
            la5_d   <= 1'b0;
            la6_d   <= 1'b0;
            la7_d   <= 1'b0;
            la8_d   <= 1'b0;
            la9_d   <= 1'b0;
            la10_d  <= 1'b0;
            la11_d  <= 1'b0;
            la12_d  <= 1'b0;
            la13_d  <= 1'b0;
            la14_d  <= 1'b0;
            la15_d  <= 1'b0;
            la16_d  <= 1'b0;
            la17_d  <= 1'b0;
            la18_d  <= 1'b0;
            la19_d  <= 1'b0;
            la20_d  <= 1'b0;
            la21_d  <= 1'b0;
            la22_d  <= 1'b0;
            la23_d  <= 1'b0;
            la24_d  <= 1'b0;
            la25_d  <= 1'b0;
            la26_d  <= 1'b0;
            la27_d  <= 1'b0;
            la28_d  <= 1'b0;
            la29_d  <= 1'b0;
            la30_d  <= 1'b0;
            la31_d  <= 1'b0;
            la32_d  <= 1'b0;
            la33_d  <= 1'b0;
            la34_d  <= 1'b0;
            la35_d  <= 1'b0;
            la36_d  <= 1'b0;
            la37_d  <= 1'b0;
            la38_d  <= 1'b0;
            la39_d  <= 1'b0;
        
            la0_dd  <= 1'b0;
            la1_dd  <= 1'b0;
            la2_dd  <= 1'b0;
            la3_dd  <= 1'b0;
            la4_dd  <= 1'b0;
            la5_dd  <= 1'b0;
            la6_dd  <= 1'b0;
            la7_dd  <= 1'b0;
            la8_dd  <= 1'b0;
            la9_dd  <= 1'b0;
            la10_dd <= 1'b0;
            la11_dd <= 1'b0;
            la12_dd <= 1'b0;
            la13_dd <= 1'b0;
            la14_dd <= 1'b0;
            la15_dd <= 1'b0;
            la16_dd <= 1'b0;
            la17_dd <= 1'b0;
            la18_dd <= 1'b0;
            la19_dd <= 1'b0;
            la20_dd <= 1'b0;
            la21_dd <= 1'b0;
            la22_dd <= 1'b0;
            la23_dd <= 1'b0;
            la24_dd <= 1'b0;
            la25_dd <= 1'b0;
            la26_dd <= 1'b0;
            la27_dd <= 1'b0;
            la28_dd <= 1'b0;
            la29_dd <= 1'b0;
            la30_dd <= 1'b0;
            la31_dd <= 1'b0;
            la32_dd <= 1'b0;
            la33_dd <= 1'b0;
            la34_dd <= 1'b0;
            la35_dd <= 1'b0;
            la36_dd <= 1'b0;
            la37_dd <= 1'b0;
            la38_dd <= 1'b0;
            la39_dd <= 1'b0;
        
            la0_ddd     <= 1'b0;
            la1_ddd     <= 1'b0;
            la2_ddd     <= 1'b0;
            la3_ddd     <= 1'b0;
            la4_ddd     <= 1'b0;
            la5_ddd     <= 1'b0;
            la6_ddd     <= 1'b0;
            la7_ddd     <= 1'b0;
            la8_ddd     <= 1'b0;
            la9_ddd     <= 1'b0;
            la10_ddd    <= 1'b0;
            la11_ddd    <= 1'b0;
            la12_ddd    <= 1'b0;
            la13_ddd    <= 1'b0;
            la14_ddd    <= 1'b0;
            la15_ddd    <= 1'b0;
            la16_ddd    <= 1'b0;
            la17_ddd    <= 1'b0;
            la18_ddd    <= 1'b0;
            la19_ddd    <= 1'b0;
            la20_ddd    <= 1'b0;
            la21_ddd    <= 1'b0;
            la22_ddd    <= 1'b0;
            la23_ddd    <= 1'b0;
            la24_ddd    <= 1'b0;
            la25_ddd    <= 1'b0;
            la26_ddd    <= 1'b0;
            la27_ddd    <= 1'b0;
            la28_ddd    <= 1'b0;
            la29_ddd    <= 1'b0;
            la30_ddd    <= 1'b0;
            la31_ddd    <= 1'b0;
            la32_ddd    <= 1'b0;
            la33_ddd    <= 1'b0;
            la34_ddd    <= 1'b0;
            la35_ddd    <= 1'b0;
            la36_ddd    <= 1'b0;
            la37_ddd    <= 1'b0;
            la38_ddd    <= 1'b0;
            la39_ddd    <= 1'b0;
       end 
       else begin 
            la0     <= la0_p ;
            la1     <= la1_p ;
            la2     <= la2_p ;
            la3     <= la3_p ;
            la4     <= la4_p ;
            la5     <= la5_p ;
            la6     <= la6_p ;
            la7     <= la7_p ;
            la8     <= la8_p ;
            la9     <= la9_p ;
            la10    <= la10_p;
            la11    <= la11_p;
            la12    <= la12_p;
            la13    <= la13_p;
            la14    <= la14_p;
            la15    <= la15_p;
            la16    <= la16_p;
            la17    <= la17_p;
            la18    <= la18_p;
            la19    <= la19_p;
            
            la20    <= la0;
            la21    <= la1;
            la22    <= la2;
            la23    <= la3;
            la24    <= la4;
            la25    <= la5;
            la26    <= la6;
            la27    <= la7;
            la28    <= la8;
            la29    <= la9;
            la30    <= la10;
            la31    <= la11;
            la32    <= la12;
            la33    <= la13;
            la34    <= la14;
            la35    <= la15;
            la36    <= la16;
            la37    <= la17;
            la38    <= la18;
            la39    <= la19;
            
            la0_d     <= la20; 
            la1_d     <= la21;
            la2_d     <= la22;
            la3_d     <= la23;
            la4_d     <= la24;
            la5_d     <= la25;
            la6_d     <= la26;
            la7_d     <= la27;
            la8_d     <= la28;
            la9_d     <= la29;
            la10_d    <= la30;
            la11_d    <= la31;
            la12_d    <= la32;
            la13_d    <= la33;
            la14_d    <= la34;
            la15_d    <= la35;
            la16_d    <= la36;
            la17_d    <= la37;
            la18_d    <= la38;
            la19_d    <= la39;
            
            la20_d    <= la0_d;  
            la21_d    <= la1_d; 
            la22_d    <= la2_d; 
            la23_d    <= la3_d; 
            la24_d    <= la4_d; 
            la25_d    <= la5_d; 
            la26_d    <= la6_d; 
            la27_d    <= la7_d; 
            la28_d    <= la8_d; 
            la29_d    <= la9_d; 
            la30_d    <= la10_d; 
            la31_d    <= la11_d;
            la32_d    <= la12_d;
            la33_d    <= la13_d;
            la34_d    <= la14_d;
            la35_d    <= la15_d;
            la36_d    <= la16_d;
            la37_d    <= la17_d;
            la38_d    <= la18_d;
            la39_d    <= la19_d;
            
            la0_dd  <= la20_d;  
            la1_dd  <= la21_d;
            la2_dd  <= la22_d;
            la3_dd  <= la23_d;
            la4_dd  <= la24_d;
            la5_dd  <= la25_d;
            la6_dd  <= la26_d;
            la7_dd  <= la27_d;
            la8_dd  <= la28_d;
            la9_dd  <= la29_d;
            la10_dd <= la30_d;
            la11_dd <= la31_d;
            la12_dd <= la32_d;
            la13_dd <= la33_d;
            la14_dd <= la34_d;
            la15_dd <= la35_d;
            la16_dd <= la36_d;
            la17_dd <= la37_d;
            la18_dd <= la38_d;
            la19_dd <= la39_d;
            
            la20_dd <= la0_dd; 
            la21_dd <= la1_dd; 
            la22_dd <= la2_dd; 
            la23_dd <= la3_dd; 
            la24_dd <= la4_dd; 
            la25_dd <= la5_dd; 
            la26_dd <= la6_dd; 
            la27_dd <= la7_dd; 
            la28_dd <= la8_dd; 
            la29_dd <= la9_dd; 
            la30_dd <= la10_dd; 
            la31_dd <= la11_dd;
            la32_dd <= la12_dd;
            la33_dd <= la13_dd;
            la34_dd <= la14_dd;
            la35_dd <= la15_dd;
            la36_dd <= la16_dd;
            la37_dd <= la17_dd;
            la38_dd <= la18_dd;
            la39_dd <= la19_dd;
            
            la0_ddd <= la20_dd;
            la1_ddd <= la21_dd;
            la2_ddd <= la22_dd;
            la3_ddd <= la23_dd;
            la4_ddd <= la24_dd; 
            la5_ddd <= la25_dd; 
            la6_ddd <= la26_dd; 
            la7_ddd <= la27_dd; 
            la8_ddd <= la28_dd; 
            la9_ddd <= la29_dd; 
            la10_ddd<= la30_dd; 
            la11_ddd<= la31_dd; 
            la12_ddd<= la32_dd; 
            la13_ddd<= la33_dd; 
            la14_ddd<= la34_dd; 
            la15_ddd<= la35_dd; 
            la16_ddd<= la36_dd; 
            la17_ddd<= la37_dd; 
            la18_ddd<= la38_dd; 
            la19_ddd<= la39_dd; 
            
            la20_ddd <= la0_ddd ;
            la21_ddd <= la1_ddd ;
            la22_ddd <= la2_ddd ;
            la23_ddd <= la3_ddd ;
            la24_ddd <= la4_ddd ;
            la25_ddd <= la5_ddd ;
            la26_ddd <= la6_ddd ;
            la27_ddd <= la7_ddd ;
            la28_ddd <= la8_ddd ;
            la29_ddd <= la9_ddd ;
            la30_ddd <= la10_ddd; 
            la31_ddd <= la11_ddd;        
            la32_ddd <= la12_ddd;      
            la33_ddd <= la13_ddd;        
            la34_ddd <= la14_ddd;        
            la35_ddd <= la15_ddd;        
            la36_ddd <= la16_ddd;        
            la37_ddd <= la17_ddd;
            la38_ddd <= la18_ddd;        
            la39_ddd <= la19_ddd;        
               
       end
    end 
        

    always @(posedge clk_div4 or negedge arstb) begin
		if(!arstb) begin
           x0_0 <= 6'b0;  
           x0_1 <= 6'b0;  
           x0_2 <= 6'b0;
           x0_3 <= 6'b0;
           x0_4 <= 6'b0;
           x0_5 <= 6'b0;
           x0_6 <= 6'b0;
           x0_7 <= 6'b0;
           
           x1_0 <= 6'b0;
           x1_1 <= 6'b0;
           x1_2 <= 6'b0;
           x1_3 <= 6'b0;
           x1_4 <= 6'b0;
           x1_5 <= 6'b0;
           x1_6 <= 6'b0;
           x1_7 <= 6'b0;
           
           x2_0 <= 6'b0;
           x2_1 <= 6'b0;
           x2_2 <= 6'b0;
           x2_3 <= 6'b0;
           x2_4 <= 6'b0;
           x2_5 <= 6'b0;
           x2_6 <= 6'b0;
           x2_7 <= 6'b0;
           
           x3_0 <= 6'b0;
           x3_1 <= 6'b0;
           x3_2 <= 6'b0;
           x3_3 <= 6'b0;
           x3_4 <= 6'b0;
           x3_5 <= 6'b0;
           x3_6 <= 6'b0;
           x3_7 <= 6'b0;
        end
        else if(cnt == 2'd3) begin
           x0_0 <= {{la4_ddd},{la3_ddd},{la2_ddd},{la1_ddd},{la0_ddd},1'b0} ;
           x0_1 <= {{la9_ddd},{la8_ddd},{la7_ddd},{la6_ddd},{la5_ddd},1'b0} ;
           x0_2 <= {{la14_ddd},{la13_ddd},{la12_ddd},{la11_ddd},{la10_ddd},1'b0} ;
           x0_3 <= {{la19_ddd},{la18_ddd},{la17_ddd},{la16_ddd},{la15_ddd},1'b0} ;
           x0_4 <= {{la24_ddd},{la23_ddd},{la22_ddd},{la21_ddd},{la20_ddd},1'b0} ;
           // x0_5 <= {{la29_ddd},{la28_ddd},{la22_ddd},{la21_ddd},{la20_ddd},1'b0} ;
           x0_5 <= {{la29_ddd},{la28_ddd},{la27_ddd},{la26_ddd},{la25_ddd},1'b0} ;
           x0_6 <= {{la34_ddd},{la33_ddd},{la32_ddd},{la31_ddd},{la30_ddd},1'b0} ;
           x0_7 <= {{la39_ddd},{la38_ddd},{la37_ddd},{la36_ddd},{la35_ddd},1'b0} ;
           
           x1_0 <= {{la4_dd}, {la3_dd },{la2_dd },{la1_dd },{la0_dd },1'b0} ;
           x1_1 <= {{la9_dd}, {la8_dd },{la7_dd },{la6_dd },{la5_dd },1'b0} ;
           x1_2 <= {{la14_dd},{la13_dd},{la12_dd},{la11_dd},{la10_dd},1'b0} ;
           x1_3 <= {{la19_dd},{la18_dd},{la17_dd},{la16_dd},{la15_dd},1'b0} ;
           x1_4 <= {{la24_dd},{la23_dd},{la22_dd},{la21_dd},{la20_dd},1'b0} ;
           // x1_5 <= {{la29_dd},{la28_dd},{la22_dd},{la21_dd},{la20_dd},1'b0} ;
           x1_5 <= {{la29_dd},{la28_dd},{la27_dd},{la26_dd},{la25_dd},1'b0} ;
           x1_6 <= {{la34_dd},{la33_dd},{la32_dd},{la31_dd},{la30_dd},1'b0} ;
           x1_7 <= {{la39_dd},{la38_dd},{la37_dd},{la36_dd},{la35_dd},1'b0} ;
           
           x2_0 <= {{la4_d} ,{la3_d },{la2_d },{la1_d}, {la0_d} ,1'b0} ;
           x2_1 <= {{la9_d} ,{la8_d },{la7_d },{la6_d}, {la5_d} ,1'b0} ;
           x2_2 <= {{la14_d},{la13_d},{la12_d},{la11_d},{la10_d},1'b0} ;
           x2_3 <= {{la19_d},{la18_d},{la17_d},{la16_d},{la15_d},1'b0} ;
           x2_4 <= {{la24_d},{la23_d},{la22_d},{la21_d},{la20_d},1'b0} ;
           // x2_5 <= {{la29_d},{la28_d},{la22_d},{la21_d},{la20_d},1'b0} ;
           x2_5 <= {{la29_d},{la28_d},{la27_d},{la26_d},{la25_d},1'b0} ;
           x2_6 <= {{la34_d},{la33_d},{la32_d},{la31_d},{la30_d},1'b0} ;
           x2_7 <= {{la39_d},{la38_d},{la37_d},{la36_d},{la35_d},1'b0} ;
           
           x3_0 <= {{la4}, {la3} ,{la2} ,{la1} ,{la0},1'b0} ;
           x3_1 <= {{la9}, {la8} ,{la7} ,{la6} ,{la5},1'b0} ;
           x3_2 <= {{la14},{la13},{la12},{la11},{la10},1'b0} ;
           x3_3 <= {{la19},{la18},{la17},{la16},{la15},1'b0} ;
           x3_4 <= {{la24},{la23},{la22},{la21},{la20},1'b0} ;
           // x3_5 <= {{la29},{la28},{la22},{la21},{la20},1'b0} ;
           x3_5 <= {{la29},{la28},{la27},{la26},{la25},1'b0} ;
           x3_6 <= {{la34},{la33},{la32},{la31},{la30},1'b0} ;
           x3_7 <= {{la39},{la38},{la37},{la36},{la35},1'b0} ;
        end 
		else begin
           x0_0 <= x0_0;  
           x0_1 <= x0_1;  
           x0_2 <= x0_2;
           x0_3 <= x0_3;
           x0_4 <= x0_4;
           x0_5 <= x0_5;
           x0_6 <= x0_6;
           x0_7 <= x0_7;
                   
           x1_0 <= x1_0;
           x1_1 <= x1_1;
           x1_2 <= x1_2;
           x1_3 <= x1_3;
           x1_4 <= x1_4;
           x1_5 <= x1_5;
           x1_6 <= x1_6;
           x1_7 <= x1_7;
                   
           x2_0 <= x2_0;
           x2_1 <= x2_1;
           x2_2 <= x2_2;
           x2_3 <= x2_3;
           x2_4 <= x2_4;
           x2_5 <= x2_5;
           x2_6 <= x2_6;
           x2_7 <= x2_7;
                   
           x3_0 <= x3_0;
           x3_1 <= x3_1;
           x3_2 <= x3_2;
           x3_3 <= x3_3;
           x3_4 <= x3_4;
           x3_5 <= x3_5;
           x3_6 <= x3_6;
           x3_7 <= x3_7;
        end
    end



endmodule
