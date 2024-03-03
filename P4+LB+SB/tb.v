`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:58:47 11/15/2022
// Design Name:   Npcmodule
// Module Name:   C:/Users/Administrator.DESKTOP-E5KEEAC/Desktop/CPU/P4+LB+SB/tb.v
// Project Name:  CPU5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Npcmodule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg Zero;
	reg [2:0] Npc_op;
	reg [31:0] Pc;
	reg [31:0] instruction;
	reg [31:0] Radata;
	reg [31:0] bsoal_data;

	// Outputs
	wire [31:0] PcAddr4;
	wire [31:0] Npc;

	// Instantiate the Unit Under Test (UUT)
	Npcmodule uut (
		.Zero(Zero), 
		.Npc_op(Npc_op), 
		.Pc(Pc), 
		.instruction(instruction), 
		.Radata(Radata), 
		.bsoal_data(bsoal_data), 
		.PcAddr4(PcAddr4), 
		.Npc(Npc)
	);

	initial begin
		// Initialize Inputs
		Zero = 0;
		Npc_op = 0;
		Pc = 0;
		instruction = 0;
		Radata = 0;
		bsoal_data = 0;
      
		// Wait 100 ns for global reset to finish
		#100;
      Npc_op=4;
		Pc=32'h00003000;
		instruction=32'hffffaaaa;
		bsoal_data=32'h1;
		// Add stimulus here

	end
      
endmodule

