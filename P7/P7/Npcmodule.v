`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:32 11/08/2022 
// Design Name: 
// Module Name:    Npcmodule 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Npcmodule(
    input [31:0] PcF,
	 input [31:0] PcD,
    input [31:0] InstrD,
    input [31:0] Radata,
    input [2:0] NPcop,
	 input D_eret,
	 input Req,
	 input [31:0] EPC,
	 input Zero,
    output reg [31:0] NPc
    );
wire [31:0] imm2;
assign imm2={{16{InstrD[15]}},InstrD[15:0]};
wire [31:0] imm3;
assign imm3=imm2<<2;
wire [31:0] Jal_pc;
assign Jal_pc={PcF[31:28],InstrD[25:0],2'b00};
always@(*) begin
case(NPcop)
3'd0: NPc=PcF+4;
3'd1: begin 
        if(Zero==1) NPc=PcD+4+imm3;
        else NPc=PcF+4;
      end
3'd2: NPc=Jal_pc;
3'd3: NPc=Radata;
3'd4: begin 
        if(Zero==0) NPc=PcD+4+imm3;
        else NPc=PcF+4;
      end
endcase
if(Req) NPc=32'h4180;
else if(D_eret) NPc=EPC+4;
end
endmodule
