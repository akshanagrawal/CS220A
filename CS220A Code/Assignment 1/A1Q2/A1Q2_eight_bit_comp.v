`include "A1Q2_one_bit_comp.v"

module eight_bit_comp(A, B, L, E, G);

    input [7:0] A, B;  // two non-negative numbers belonging to [0,255]

    output L, E, G;    // will conatin the final output
    
    wire [6:0] L_prev, E_prev, G_prev;

    // start comparison from most significant bit and then proceed to least significant ones in order

    one_bit_comp call1 (A[7], B[7], 1'b0, 1'b1, 1'b0, L_prev[0], E_prev[0], G_prev[0]);

    one_bit_comp call2 (A[6], B[6], L_prev[0], E_prev[0], G_prev[0], L_prev[1], E_prev[1], G_prev[1]);

    one_bit_comp call3 (A[5], B[5], L_prev[1], E_prev[1], G_prev[1], L_prev[2], E_prev[2], G_prev[2]);

    one_bit_comp call4 (A[4], B[4], L_prev[2], E_prev[2], G_prev[2], L_prev[3], E_prev[3], G_prev[3]);

    one_bit_comp call5 (A[3], B[3], L_prev[3], E_prev[3], G_prev[3], L_prev[4], E_prev[4], G_prev[4]);

    one_bit_comp call6 (A[2], B[2], L_prev[4], E_prev[4], G_prev[4], L_prev[5], E_prev[5], G_prev[5]);

    one_bit_comp call7 (A[1], B[1], L_prev[5], E_prev[5], G_prev[5], L_prev[6], E_prev[6], G_prev[6]);

    one_bit_comp call8 (A[0], B[0], L_prev[6], E_prev[6], G_prev[6], L, E, G);

endmodule