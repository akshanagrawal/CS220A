`include "A4Q2_one_bit_adder.v"
module eight_bit_adder_subtracter(a, b, opcode, carry, sum, overflow);

    input [7:0] a, b;  // input for adding/subtracting 8-bit numbers
    input opcode;      // c0 or cin and 0 fro adding and 1 for subtracting

    wire [7:0] carry_intermediate;   // stores carry out at each step which will be carry in for next step

    output [7:0] sum; // sum will be 8-bit output
    output carry, overflow; //to store any carry out or overflow

    //C0 or Cin or opcode is same entity at initial step
    assign carry_intermediate[0] = opcode;
    // now eight calls of one-bit adder for adding/subtracting 8-bit numbers
    one_bit_adder call0(a[0], b[0], carry_intermediate[0], opcode, carry_intermediate[1], sum[0]);
    one_bit_adder call1(a[1], b[1], carry_intermediate[1], opcode, carry_intermediate[2], sum[1]);
    one_bit_adder call2(a[2], b[2], carry_intermediate[2], opcode, carry_intermediate[3], sum[2]);
    one_bit_adder call3(a[3], b[3], carry_intermediate[3], opcode, carry_intermediate[4], sum[3]);
    one_bit_adder call4(a[4], b[4], carry_intermediate[4], opcode, carry_intermediate[5], sum[4]);
    one_bit_adder call5(a[5], b[5], carry_intermediate[5], opcode, carry_intermediate[6], sum[5]);
    one_bit_adder call6(a[6], b[6], carry_intermediate[6], opcode, carry_intermediate[7], sum[6]);
    one_bit_adder call7(a[7], b[7], carry_intermediate[7], opcode, carry, sum[7]);

    //overflow=1  when carry and carry_intermediate[7] are different
    assign overflow = carry^carry_intermediate[7];

endmodule