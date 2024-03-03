`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:43:51 11/15/2022
// Design Name:   ALU
// Module Name:   C:/Users/Administrator.DESKTOP-E5KEEAC/Desktop/CPU/P4+LB+SB/te.v
// Project Name:  CPU5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module te;

	// Inputs
	reg [31:0] S1;
	reg [31:0] S2;
	reg [2:0] ALUControl;

	// Outputs
	wire Zero;
	wire [31:0] ALUResult;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.S1(S1), 
		.S2(S2), 
		.ALUControl(ALUControl), 
		.Zero(Zero), 
		.ALUResult(ALUResult)
	);

	initial begin
		// Initialize Inputs
		S1 = 0;
		S2 = 0;
		ALUControl = 0;

		// Wait 100 ns for global reset to finish
		#100;
      S1=32'hfff1234;
      S2=32'hfff4321;
      ALUControl=3'd4;		
		// Add stimulus here

	end
      
endmodule

