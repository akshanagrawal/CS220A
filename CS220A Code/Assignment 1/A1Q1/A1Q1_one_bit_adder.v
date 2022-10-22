
module one_bit_adder (x, y, cin, sum, cout);
   input x,y,cin;
   output sum,cout;
   //one bit sum operation
   assign sum = x^y^cin;
   //one bit carry operation
   assign cout = ((x & y)|(x & cin)|(y & cin));

endmodule