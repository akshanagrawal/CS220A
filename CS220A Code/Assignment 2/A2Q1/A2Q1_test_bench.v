`include "question1.v"

module shift_counter_tb;

   reg [5:0] in;       
   wire out;
   //1 bit wire to indicate intermediate carry value 
   EightBit_CLA solver (in,login, out);
   always @ (x or y) begin
      #4;
      $display("Signal is %d for input n =%d",out,in);
   end
   initial begin
      in = 32; login=5;
      $display("Signal is %d for input n =%d",out,in);
      in = 31; login=5;
      $display("Signal is %d for input n =%d",out,in);
      in = 30; login=5;
      $display("Signal is %d for input n =%d",out,in);
      in = 29; login=5;
      $display("Signal is %d for input n =%d",out,in);
      in = 28; login=5;
      $display("Signal is %d for input n =%d",out,in);
      in = 16; login=4;
      $display("Signal is %d for input n =%d",out,in);
      in = 15; login=4;
      $display("Signal is %d for input n =%d",out,in);
      in = 8; login=3;
      $display("Signal is %d for input n =%d",out,in);
      in = 4; login=2;
      $display("Signal is %d for input n =%d",out,in);
      #5 $finish;       
   end

endmodule