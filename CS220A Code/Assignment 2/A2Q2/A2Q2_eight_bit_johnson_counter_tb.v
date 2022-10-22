`include "A2Q2_eight_bit_johnson_counter.v"

module johnson_test;
reg rstn, clk; 
wire [7:0] Q;

johnson_8_bit J1 (rstn, clk, Q);

always #5 clk = ~clk; // The clock with five time unit interval
// The state of counter will change everytime clk goes from 0 to 1
initial
begin
clk=0;
rstn = 0;
$monitor("Time = %g", $time, ,"Clock = %b",clk, , ,"Reset = %b",rstn, , ,"Output = %b",Q); //We monitor every change in state
#10 rstn =1;
end

initial #172 $finish;

endmodule