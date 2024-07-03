
`timescale 1ns/1fs

module fft_power #(parameter W = 4)(
    
    input                               clk,
    input                               arstb,
    
    input      signed      [W-1:0]      fft_out_r_0,  
    input      signed      [W-1:0]      fft_out_r_1,  
    input      signed      [W-1:0]      fft_out_r_2,  
    input      signed      [W-1:0]      fft_out_r_3,  
    input      signed      [W-1:0]      fft_out_r_4,  
    input      signed      [W-1:0]      fft_out_r_5,  
    input      signed      [W-1:0]      fft_out_r_6,  
    input      signed      [W-1:0]      fft_out_r_7,  
    input      signed      [W-1:0]      fft_out_r_8,  
    input      signed      [W-1:0]      fft_out_r_9,  
    input      signed      [W-1:0]      fft_out_r_10,  
    input      signed      [W-1:0]      fft_out_r_11,  
    input      signed      [W-1:0]      fft_out_r_12,  
    input      signed      [W-1:0]      fft_out_r_13,  
    input      signed      [W-1:0]      fft_out_r_14,  
    input      signed      [W-1:0]      fft_out_r_15,  
    input      signed      [W-1:0]      fft_out_r_16,  
    input      signed      [W-1:0]      fft_out_r_17,  
    input      signed      [W-1:0]      fft_out_r_18,  
    input      signed      [W-1:0]      fft_out_r_19,  
    input      signed      [W-1:0]      fft_out_r_20,  
    input      signed      [W-1:0]      fft_out_r_21,  
    input      signed      [W-1:0]      fft_out_r_22,  
    input      signed      [W-1:0]      fft_out_r_23,  
    input      signed      [W-1:0]      fft_out_r_24,  
    input      signed      [W-1:0]      fft_out_r_25,  
    input      signed      [W-1:0]      fft_out_r_26,  
    input      signed      [W-1:0]      fft_out_r_27,  
    input      signed      [W-1:0]      fft_out_r_28,  
    input      signed      [W-1:0]      fft_out_r_29,  
    input      signed      [W-1:0]      fft_out_r_30,  
    input      signed      [W-1:0]      fft_out_r_31,  
    
    input      signed      [W-1:0]      fft_out_i_0,  
    input      signed      [W-1:0]      fft_out_i_1,  
    input      signed      [W-1:0]      fft_out_i_2,  
    input      signed      [W-1:0]      fft_out_i_3,  
    input      signed      [W-1:0]      fft_out_i_4,  
    input      signed      [W-1:0]      fft_out_i_5,  
    input      signed      [W-1:0]      fft_out_i_6,  
    input      signed      [W-1:0]      fft_out_i_7,  
    input      signed      [W-1:0]      fft_out_i_8,  
    input      signed      [W-1:0]      fft_out_i_9,  
    input      signed      [W-1:0]      fft_out_i_10,  
    input      signed      [W-1:0]      fft_out_i_11,  
    input      signed      [W-1:0]      fft_out_i_12,  
    input      signed      [W-1:0]      fft_out_i_13,  
    input      signed      [W-1:0]      fft_out_i_14,  
    input      signed      [W-1:0]      fft_out_i_15,  
    input      signed      [W-1:0]      fft_out_i_16,  
    input      signed      [W-1:0]      fft_out_i_17,  
    input      signed      [W-1:0]      fft_out_i_18,  
    input      signed      [W-1:0]      fft_out_i_19,  
    input      signed      [W-1:0]      fft_out_i_20,  
    input      signed      [W-1:0]      fft_out_i_21,  
    input      signed      [W-1:0]      fft_out_i_22,  
    input      signed      [W-1:0]      fft_out_i_23,  
    input      signed      [W-1:0]      fft_out_i_24,  
    input      signed      [W-1:0]      fft_out_i_25,  
    input      signed      [W-1:0]      fft_out_i_26,  
    input      signed      [W-1:0]      fft_out_i_27,  
    input      signed      [W-1:0]      fft_out_i_28,  
    input      signed      [W-1:0]      fft_out_i_29,  
    input      signed      [W-1:0]      fft_out_i_30,  
    input      signed      [W-1:0]      fft_out_i_31,  
        
    output         reg    signed     [2*W+2:0]      pwr_0,  
    output         reg    signed     [2*W+2:0]      pwr_1,  
    output         reg    signed     [2*W+2:0]      pwr_2,  
    output         reg    signed     [2*W+2:0]      pwr_3,  
    output         reg    signed     [2*W+2:0]      pwr_4,  
    output         reg    signed     [2*W+2:0]      pwr_5,  
    output         reg    signed     [2*W+2:0]      pwr_6,  
    output         reg    signed     [2*W+2:0]      pwr_7,  
    output         reg    signed     [2*W+2:0]      pwr_8,  
    output         reg    signed     [2*W+2:0]      pwr_9,  
    output         reg    signed     [2*W+2:0]      pwr_10,  
    output         reg    signed     [2*W+2:0]      pwr_11,  
    output         reg    signed     [2*W+2:0]      pwr_12,  
    output         reg    signed     [2*W+2:0]      pwr_13,  
    output         reg    signed     [2*W+2:0]      pwr_14,  
    output         reg    signed     [2*W+2:0]      pwr_15, 
    output         reg    signed     [2*W+2:0]      pwr_16 
    


            );


     wire   signed                   [2*W+2:0]      p_0;
     wire   signed                   [2*W+2:0]      p_1;
     wire   signed                   [2*W+2:0]      p_2;
     wire   signed                   [2*W+2:0]      p_3;
     wire   signed                   [2*W+2:0]      p_4;
     wire   signed                   [2*W+2:0]      p_5;
     wire   signed                   [2*W+2:0]      p_6;
     wire   signed                   [2*W+2:0]      p_7;
     wire   signed                   [2*W+2:0]      p_8;
     wire   signed                   [2*W+2:0]      p_9;
     wire   signed                   [2*W+2:0]      p_10;
     wire   signed                   [2*W+2:0]      p_11;
     wire   signed                   [2*W+2:0]      p_12;
     wire   signed                   [2*W+2:0]      p_13;
     wire   signed                   [2*W+2:0]      p_14;
     wire   signed                   [2*W+2:0]      p_15;
     wire   signed                   [2*W+2:0]      p_16;



    assign p_0 = (fft_out_r_0*fft_out_r_0) + (fft_out_i_0*fft_out_i_0);
    assign p_1 = (fft_out_r_1*fft_out_r_1) + (fft_out_i_1*fft_out_i_1) + (fft_out_r_31*fft_out_r_31) + (fft_out_i_31*fft_out_i_31);
    assign p_2 = (fft_out_r_2*fft_out_r_2) + (fft_out_i_2*fft_out_i_2) + (fft_out_r_30*fft_out_r_30) + (fft_out_i_30*fft_out_i_30);
    assign p_3 = (fft_out_r_3*fft_out_r_3) + (fft_out_i_3*fft_out_i_3) + (fft_out_r_29*fft_out_r_29) + (fft_out_i_29*fft_out_i_29);
    assign p_4 = (fft_out_r_4*fft_out_r_4) + (fft_out_i_4*fft_out_i_4) + (fft_out_r_28*fft_out_r_28) + (fft_out_i_28*fft_out_i_28);
    assign p_5 = (fft_out_r_5*fft_out_r_5) + (fft_out_i_5*fft_out_i_5) + (fft_out_r_27*fft_out_r_27) + (fft_out_i_27*fft_out_i_27);
    assign p_6 = (fft_out_r_6*fft_out_r_6) + (fft_out_i_6*fft_out_i_6) + (fft_out_r_26*fft_out_r_26) + (fft_out_i_26*fft_out_i_26);
    assign p_7 = (fft_out_r_7*fft_out_r_7) + (fft_out_i_7*fft_out_i_7) + (fft_out_r_25*fft_out_r_25) + (fft_out_i_25*fft_out_i_25);
    assign p_8 = (fft_out_r_8*fft_out_r_8) + (fft_out_i_8*fft_out_i_8) + (fft_out_r_24*fft_out_r_24) + (fft_out_i_24*fft_out_i_24);
    assign p_9 = (fft_out_r_9*fft_out_r_9) + (fft_out_i_9*fft_out_i_9) + (fft_out_r_23*fft_out_r_23) + (fft_out_i_23*fft_out_i_23);
    assign p_10 = (fft_out_r_10*fft_out_r_10) + (fft_out_i_10*fft_out_i_10) + (fft_out_r_22*fft_out_r_22) + (fft_out_i_22*fft_out_i_22);
    assign p_11 = (fft_out_r_11*fft_out_r_11) + (fft_out_i_11*fft_out_i_11) + (fft_out_r_21*fft_out_r_21) + (fft_out_i_21*fft_out_i_21);
    assign p_12 = (fft_out_r_12*fft_out_r_12) + (fft_out_i_12*fft_out_i_12) + (fft_out_r_20*fft_out_r_20) + (fft_out_i_20*fft_out_i_20);
    assign p_13 = (fft_out_r_13*fft_out_r_13) + (fft_out_i_13*fft_out_i_13) + (fft_out_r_19*fft_out_r_19) + (fft_out_i_19*fft_out_i_19);
    assign p_14 = (fft_out_r_14*fft_out_r_14) + (fft_out_i_14*fft_out_i_14) + (fft_out_r_18*fft_out_r_18) + (fft_out_i_18*fft_out_i_18);
    assign p_15 = (fft_out_r_15*fft_out_r_15) + (fft_out_i_15*fft_out_i_15) + (fft_out_r_17*fft_out_r_17) + (fft_out_i_17*fft_out_i_17);
    // assign p_16 = (fft_out_r_16*fft_out_r_16) + (fft_out_i_16*fft_out_i_16) + (fft_out_r_16*fft_out_r_16) + (fft_out_i_16*fft_out_i_16);
    assign p_16 = (fft_out_r_16*fft_out_r_16) + (fft_out_i_16*fft_out_i_16);



    reg rstb;

    always @(posedge clk or negedge arstb) begin
        if(!arstb) begin
            rstb    <=  1'b0;
        end
        else begin
            rstb    <=  1'b1;
        end
    end

    always @(posedge clk or negedge arstb) begin
        if(!arstb) begin
            pwr_0 <= {(2*W+2){1'b0}};
            pwr_1 <= {(2*W+2){1'b0}};
            pwr_2 <= {(2*W+2){1'b0}};
            pwr_3 <= {(2*W+2){1'b0}};
            pwr_4 <= {(2*W+2){1'b0}};
            pwr_5 <= {(2*W+2){1'b0}};
            pwr_6 <= {(2*W+2){1'b0}};
            pwr_7 <= {(2*W+2){1'b0}};
            pwr_8 <= {(2*W+2){1'b0}};
            pwr_9 <= {(2*W+2){1'b0}};
            pwr_10 <= {(2*W+2){1'b0}};
            pwr_11 <= {(2*W+2){1'b0}};
            pwr_12 <= {(2*W+2){1'b0}};
            pwr_13 <= {(2*W+2){1'b0}};
            pwr_14 <= {(2*W+2){1'b0}};
            pwr_15 <= {(2*W+2){1'b0}};
            pwr_16 <= {(2*W+2){1'b0}};
        end
        else if(!rstb) begin
            pwr_0 <= {(2*W+2){1'b0}};
            pwr_1 <= {(2*W+2){1'b0}};
            pwr_2 <= {(2*W+2){1'b0}};
            pwr_3 <= {(2*W+2){1'b0}};
            pwr_4 <= {(2*W+2){1'b0}};
            pwr_5 <= {(2*W+2){1'b0}};
            pwr_6 <= {(2*W+2){1'b0}};
            pwr_7 <= {(2*W+2){1'b0}};
            pwr_8 <= {(2*W+2){1'b0}};
            pwr_9 <= {(2*W+2){1'b0}};
            pwr_10 <= {(2*W+2){1'b0}};
            pwr_11 <= {(2*W+2){1'b0}};
            pwr_12 <= {(2*W+2){1'b0}};
            pwr_13 <= {(2*W+2){1'b0}};
            pwr_14 <= {(2*W+2){1'b0}};
            pwr_15 <= {(2*W+2){1'b0}};
            pwr_16 <= {(2*W+2){1'b0}};
        end
        else begin
            pwr_0  <= p_0 ;
            pwr_1  <= p_1 ;
            pwr_2  <= p_2 ;
            pwr_3  <= p_3 ;
            pwr_4  <= p_4 ;
            pwr_5  <= p_5 ;
            pwr_6  <= p_6 ;
            pwr_7  <= p_7 ;
            pwr_8  <= p_8 ;
            pwr_9  <= p_9 ;
            pwr_10 <= p_10;
            pwr_11 <= p_11;
            pwr_12 <= p_12;
            pwr_13 <= p_13;
            pwr_14 <= p_14;
            pwr_15 <= p_15;
            pwr_16 <= p_16;
        end
    end



endmodule











