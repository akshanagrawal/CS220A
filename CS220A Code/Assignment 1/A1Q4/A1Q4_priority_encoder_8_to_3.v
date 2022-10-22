module priority_encoder_8_to_3(IP, OP);

input [7:0] IP;   //input
output [2:0] OP;   //output
// setting the conditions for encoding the input:
assign OP = IP[0] ? 3'b000 : IP[1] ? 3'b001 : IP[2] ? 3'b010 :
            IP[3] ? 3'b011 : IP[4] ? 3'b100 : IP[5] ? 3'b101 :
            IP[6] ? 3'b110 : IP[7] ? 3'b111 : 3'bxxx ;

endmodule