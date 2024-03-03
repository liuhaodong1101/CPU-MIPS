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
    input [2:0] ALUControl,
    output reg [31:0] ALUResult
    );
wire [32:0]TEMP1;
wire [32:0]TEMP2;
assign TEMP1={1'b0,S1};
assign TEMP2={1'b0,S2};
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
  3'd4:
  ALUResult = S1&S2;
  3'd5:
  ALUResult = ($signed(S1)<$signed(S2))?32'b1:32'b0;
  3'd6:
  ALUResult = (TEMP1<TEMP2)?32'b1:32'b0;
  3'd7:
  ALUResult = 0;
  endcase
end

endmodule 