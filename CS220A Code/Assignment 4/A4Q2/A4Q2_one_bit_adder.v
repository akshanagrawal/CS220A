module one_bit_adder(a, b, cin, opcode, carry, sum);

    input a, b, cin; // two input numbers a and b and cin
    input opcode;    // 0 for addition, 1 for subtraction  
    output carry, sum;  // two outputs carry and sum

    assign b_bar = b^opcode; // to decide addition or subtraction

    assign sum = a^b_bar^cin; // stores the sum

    assign carry = (a & b_bar) | (a & cin) | (b_bar & cin);  // carry is 1 under any of three conditions: if a=1 and b_bar =1; or if  a=1 and cin=1; or b_bar=1 and cin =1

endmodule