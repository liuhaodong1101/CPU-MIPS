`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:21:37 11/15/2022
// Design Name:   DM
// Module Name:   C:/Users/Administrator.DESKTOP-E5KEEAC/Desktop/CPU/P4+LB+SB/d.v
// Project Name:  CPU5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module d;

	// Inputs
	reg clk;
	reg reset;
	reg lb_sel;
	reg sb_sel;
	reg swrr_sel;
	reg MemWrite;
	reg [31:0] Addr_DM;
	reg [31:0] Dm_in;
	reg [31:0] Pc;

	// Outputs
	wire [31:0] Dm_out;

	// Instantiate the Unit Under Test (UUT)
	DM uut (
		.clk(clk), 
		.reset(reset), 
		.lb_sel(lb_sel), 
		.sb_sel(sb_sel), 
		.swrr_sel(swrr_sel), 
		.MemWrite(MemWrite), 
		.Addr_DM(Addr_DM), 
		.Dm_in(Dm_in), 
		.Pc(Pc), 
		.Dm_out(Dm_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		lb_sel = 0;
		sb_sel = 0;
		swrr_sel = 0;
		MemWrite = 0;
		Addr_DM = 0;
		Dm_in = 0;
		Pc = 0;

		// Wait 100 ns for global reset to finish
		#100;
      swrr_sel=1;
		MemWrite=1;
		Addr_DM=3;
		Dm_in=32'hfabc1234;
		Pc=32'h00003000;
		// Add stimulus here

	end
   always #10 clk=~clk;  
endmodule

