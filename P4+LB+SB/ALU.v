`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:51 10/28/2022 
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
    input [2:0] ALUControl,
    output Zero,
    output reg [31:0] ALUResult
    );

assign Zero=(S1==S2)?1'b1:1'b0;

always@(*) begin
  case(ALUControl)
  3'd0:
  ALUResult = S1|S2;
  3'd1:
  ALUResult = {S2[15:0],16'b0};
  3'd2: 
  ALUResult = S1+S2;
  3'd3:
  ALUResult = S1-S2;
  3'd4:begin

  end
  default: ;
  endcase
end

endmodule 
