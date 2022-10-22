`include "A4Q2_eight_bit_adder_subtracter.v"

module testbench;

    reg signed [7:0] a,b;
    reg opcode;
    
    wire signed [7:0] sum;
    wire carry, overflow;

    eight_bit_adder_subtracter maincall(a, b, opcode, carry, sum, overflow);

    always @ (a or b or opcode)

    begin
       #0
       $display("Time = %d   ||||      a = %d, b = %d and opcode = %d results ----> output = %d, carry = %d, overflow = %b", $time, a, b, opcode, sum, carry, overflow);
       $display("            In binary, the above can be represented as a = %b, b = %b for opcode = %d results ----> output = %b, carry =%d, overflow = %b\n", a, b, opcode, sum, carry, overflow);
    end

    initial begin
       a = 3; b = 4; opcode = 1;
       #5
       a = 28; b = 127; opcode = 1;
       #5
       a = 127; b = 0; opcode= 0;
       #5
       a = 127; b = 127; opcode = 0;
       #5
       a = 127; b = 127; opcode = 1;
       #5
       a = 96; b = 36; opcode = 0;
       #5
       a = 65; b = 20; opcode = 1;
       #5
       a = 90; b = 50; opcode= 1;
       #5
       a = 49; b = 30; opcode = 0;
       #5
       a = 60; b = 13; opcode= 0;
       #5
       a = 0; b = 127; opcode= 1;
       #5
       a = 63; b = 127; opcode= 0;
       #5
       a = 4; b = 25; opcode= 0;
       #5
       a = 40; b = 87; opcode= 0;
       #5
       a = 40; b = 87; opcode= 1;
       # 7
       
       $finish;       
   end
endmodule