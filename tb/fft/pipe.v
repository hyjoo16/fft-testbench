//////////////////////////////////////////
//	Dflipflop				//
//	Author : KHLEE93			//
//	Update : 2020.12.27		//
//////////////////////////////////////////

`timescale 1ns/1fs
module pipe #(parameter W = 15)(
    
  input       wire            clk,	
	input       wire            arstb,	
	input       wire            rstb,	
    
    input      signed      [W-1:0]      d_r_0,  
    input      signed      [W-1:0]      d_r_1,  
    input      signed      [W-1:0]      d_r_2,  
    input      signed      [W-1:0]      d_r_3,  
    input      signed      [W-1:0]      d_r_4,  
    input      signed      [W-1:0]      d_r_5,  
    input      signed      [W-1:0]      d_r_6,  
    input      signed      [W-1:0]      d_r_7,  
    input      signed      [W-1:0]      d_r_8,  
    input      signed      [W-1:0]      d_r_9,  
    input      signed      [W-1:0]      d_r_10,  
    input      signed      [W-1:0]      d_r_11,  
    input      signed      [W-1:0]      d_r_12,  
    input      signed      [W-1:0]      d_r_13,  
    input      signed      [W-1:0]      d_r_14,  
    input      signed      [W-1:0]      d_r_15,  
    input      signed      [W-1:0]      d_r_16,  
    input      signed      [W-1:0]      d_r_17,  
    input      signed      [W-1:0]      d_r_18,  
    input      signed      [W-1:0]      d_r_19,  
    input      signed      [W-1:0]      d_r_20,  
    input      signed      [W-1:0]      d_r_21,  
    input      signed      [W-1:0]      d_r_22,  
    input      signed      [W-1:0]      d_r_23,  
    input      signed      [W-1:0]      d_r_24,  
    input      signed      [W-1:0]      d_r_25,  
    input      signed      [W-1:0]      d_r_26,  
    input      signed      [W-1:0]      d_r_27,  
    input      signed      [W-1:0]      d_r_28,  
    input      signed      [W-1:0]      d_r_29,  
    input      signed      [W-1:0]      d_r_30,  
    input      signed      [W-1:0]      d_r_31,  
    
    input      signed      [W-1:0]      d_i_0,  
    input      signed      [W-1:0]      d_i_1,  
    input      signed      [W-1:0]      d_i_2,  
    input      signed      [W-1:0]      d_i_3,  
    input      signed      [W-1:0]      d_i_4,  
    input      signed      [W-1:0]      d_i_5,  
    input      signed      [W-1:0]      d_i_6,  
    input      signed      [W-1:0]      d_i_7,  
    input      signed      [W-1:0]      d_i_8,  
    input      signed      [W-1:0]      d_i_9,  
    input      signed      [W-1:0]      d_i_10,  
    input      signed      [W-1:0]      d_i_11,  
    input      signed      [W-1:0]      d_i_12,  
    input      signed      [W-1:0]      d_i_13,  
    input      signed      [W-1:0]      d_i_14,  
    input      signed      [W-1:0]      d_i_15,  
    input      signed      [W-1:0]      d_i_16,  
    input      signed      [W-1:0]      d_i_17,  
    input      signed      [W-1:0]      d_i_18,  
    input      signed      [W-1:0]      d_i_19,  
    input      signed      [W-1:0]      d_i_20,  
    input      signed      [W-1:0]      d_i_21,  
    input      signed      [W-1:0]      d_i_22,  
    input      signed      [W-1:0]      d_i_23,  
    input      signed      [W-1:0]      d_i_24,  
    input      signed      [W-1:0]      d_i_25,  
    input      signed      [W-1:0]      d_i_26,  
    input      signed      [W-1:0]      d_i_27,  
    input      signed      [W-1:0]      d_i_28,  
    input      signed      [W-1:0]      d_i_29,  
    input      signed      [W-1:0]      d_i_30,  
    input      signed      [W-1:0]      d_i_31,  
	
    output      reg signed      [W-1:0]      q_r_0,  
    output      reg signed      [W-1:0]      q_r_1,  
    output      reg signed      [W-1:0]      q_r_2,  
    output      reg signed      [W-1:0]      q_r_3,  
    output      reg signed      [W-1:0]      q_r_4,  
    output      reg signed      [W-1:0]      q_r_5,  
    output      reg signed      [W-1:0]      q_r_6,  
    output      reg signed      [W-1:0]      q_r_7,  
    output      reg signed      [W-1:0]      q_r_8,  
    output      reg signed      [W-1:0]      q_r_9,  
    output      reg signed      [W-1:0]      q_r_10,  
    output      reg signed      [W-1:0]      q_r_11,  
    output      reg signed      [W-1:0]      q_r_12,  
    output      reg signed      [W-1:0]      q_r_13,  
    output      reg signed      [W-1:0]      q_r_14,  
    output      reg signed      [W-1:0]      q_r_15,  
    output      reg signed      [W-1:0]      q_r_16,  
    output      reg signed      [W-1:0]      q_r_17,  
    output      reg signed      [W-1:0]      q_r_18,  
    output      reg signed      [W-1:0]      q_r_19,  
    output      reg signed      [W-1:0]      q_r_20,  
    output      reg signed      [W-1:0]      q_r_21,  
    output      reg signed      [W-1:0]      q_r_22,  
    output      reg signed      [W-1:0]      q_r_23,  
    output      reg signed      [W-1:0]      q_r_24,  
    output      reg signed      [W-1:0]      q_r_25,  
    output      reg signed      [W-1:0]      q_r_26,  
    output      reg signed      [W-1:0]      q_r_27,  
    output      reg signed      [W-1:0]      q_r_28,  
    output      reg signed      [W-1:0]      q_r_29,  
    output      reg signed      [W-1:0]      q_r_30,  
    output      reg signed      [W-1:0]      q_r_31,  
    
    output      reg signed      [W-1:0]      q_i_0,  
    output      reg signed      [W-1:0]      q_i_1,  
    output      reg signed      [W-1:0]      q_i_2,  
    output      reg signed      [W-1:0]      q_i_3,  
    output      reg signed      [W-1:0]      q_i_4,  
    output      reg signed      [W-1:0]      q_i_5,  
    output      reg signed      [W-1:0]      q_i_6,  
    output      reg signed      [W-1:0]      q_i_7,  
    output      reg signed      [W-1:0]      q_i_8,  
    output      reg signed      [W-1:0]      q_i_9,  
    output      reg signed      [W-1:0]      q_i_10,  
    output      reg signed      [W-1:0]      q_i_11,  
    output      reg signed      [W-1:0]      q_i_12,  
    output      reg signed      [W-1:0]      q_i_13,  
    output      reg signed      [W-1:0]      q_i_14,  
    output      reg signed      [W-1:0]      q_i_15,  
    output      reg signed      [W-1:0]      q_i_16,  
    output      reg signed      [W-1:0]      q_i_17,  
    output      reg signed      [W-1:0]      q_i_18,  
    output      reg signed      [W-1:0]      q_i_19,  
    output      reg signed      [W-1:0]      q_i_20,  
    output      reg signed      [W-1:0]      q_i_21,  
    output      reg signed      [W-1:0]      q_i_22,  
    output      reg signed      [W-1:0]      q_i_23,  
    output      reg signed      [W-1:0]      q_i_24,  
    output      reg signed      [W-1:0]      q_i_25,  
    output      reg signed      [W-1:0]      q_i_26,  
    output      reg signed      [W-1:0]      q_i_27,  
    output      reg signed      [W-1:0]      q_i_28,  
    output      reg signed      [W-1:0]      q_i_29,  
    output      reg signed      [W-1:0]      q_i_30,  
    output      reg signed      [W-1:0]      q_i_31  

	);

    
    always @(posedge clk or negedge arstb) begin
        if(!arstb) begin
              q_r_0   <=  {W{1'b0}};     
              q_r_1   <=  {W{1'b0}}; 
              q_r_2   <=  {W{1'b0}}; 
              q_r_3   <=  {W{1'b0}}; 
              q_r_4   <=  {W{1'b0}}; 
              q_r_5   <=  {W{1'b0}}; 
              q_r_6   <=  {W{1'b0}}; 
              q_r_7   <=  {W{1'b0}}; 
              q_r_8   <=  {W{1'b0}}; 
              q_r_9   <=  {W{1'b0}}; 
              q_r_10  <=  {W{1'b0}};  
              q_r_11  <=  {W{1'b0}};  
              q_r_12  <=  {W{1'b0}};  
              q_r_13  <=  {W{1'b0}};  
              q_r_14  <=  {W{1'b0}};  
              q_r_15  <=  {W{1'b0}};  
              q_r_16  <=  {W{1'b0}};  
              q_r_17  <=  {W{1'b0}};  
              q_r_18  <=  {W{1'b0}};  
              q_r_19  <=  {W{1'b0}};  
              q_r_20  <=  {W{1'b0}};  
              q_r_21  <=  {W{1'b0}};  
              q_r_22  <=  {W{1'b0}};  
              q_r_23  <=  {W{1'b0}};  
              q_r_24  <=  {W{1'b0}};  
              q_r_25  <=  {W{1'b0}};  
              q_r_26  <=  {W{1'b0}};  
              q_r_27  <=  {W{1'b0}};  
              q_r_28  <=  {W{1'b0}};  
              q_r_29  <=  {W{1'b0}};  
              q_r_30  <=  {W{1'b0}};  
              q_r_31  <=  {W{1'b0}};  

              q_i_0   <=  {W{1'b0}};     
              q_i_1   <=  {W{1'b0}}; 
              q_i_2   <=  {W{1'b0}}; 
              q_i_3   <=  {W{1'b0}}; 
              q_i_4   <=  {W{1'b0}}; 
              q_i_5   <=  {W{1'b0}}; 
              q_i_6   <=  {W{1'b0}}; 
              q_i_7   <=  {W{1'b0}}; 
              q_i_8   <=  {W{1'b0}}; 
              q_i_9   <=  {W{1'b0}}; 
              q_i_10  <=  {W{1'b0}};  
              q_i_11  <=  {W{1'b0}};  
              q_i_12  <=  {W{1'b0}};  
              q_i_13  <=  {W{1'b0}};  
              q_i_14  <=  {W{1'b0}};  
              q_i_15  <=  {W{1'b0}};  
              q_i_16  <=  {W{1'b0}};  
              q_i_17  <=  {W{1'b0}};  
              q_i_18  <=  {W{1'b0}};  
              q_i_19  <=  {W{1'b0}};  
              q_i_20  <=  {W{1'b0}};  
              q_i_21  <=  {W{1'b0}};  
              q_i_22  <=  {W{1'b0}};  
              q_i_23  <=  {W{1'b0}};  
              q_i_24  <=  {W{1'b0}};  
              q_i_25  <=  {W{1'b0}};  
              q_i_26  <=  {W{1'b0}};  
              q_i_27  <=  {W{1'b0}};  
              q_i_28  <=  {W{1'b0}};  
              q_i_29  <=  {W{1'b0}};  
              q_i_30  <=  {W{1'b0}};  
              q_i_31  <=  {W{1'b0}};  

            end 
            else if (!rstb) begin
              q_r_0   <=  {W{1'b0}};     
              q_r_1   <=  {W{1'b0}}; 
              q_r_2   <=  {W{1'b0}}; 
              q_r_3   <=  {W{1'b0}}; 
              q_r_4   <=  {W{1'b0}}; 
              q_r_5   <=  {W{1'b0}}; 
              q_r_6   <=  {W{1'b0}}; 
              q_r_7   <=  {W{1'b0}}; 
              q_r_8   <=  {W{1'b0}}; 
              q_r_9   <=  {W{1'b0}}; 
              q_r_10  <=  {W{1'b0}};  
              q_r_11  <=  {W{1'b0}};  
              q_r_12  <=  {W{1'b0}};  
              q_r_13  <=  {W{1'b0}};  
              q_r_14  <=  {W{1'b0}};  
              q_r_15  <=  {W{1'b0}};  
              q_r_16  <=  {W{1'b0}};  
              q_r_17  <=  {W{1'b0}};  
              q_r_18  <=  {W{1'b0}};  
              q_r_19  <=  {W{1'b0}};  
              q_r_20  <=  {W{1'b0}};  
              q_r_21  <=  {W{1'b0}};  
              q_r_22  <=  {W{1'b0}};  
              q_r_23  <=  {W{1'b0}};  
              q_r_24  <=  {W{1'b0}};  
              q_r_25  <=  {W{1'b0}};  
              q_r_26  <=  {W{1'b0}};  
              q_r_27  <=  {W{1'b0}};  
              q_r_28  <=  {W{1'b0}};  
              q_r_29  <=  {W{1'b0}};  
              q_r_30  <=  {W{1'b0}};  
              q_r_31  <=  {W{1'b0}};  

              q_i_0   <=  {W{1'b0}};     
              q_i_1   <=  {W{1'b0}}; 
              q_i_2   <=  {W{1'b0}}; 
              q_i_3   <=  {W{1'b0}}; 
              q_i_4   <=  {W{1'b0}}; 
              q_i_5   <=  {W{1'b0}}; 
              q_i_6   <=  {W{1'b0}}; 
              q_i_7   <=  {W{1'b0}}; 
              q_i_8   <=  {W{1'b0}}; 
              q_i_9   <=  {W{1'b0}}; 
              q_i_10  <=  {W{1'b0}};  
              q_i_11  <=  {W{1'b0}};  
              q_i_12  <=  {W{1'b0}};  
              q_i_13  <=  {W{1'b0}};  
              q_i_14  <=  {W{1'b0}};  
              q_i_15  <=  {W{1'b0}};  
              q_i_16  <=  {W{1'b0}};  
              q_i_17  <=  {W{1'b0}};  
              q_i_18  <=  {W{1'b0}};  
              q_i_19  <=  {W{1'b0}};  
              q_i_20  <=  {W{1'b0}};  
              q_i_21  <=  {W{1'b0}};  
              q_i_22  <=  {W{1'b0}};  
              q_i_23  <=  {W{1'b0}};  
              q_i_24  <=  {W{1'b0}};  
              q_i_25  <=  {W{1'b0}};  
              q_i_26  <=  {W{1'b0}};  
              q_i_27  <=  {W{1'b0}};  
              q_i_28  <=  {W{1'b0}};  
              q_i_29  <=  {W{1'b0}};  
              q_i_30  <=  {W{1'b0}};  
              q_i_31  <=  {W{1'b0}};  
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
                               
              q_i_0   <=  d_i_0 ;     
              q_i_1   <=  d_i_1 ; 
              q_i_2   <=  d_i_2 ; 
              q_i_3   <=  d_i_3 ; 
              q_i_4   <=  d_i_4 ; 
              q_i_5   <=  d_i_5 ; 
              q_i_6   <=  d_i_6 ; 
              q_i_7   <=  d_i_7 ; 
              q_i_8   <=  d_i_8 ; 
              q_i_9   <=  d_i_9 ; 
              q_i_10  <=  d_i_10;  
              q_i_11  <=  d_i_11;  
              q_i_12  <=  d_i_12;  
              q_i_13  <=  d_i_13;  
              q_i_14  <=  d_i_14;  
              q_i_15  <=  d_i_15;  
              q_i_16  <=  d_i_16;  
              q_i_17  <=  d_i_17;  
              q_i_18  <=  d_i_18;  
              q_i_19  <=  d_i_19;  
              q_i_20  <=  d_i_20;  
              q_i_21  <=  d_i_21;  
              q_i_22  <=  d_i_22;  
              q_i_23  <=  d_i_23;  
              q_i_24  <=  d_i_24;  
              q_i_25  <=  d_i_25;  
              q_i_26  <=  d_i_26;  
              q_i_27  <=  d_i_27;  
              q_i_28  <=  d_i_28;  
              q_i_29  <=  d_i_29;  
              q_i_30  <=  d_i_30;  
              q_i_31  <=  d_i_31;  
            end
        end




endmodule
