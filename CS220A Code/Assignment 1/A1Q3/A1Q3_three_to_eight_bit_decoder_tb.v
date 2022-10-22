`include "A1Q3_three_to_eight_bit_decoder.v"
`timescale 1 ns/1 ps

module decoder_3_8_tb;

    reg [2:0] I; //3 bit input
    wire [7:0] Q;//8 bit output

    decoder_3_8 UUT (I, Q); //3 to 8 bit decoder instantiation
    
    always begin //all possible inputs to a 3 to 8 bit decoder at 5 time unit delay
            I = 3'b000;
        #5  I = 3'b001;
        #5  I = 3'b010;
        #5  I = 3'b011;
        #5  I = 3'b100;
        #5  I = 3'b101;
        #5  I = 3'b110;
        #5  I = 3'b111;
        #5 $finish;
        end
        
        initial begin
        $display("Time \t Input \t Output");    
        $monitor("%g \t %b \t %b" ,$time, I, Q); //displays the output everytime input is changed
        #100 $finish;
        end
endmodule