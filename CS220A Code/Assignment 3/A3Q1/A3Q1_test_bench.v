`include "A3Q1_sequence_1010.v"

//set the module of clock first for change at 5 time unit 
module clockfit(clk); 
	output reg clk=1'b1;
	initial begin
		repeat(15) begin 
			repeat(16) begin
				#5 clk=~clk;
			end
		end
	end
endmodule

// set the test bench for differnet 15 inputs each of 8 bits
module test_bench();
    reg reset;
	wire clk;	
	reg[7:0] sequence=8'd0; wire [7:0] otpt;
	clockfit clk_call(clk);
	sequence_1010 call1(otpt,sequence,reset,clk);
	
	initial begin
		#5 repeat(15) begin 
			#79 $display("%b ---> %b", sequence, otpt);
			reset=1; #1 reset=0; sequence=($urandom*$urandom)/64; 
		end
	end

endmodule

