`include "A1Q4_priority_encoder_8_to_3.v"

module priority_encoder_test;

reg [7:0] IP_NUMBER;   // input number
wire [2:0] OP_NUMBER;  // output number

priority_encoder_8_to_3 encoder1(IP_NUMBER, OP_NUMBER);   // calling an instance of priority_encoder_8_to_3

always @(IP_NUMBER or OP_NUMBER) begin
    #0   // set accordingly if you wish to see the begin state before any legit input
    $display("TIME  =  %d :      INPUT NUMBER = %b     ---->      OUTPUT NUMBER = %b; ", $time, IP_NUMBER, OP_NUMBER);
end

initial
    begin
        #91 $finish;  // finish program execution  
    end
initial

begin // 18 input test cases each with 5 unit delay from previous state 
    #5  
    IP_NUMBER = 8'b00000001;
    #5
    IP_NUMBER = 8'b00000010;
    #5
    IP_NUMBER = 8'b00100100;
    #5
    IP_NUMBER = 8'b00001111;
    #5
    IP_NUMBER = 8'b00010000;
    #5
    IP_NUMBER = 8'b00100000;
    #5
    IP_NUMBER = 8'b01000000;
    #5
    IP_NUMBER = 8'b10000001;
    #5
    IP_NUMBER = 8'b10000000;
    #5
    IP_NUMBER = 8'b00000011;
    #5
    IP_NUMBER = 8'b10100100;
    #5
    IP_NUMBER = 8'b00000111;
    #5
    IP_NUMBER = 8'b00010100;
    #5
    IP_NUMBER = 8'b01000110;
    #5
    IP_NUMBER = 8'b11111111;
    #5
    IP_NUMBER = 8'b10010000;
    #5
    IP_NUMBER = 8'b00000000;
    #5
    IP_NUMBER = 8'b00111000;
end
endmodule