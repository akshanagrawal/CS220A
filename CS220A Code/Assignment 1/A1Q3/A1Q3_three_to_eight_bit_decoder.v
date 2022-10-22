`include "A1Q3_two_to_four_bit_decoder.v"

module decoder_3_8(
    input [2:0] I,
    output [7:0] Q
);
not(nsel,I[2]); //nsel = ~I[2]
decoder_2_4 d1 (nsel, I[1:0], Q[3:0]); //enables when I[2]=0;
decoder_2_4 d2 (I[2], I[1:0], Q[7:4]); //enables when I[2]=1;
endmodule