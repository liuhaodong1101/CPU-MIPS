`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:15:10 10/28/2022 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input clk,reset,lb_sel,sb_sel,
	 input MemWrite,
    input [31:0] Addr_DM,Dm_in,Pc,
    output [31:0] Dm_out
 );
integer n;
integer i;
reg [31:0] data_memory[3071:0];
wire [1:0] ByteAddr;
wire [7:0] Byte;
wire [31:0] Lw_out,Lb_out;

initial
begin
    for(n=0;n<=3071;n=n+1)
    data_memory[n] <= 0;
end


always @(posedge clk) 
begin
  if(reset==1) 
  begin
    for(i=0;i<=3071;i=i+1) data_memory[i] <= 32'b0;
  end
  else if(MemWrite == 1)
    begin
	   if(sb_sel==0)begin
	      $display("@%h: *%h <= %h", Pc, Addr_DM, Dm_in);//save word
         data_memory[Addr_DM[31:2]] <= Dm_in;
		end
		else begin
		   $display("@%h: *%h <== %h", Pc, Addr_DM, Dm_in[7:0]);//save byte
		   case(ByteAddr)
			0: data_memory[Addr_DM[31:2]][7:0] <= Dm_in[7:0];
			1: data_memory[Addr_DM[31:2]][15:8] <= Dm_in[7:0];
			2: data_memory[Addr_DM[31:2]][23:16] <= Dm_in[7:0];
		   3: data_memory[Addr_DM[31:2]][31:24] <= Dm_in[7:0];
			endcase 
		end
    end
end

assign ByteAddr=Addr_DM[1:0];
assign Lw_out=data_memory[Addr_DM[31:2]];//load word
assign Byte=(ByteAddr==0)? Lw_out[7:0]:
            (ByteAddr==1)? Lw_out[15:8]:
				(ByteAddr==2)? Lw_out[23:16]:
				               Lw_out[31:24];
									
assign Lb_out=(Byte[7]==1)?{{24{1'b1}},Byte}:{24'b0,Byte}; //load byte
assign Dm_out=(lb_sel==1)?Lb_out:Lw_out;

endmodule
