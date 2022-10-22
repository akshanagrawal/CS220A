module johnson_8_bit(
    input rstn, 
    input clk,
    output reg [7:0] Q
);
// we take clock and reset as input, and register Q will store the current count
always @(posedge clk or negedge rstn) // Q changes on every positive edge of clock and resets on negative edge of custom reset 
    if(rstn)
        Q <= {{Q[6:0]},{~Q[7]}};
    else
        Q <= 0;
endmodule