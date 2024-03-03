`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:38:56 11/08/2022
// Design Name:   mips
// Module Name:   D:/CPU6/y.v
// Project Name:  CPU6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module y;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [31:0] INS;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
      #11
		reset=0;
		
		// Wait 100 ns for global reset to finish
		 
		
		// Add stimulus here

	end
    always#10 clk=!clk;  
endmodule

