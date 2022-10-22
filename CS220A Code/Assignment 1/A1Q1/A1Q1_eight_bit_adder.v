`include "A1Q1_one_bit_adder.v"

module eight_bit_full_adder (x, y, cin, sum, cout);
   //8 bit inputs x,y given 
   input [7:0] x,y;
   //carry in
   input cin;
   //carry out
   output cout;
   //8-bit sum
   output [7:0] sum;
   //intermediate carry
   wire [6:0] icarry;

   //instantiation of one bit full adder
   one_bit_adder full_adder_0 (x[0], y[0], cin, sum[0], icarry[0]);
   one_bit_adder full_adder_1 (x[1], y[1], icarry[0], sum[1], icarry[1]);
   one_bit_adder full_adder_2 (x[2], y[2], icarry[1], sum[2], icarry[2]);
   one_bit_adder full_adder_3 (x[3], y[3], icarry[2], sum[3], icarry[3]);
   one_bit_adder full_adder_4 (x[4], y[4], icarry[3], sum[4], icarry[4]);
   one_bit_adder full_adder_5 (x[5], y[5], icarry[4], sum[5], icarry[5]);
   one_bit_adder full_adder_6 (x[6], y[6], icarry[5], sum[6], icarry[6]);
   one_bit_adder full_adder_7 (x[7], y[7], icarry[6], sum[7], cout);

endmodule