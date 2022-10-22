module decoder_2_4(
    input wire enable,
    input [1:0] I,
    output [3:0] Q
);
    //Assigning value to the ouput at gate level logic of 2-to-4 bit decoder
    assign Q[0] = (~I[1]) & (~I[0]) & enable;
    assign Q[1] = (~I[1]) & I[0] & enable;
    assign Q[2] = I[1] & (~I[0]) & enable;
    assign Q[3] = I[1] & I[0] & enable; 

endmodule