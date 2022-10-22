`include "A4Q1_gray_code_counter.v"
module fsm_using_always_tb;
// Inputs
reg clock,reset;
reg [2:0] inp;
wire [2:0] count;
// Outputs
wire [0:0] opt; // will be high only when transitioning from S7-->S0
// Instantiate the Unit Under Test (UUT)
fsm_using_always m1(clock,reset,inp,count,opt);
always #1 clock=~clock;
initial
begin
$display("Time  \t State   \t  Output");
clock=1;
#10;
reset=1'b0;
inp=3'b111; // can be given any valid input in gray encoding to start with
#1 $monitor("%g \t\t %b \t\t %b" ,$time, count, opt);

#100 $finish;
end
endmodule