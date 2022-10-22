`include "A1Q1_eight_bit_adder.v"

module eight_bit_adder_tb;

   //8 bit x,y
   reg [7:0] x,y;
   //8 bit sum        
   wire [7:0] sum;
   //1 bit wire to indicate intermediate carry value 
   wire carry;
   //reg for carry in
   reg cin;               
   eight_bit_full_adder EightBit_FA (x, y, cin,sum,carry);
   always @ (x or y) begin
      #4;
      $display("%d + %d + %d = %d, carry out= %d", x, y, cin, sum, carry);
   end
   initial begin
      x = 1; y = 0; cin = 1;
      $display("time = %0d, output for input 1 as follows:",$time);
      #5 x = 2; y = 144; cin = 1;
      $display("time = %0d, output for input 2 as follows:",$time);
      #5 x = 2; y = 5; cin = 1;
      $display("time = %0d, output for input 3 as follows:",$time);
      #5 x = 12; y = 81; cin = 0;
      $display("time = %0d, output for input 4 as follows:",$time);
      #5 x = 196; y = 240; cin = 1;
      $display("time = %0d, output for input 5 as follows:",$time);
      #5 x = 141; y = 120; cin = 1;
      $display("time = %0d, output for input 6 as follows:",$time);
      #5 x = 149; y = 101; cin = 0;
      $display("time = %0d, output for input 7 as follows:",$time);
      #5 x = 64; y = 18; cin = 1;
      $display("time = %0d, output for input 8 as follows:",$time);
      #5 x = 255; y = 254; cin = 1;
      $display("time = %0d, output for input 9 as follows:",$time);
      #5 x = 170; y = 25; cin = 0;
      $display("time = %0d, output for input 10 as follows:",$time);
      #5 x = 238; y = 17; cin = 0;
      $display("time = %0d, output for input 11 as follows:",$time);
      #5 x = 14; y= 110; cin = 1;
      $display("time = %0d, output for input 12 as follows:",$time);
      #5 x = 61; y = 180; cin = 1;
      $display("time = %0d, output for input 13 as follows:",$time);
      #5 x = 0; y = 0; cin = 0;
      $display("time = %0d, output for input 14 as follows:",$time);
      #5 x = 231; y = 19; cin = 1;
      $display("time = %0d, output for input 15 as follows:",$time);
      #5 $finish;       
   end

endmodule