//////////////////////////////////////////
//	Dflipflop				//
//	Author : KHLEE93			//
//	Update : 2020.12.27		//
//////////////////////////////////////////

`timescale 1ns/1fs
module pipe_r(
    
    input       wire            clk,	
	input       wire            arstb,	
	input       wire            rstb,	
    
    input      signed      [8:0]      d_r_0,  
    input      signed      [8:0]      d_r_1,  
    input      signed      [8:0]      d_r_2,  
    input      signed      [8:0]      d_r_3,  
    input      signed      [8:0]      d_r_4,  
    input      signed      [8:0]      d_r_5,  
    input      signed      [8:0]      d_r_6,  
    input      signed      [8:0]      d_r_7,  
    input      signed      [8:0]      d_r_8,  
    input      signed      [8:0]      d_r_9,  
    input      signed      [8:0]      d_r_10,  
    input      signed      [8:0]      d_r_11,  
    input      signed      [8:0]      d_r_12,  
    input      signed      [8:0]      d_r_13,  
    input      signed      [8:0]      d_r_14,  
    input      signed      [8:0]      d_r_15,  
    input      signed      [8:0]      d_r_16,  
    input      signed      [8:0]      d_r_17,  
    input      signed      [8:0]      d_r_18,  
    input      signed      [8:0]      d_r_19,  
    input      signed      [8:0]      d_r_20,  
    input      signed      [8:0]      d_r_21,  
    input      signed      [8:0]      d_r_22,  
    input      signed      [8:0]      d_r_23,  
    input      signed      [8:0]      d_r_24,  
    input      signed      [8:0]      d_r_25,  
    input      signed      [8:0]      d_r_26,  
    input      signed      [8:0]      d_r_27,  
    input      signed      [8:0]      d_r_28,  
    input      signed      [8:0]      d_r_29,  
    input      signed      [8:0]      d_r_30,  
    input      signed      [8:0]      d_r_31,  
    
	
    output      reg signed      [8:0]      q_r_0,  
    output      reg signed      [8:0]      q_r_1,  
    output      reg signed      [8:0]      q_r_2,  
    output      reg signed      [8:0]      q_r_3,  
    output      reg signed      [8:0]      q_r_4,  
    output      reg signed      [8:0]      q_r_5,  
    output      reg signed      [8:0]      q_r_6,  
    output      reg signed      [8:0]      q_r_7,  
    output      reg signed      [8:0]      q_r_8,  
    output      reg signed      [8:0]      q_r_9,  
    output      reg signed      [8:0]      q_r_10,  
    output      reg signed      [8:0]      q_r_11,  
    output      reg signed      [8:0]      q_r_12,  
    output      reg signed      [8:0]      q_r_13,  
    output      reg signed      [8:0]      q_r_14,  
    output      reg signed      [8:0]      q_r_15,  
    output      reg signed      [8:0]      q_r_16,  
    output      reg signed      [8:0]      q_r_17,  
    output      reg signed      [8:0]      q_r_18,  
    output      reg signed      [8:0]      q_r_19,  
    output      reg signed      [8:0]      q_r_20,  
    output      reg signed      [8:0]      q_r_21,  
    output      reg signed      [8:0]      q_r_22,  
    output      reg signed      [8:0]      q_r_23,  
    output      reg signed      [8:0]      q_r_24,  
    output      reg signed      [8:0]      q_r_25,  
    output      reg signed      [8:0]      q_r_26,  
    output      reg signed      [8:0]      q_r_27,  
    output      reg signed      [8:0]      q_r_28,  
    output      reg signed      [8:0]      q_r_29,  
    output      reg signed      [8:0]      q_r_30,  
    output      reg signed      [8:0]      q_r_31  
    

	);

    
    always @(posedge clk or negedge arstb) begin
        if(!arstb) begin
              q_r_0   <=  9'b0;     
              q_r_1   <=  9'b0; 
              q_r_2   <=  9'b0; 
              q_r_3   <=  9'b0; 
              q_r_4   <=  9'b0; 
              q_r_5   <=  9'b0; 
              q_r_6   <=  9'b0; 
              q_r_7   <=  9'b0; 
              q_r_8   <=  9'b0; 
              q_r_9   <=  9'b0; 
              q_r_10  <=  9'b0;  
              q_r_11  <=  9'b0;  
              q_r_12  <=  9'b0;  
              q_r_13  <=  9'b0;  
              q_r_14  <=  9'b0;  
              q_r_15  <=  9'b0;  
              q_r_16  <=  9'b0;  
              q_r_17  <=  9'b0;  
              q_r_18  <=  9'b0;  
              q_r_19  <=  9'b0;  
              q_r_20  <=  9'b0;  
              q_r_21  <=  9'b0;  
              q_r_22  <=  9'b0;  
              q_r_23  <=  9'b0;  
              q_r_24  <=  9'b0;  
              q_r_25  <=  9'b0;  
              q_r_26  <=  9'b0;  
              q_r_27  <=  9'b0;  
              q_r_28  <=  9'b0;  
              q_r_29  <=  9'b0;  
              q_r_30  <=  9'b0;  
              q_r_31  <=  9'b0;  

            end 
            else if (!rstb) begin
              q_r_0   <=  9'b0;     
              q_r_1   <=  9'b0; 
              q_r_2   <=  9'b0; 
              q_r_3   <=  9'b0; 
              q_r_4   <=  9'b0; 
              q_r_5   <=  9'b0; 
              q_r_6   <=  9'b0; 
              q_r_7   <=  9'b0; 
              q_r_8   <=  9'b0; 
              q_r_9   <=  9'b0; 
              q_r_10  <=  9'b0;  
              q_r_11  <=  9'b0;  
              q_r_12  <=  9'b0;  
              q_r_13  <=  9'b0;  
              q_r_14  <=  9'b0;  
              q_r_15  <=  9'b0;  
              q_r_16  <=  9'b0;  
              q_r_17  <=  9'b0;  
              q_r_18  <=  9'b0;  
              q_r_19  <=  9'b0;  
              q_r_20  <=  9'b0;  
              q_r_21  <=  9'b0;  
              q_r_22  <=  9'b0;  
              q_r_23  <=  9'b0;  
              q_r_24  <=  9'b0;  
              q_r_25  <=  9'b0;  
              q_r_26  <=  9'b0;  
              q_r_27  <=  9'b0;  
              q_r_28  <=  9'b0;  
              q_r_29  <=  9'b0;  
              q_r_30  <=  9'b0;  
              q_r_31  <=  9'b0;  
            end 
            else begin
              q_r_0   <=  d_r_0 ;     
              q_r_1   <=  d_r_1 ; 
              q_r_2   <=  d_r_2 ; 
              q_r_3   <=  d_r_3 ; 
              q_r_4   <=  d_r_4 ; 
              q_r_5   <=  d_r_5 ; 
              q_r_6   <=  d_r_6 ; 
              q_r_7   <=  d_r_7 ; 
              q_r_8   <=  d_r_8 ; 
              q_r_9   <=  d_r_9 ; 
              q_r_10  <=  d_r_10;  
              q_r_11  <=  d_r_11;  
              q_r_12  <=  d_r_12;  
              q_r_13  <=  d_r_13;  
              q_r_14  <=  d_r_14;  
              q_r_15  <=  d_r_15;  
              q_r_16  <=  d_r_16;  
              q_r_17  <=  d_r_17;  
              q_r_18  <=  d_r_18;  
              q_r_19  <=  d_r_19;  
              q_r_20  <=  d_r_20;  
              q_r_21  <=  d_r_21;  
              q_r_22  <=  d_r_22;  
              q_r_23  <=  d_r_23;  
              q_r_24  <=  d_r_24;  
              q_r_25  <=  d_r_25;  
              q_r_26  <=  d_r_26;  
              q_r_27  <=  d_r_27;  
              q_r_28  <=  d_r_28;  
              q_r_29  <=  d_r_29;  
              q_r_30  <=  d_r_30;  
              q_r_31  <=  d_r_31;  
            end
        end




endmodule
