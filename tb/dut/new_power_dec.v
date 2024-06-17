
`timescale 1ns/1fs

module new_power_dec(
    
    input                               clk,
    input                               arstb,
    input                               rstb,
    input                               freeze,

    input       signed      [34:0]      pwr,  
    


    output      reg         [3:0]       pwr_dec

            );


    wire [7:0]    w_dec;
    //pwr[34] = signed bit//
    assign  w_dec[0] = ( pwr[4]  | pwr[5]  | pwr[6]  | pwr[7]  | pwr[8]  | pwr[9]  | pwr[10] | pwr[11] );
    assign  w_dec[1] = ( pwr[12] | pwr[13] | pwr[14] | pwr[15] | pwr[16] | pwr[17] | pwr[18] | pwr[19] );
    assign  w_dec[2] = ( pwr[20] | pwr[21] | pwr[22] | pwr[23] | pwr[24] | pwr[25] | pwr[26] | pwr[27] );
    assign  w_dec[3] = ( pwr[28] | pwr[29] | pwr[30] | pwr[31] | pwr[32] | pwr[33]);


    always @(posedge clk or negedge arstb or negedge rstb or posedge freeze) begin
        if(!arstb) begin
            pwr_dec  <= 8'b0;
        end
        else if(!rstb) begin
            pwr_dec  <= 8'b0;
        end
        else begin
            if(freeze) begin
                pwr_dec  <=  pwr_dec ;
            end
            else begin
                pwr_dec  <=   w_dec;
            end
        end
    end


endmodule











