module fsm_using_always (
clock , // clock
reset , // Active high, syn reset
curr , // Request 0
next ,
opt // Request 1
);
input clock,reset;
input [2:0] curr;
output reg [2:0] next;
output reg [0:0] opt;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b011, S3 = 3'b010, S4 = 3'b110, S5 = 3'b111, S6 = 3'b101, S7 = 3'b100;
//-------------Internal Variables---------------------------
reg [2:0] state;// Seq part of the FSM
reg [2:0] next_state ;// combo part of FSM

//----------Code startes Here------------------------
always @ (state or curr)
begin : FSM_COMBO
next_state = 3'b000;
case(state)
S0 : next_state = S1;
S1 : next_state = S2;
S2 : next_state = S3;
S3 : next_state = S4;
S4 : next_state = S5;
S5 : next_state = S6;
S6 : next_state = S7;
S7 : next_state = S0;
default : next_state = curr;
endcase
end
//----------Seq Logic-----------------------------
always @ (posedge clock)
begin : FSM_SEQ
if (reset == 1'b1) begin
state <= #1 S0;
end else begin
state <= #1 next_state;
end
end
//----------Output Logic-----------------------------
always @ (posedge clock)
begin : OUTPUT_LOGIC
if (reset == 1'b1) begin
next <= #1 S0;
end
else begin
case(state)
S0 : begin
next <= #1 S0;
opt  <= #1 1;
end
S1 : begin
next <= #1 S1;
opt  <= #1 0;
end
S2 : begin
next <= #1 S2;
opt  <= #1 0;
end
S3 : begin
next <= #1 S3;
opt  <= #1 0;
end
S4 : begin
next <= #1 S4;
opt  <= #1 0;
end
S5 : begin
next <= #1 S5;
opt  <= #1 0;
end
S6 : begin
next <= #1 S6;
opt  <= #1 0;
end
S7 : begin
next <= #1 S7;
opt  <= #1 0;
end
default : begin
next = curr;
if(curr==S0) begin opt  <= #1 1; end
else begin opt  <= #1 0; end;
end
endcase
end
end // End Of Block OUTPUT_LOGIC
endmodule // End of Module arbiter