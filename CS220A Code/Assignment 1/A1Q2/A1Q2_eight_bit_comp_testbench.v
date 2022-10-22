`include "A1Q2_eight_bit_comp.v"

module eight_bit_comp_testbench;

    reg [7:0] A, B;
    wire L, E, G;

    eight_bit_comp comp(A, B, L, E, G);

    always @(A or B) begin
        #0 
        $display("Time = %d  :  For Input A = %d and B = %d -- which in binary is -- A = %b and B = %b results ----> L = %d, E = %d, G = %d\n", $time, A, B, A, B, L, E, G);
    end

    initial begin
        #71 $finish;  // finish program execution  
    end

    initial begin    //fifteen different inputs with 5 time unit delay gap 
        A = 15; B = 55;
        #5
        A = 15; B = 15;
        #5
        A = 255; B = 255;
        #5
        A = 0; B = 1;
        #5
        A = 0; B = 0;
        #5
        A = 1; B = 0; 
        #5
        A = 100; B = 20;
        #5
        A = 20; B = 100;
        #5
        A = 5; B = 50;
        #5
        A = 100; B = 100;
        #5
        A = 255; B = 0;
        #5
        A = 1; B = 255;
        #5
        A = 150; B = 200;
        #5
        A = 20; B = 0;
        #5
        A = 200; B = 255;
    end
endmodule