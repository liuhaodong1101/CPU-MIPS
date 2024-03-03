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
    input  RegWriteEnableD,
    input  MemtoRegD,
    input  MemWriteD,
    input [2:0] ALUcontrolD,
    input ALUsrcD,
    input RegDstD,
    output reg RegWriteEnableE,
    output reg MemtoRegE,
    output reg MemWriteE,
    output reg[2:0] ALUcontrolE,
    output reg ALUsrcE,
    output reg RegDstE
    );
always@(posedge clk) begin
if(reset==1||stall==1) begin
RegWriteEnableE<=0;
MemtoRegE<=0;
MemWriteE<=0;
ALUcontrolE<=0;
ALUsrcE<=0;
RegDstE<=0;
end
else begin
RegWriteEnableE<=RegWriteEnableD;
MemtoRegE<=MemtoRegD;
MemWriteE<=MemWriteD;
ALUcontrolE<=ALUcontrolD;
ALUsrcE<=ALUsrcD;
RegDstE<=RegDstD;
end

end

endmodule 