
`timescale 1ns/1fs

module new_power_dec_top(
    
    input                                     clk,
    input                                     arstb,
    input                                     freeze,

    input        signed           [34:0]      pwr_0,  
    input        signed           [34:0]      pwr_1,  
    input        signed           [34:0]      pwr_2,  
    input        signed           [34:0]      pwr_3,  
    input        signed           [34:0]      pwr_4,  
    input        signed           [34:0]      pwr_5,  
    input        signed           [34:0]      pwr_6,  
    input        signed           [34:0]      pwr_7,  
    input        signed           [34:0]      pwr_8,  
    input        signed           [34:0]      pwr_9,  
    input        signed           [34:0]      pwr_10,  
    input        signed           [34:0]      pwr_11,  
    input        signed           [34:0]      pwr_12,  
    input        signed           [34:0]      pwr_13,  
    input        signed           [34:0]      pwr_14,  
    input        signed           [34:0]      pwr_15, 
    input        signed           [34:0]      pwr_16, 
    
    


    output                 [3:0]        pwr_dec_0,
    output                 [3:0]        pwr_dec_1,
    output                 [3:0]        pwr_dec_2,
    output                 [3:0]        pwr_dec_3,
    output                 [3:0]        pwr_dec_4,
    output                 [3:0]        pwr_dec_5,
    output                 [3:0]        pwr_dec_6,
    output                 [3:0]        pwr_dec_7,
    output                 [3:0]        pwr_dec_8,
    output                 [3:0]        pwr_dec_9,
    output                 [3:0]        pwr_dec_10,
    output                 [3:0]        pwr_dec_11,
    output                 [3:0]        pwr_dec_12,
    output                 [3:0]        pwr_dec_13,
    output                 [3:0]        pwr_dec_14,
    output                 [3:0]        pwr_dec_15,
    output                 [3:0]        pwr_dec_16

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

    
   new_power_dec   i_power_dec_0        (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_0),   .pwr_dec(pwr_dec_0)    );
   new_power_dec   i_power_dec_1        (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_1),   .pwr_dec(pwr_dec_1)    );
   new_power_dec   i_power_dec_2        (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_2),   .pwr_dec(pwr_dec_2)    );
   new_power_dec   i_power_dec_3        (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_3),   .pwr_dec(pwr_dec_3)    );
   new_power_dec   i_power_dec_4        (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_4),   .pwr_dec(pwr_dec_4)    );
   new_power_dec   i_power_dec_5        (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_5),   .pwr_dec(pwr_dec_5)    );
   new_power_dec   i_power_dec_6        (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_6),   .pwr_dec(pwr_dec_6)    );
   new_power_dec   i_power_dec_7        (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_7),   .pwr_dec(pwr_dec_7)    );
   new_power_dec   i_power_dec_8        (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_8),   .pwr_dec(pwr_dec_8)    );
   new_power_dec   i_power_dec_9        (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_9),   .pwr_dec(pwr_dec_9)    );
   new_power_dec   i_power_dec_10       (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_10),  .pwr_dec(pwr_dec_10)   );
   new_power_dec   i_power_dec_11       (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_11),  .pwr_dec(pwr_dec_11)   );
   new_power_dec   i_power_dec_12       (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_12),  .pwr_dec(pwr_dec_12)   );
   new_power_dec   i_power_dec_13       (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_13),  .pwr_dec(pwr_dec_13)   );
   new_power_dec   i_power_dec_14       (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_14),  .pwr_dec(pwr_dec_14)   );
   new_power_dec   i_power_dec_15       (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_15),  .pwr_dec(pwr_dec_15)   );
   new_power_dec   i_power_dec_16       (   .clk(clk),  .arstb(arstb),  .rstb(rstb),    .freeze(freeze),    .pwr(pwr_16),  .pwr_dec(pwr_dec_16)   );





endmodule











