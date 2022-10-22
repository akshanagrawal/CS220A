//sequnce detector 1010 main code
module sequence_1010(otpt,sequence,reset,clk);

	input [7:0] sequence;
	input reset, clk;
  output reg [7:0] otpt=8'd0;
	wire t; wire[2:0] wir;
	reg j=0; integer cnt=7; // for 8 bits input
	one_bit calling1(t,wir,j, clk,reset);

	always @(negedge clk) begin
		j=sequence[cnt];
		#1 otpt[cnt]=t;
		cnt=cnt-1;
		if(cnt==-1) begin
		  cnt=7; // since it's of only 8 bits input each
		end
	end
endmodule

// involving d-flip flops
module dff(q,d,clk,reset);
    output reg q=1'b0;
    input reset;
    always@(reset) begin
        q=0;
    end

    input d,clk;
        always @(posedge clk) begin
            q=d;
        end
endmodule

// taking one bit at a time
module one_bit(out,t,inpt,clk,reset);
  output out;
  input inpt, clk, reset;
  output wire[2:0] t; 
  // 1st call
  dff d1(t[0],inpt,clk,reset); 
  // 2nd call
  dff d2(t[1],t[0],clk,reset);
  // 3rd call
  dff d3(t[2],t[1],clk,reset);
  assign out = ~inpt & (t[0]) &t[2]& (~t[1]);
endmodule


