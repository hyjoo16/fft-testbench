//////////////////////////////////////////
//	Dflipflop				//
//	Author : KHLEE93			//
//	Update : 2020.12.27		//
//////////////////////////////////////////

`timescale 1ns/1fs
module dff(
	input	  wire	clk,	
    input     wire  arstb,	
    input     wire  rstb,	
    input	  wire  in,	

	output	  reg	dout	// Data output
	);




    always @(posedge clk or negedge arstb) begin
		if(!arstb) begin 
            dout <= 1'b0;
        end
        else if (!rstb) begin
            dout <= 1'b0;
        end
        else begin
            if(in == 1'b1) begin
				dout <=  1'b1 ;
		    end
            else begin
                dout <=  1'b0 ;
        	end
		end
    end
endmodule
