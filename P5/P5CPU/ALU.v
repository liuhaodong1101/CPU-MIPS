`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:13 11/08/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] S1,
    input [31:0] S2,
    input [1:0] ALUControl,
    output reg [31:0] ALUResult
    );
always@(*) begin
  case(ALUControl)
  2'b00:
  ALUResult = S1|S2;
  2'b01:
  ALUResult = {S2[15:0],16'b0};
  2'b10: 
  ALUResult = S1+S2;
  2'b11:
  ALUResult = S1-S2;
  endcase
end

endmodule 