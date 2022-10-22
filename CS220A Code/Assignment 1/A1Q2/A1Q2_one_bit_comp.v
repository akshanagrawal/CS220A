module one_bit_comp(A, B, L_prev, E_prev, G_prev, L, E, G);

    input A, B, L_prev, E_prev, G_prev;

    output L, E, G;

    // when L_prev = 1 OR when previous sets of bits were equal AND and current bit of A is smaller (which is 0) to that of B(which is 1) 
    assign L= (E_prev & (~A) & B) | L_prev ;

    // when E_prev = 1 AND currents set bits are equal
    assign E =  (~(A^B)) & E_prev;
    
    // when G_prev = 1 OR when previous were equal AND current bit of A is larger (which is 1) to that of B (which is 0)
    assign G = (E_prev & A & (~B)) | G_prev;
    
endmodule