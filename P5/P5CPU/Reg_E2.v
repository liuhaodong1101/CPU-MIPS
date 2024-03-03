`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:35:43 11/08/2022 
// Design Name: 
// Module Name:    Reg_E2 
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
module Reg_E2(
    input reset,
	 input stall,
    input clk,
    input  RegWriteD,
    input  MemtoRegD,
    input [1:0] ALUcontrolD,
    input ALUsrcD,
    input RegDstD,
    output reg RegWriteE,
    output reg MemtoRegE,
    output reg[1:0] ALUcontrolE,
    output reg ALUsrcE,
    output reg RegDstE
    );
always@(posedge clk) begin
if(reset==1||stall==1) begin
RegWriteE<=0;
MemtoRegE<=0;
ALUcontrolE<=0;
ALUsrcE<=0;
RegDstE<=0;
end
else begin
RegWriteE<=RegWriteD;
MemtoRegE<=MemtoRegD;
ALUcontrolE<=ALUcontrolD;
ALUsrcE<=ALUsrcD;
RegDstE<=RegDstD;
end

end

endmodule 