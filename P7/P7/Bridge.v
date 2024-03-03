`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:07:08 12/09/2022 
// Design Name: 
// Module Name:    Bridge 
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
`define LW 6'b100011
`define LH 6'b100001
`define LB 6'b100000
`define SW 6'b101011
`define SH 6'b101001
`define SB 6'b101000
`define AdEL 5'd4
`define AdES 5'd5
module Bridge(
//FOR CPU
    input 		[31:0]	Addr, 
	 input 		[31:0] 	CPUOutData,
	 input 		[3:0] 	CPUByteEn,
	 output  	[31:0] 	CPUInData,
//FOR DM
	 input 		[31:0] 	Dm_Data,
	 output 		[31:0]	Dm_WD,
    output 		[31:0] 	Dm_Addr,
	 output     [3:0] 	Dm_En,
//FOR TIME0
	 input 		[31:0] 	T0_Data,
	 input 					IRQ0,
	 output 		[31:0]	T0_WD,
    output 		[31:2] 	T0_Addr,
    output  			   T0_En,
//FOR TIME1
	 input  		[31:0] 	T1_Data,
	 input  					IRQ1,
	 output 		[31:0]	T1_WD,
    output 		[31:2] 	T1_Addr,
    output  			   T1_En,
//FOR
    output 		[31:0] 	m_int_addr,     // 中断发生器待写入地址
    output 	   [3 :0]   m_int_ByteEn,   // 中断发生器字节使能信号	
	 input 					interrupt,
//FORException 
    input [5:0] Type,
	 input [4:0] M_ExcCode,
	 output [4:0] M_ExcCodeFixed,
	 output [5:0] HWInt
    );
assign HWInt={3'b0,interrupt,IRQ1,IRQ0};
//LOAD
wire [31:0] RData;
wire [1:0] Addr10;
assign Addr10=Addr[1:0];
assign Load= (Type===`LW||Type===`LH||Type===`LB)?1'b1:1'b0;
assign Dm_LEn = (Addr >= 32'h0 && Addr <= 32'h2fff&&Load);
assign T0_LEn = (Addr >= 32'h7f00 && Addr <= 32'h7f0b && Load);
assign T1_LEn = (Addr >= 32'h7f10 && Addr <= 32'h7f1b && Load);
assign Int_LEn= (Addr >= 32'h7F20 && Addr <= 32'h7F23 && Load);

assign LoadEn= Dm_LEn||T0_LEn||T1_LEn||Int_LEn;
assign excAdEL=(Type===`LW&&Addr10 != 2'b00)||
					(Type===`LH&&Addr10[0] != 1'b0)||
					((Type===`LH||Type===`LB)&&(T0_LEn||T1_LEn))||
					(Load&&!LoadEn);
					
assign CPUInData = Dm_LEn? Dm_Data:
						 T0_LEn? T0_Data:
						 T1_LEn? T1_Data:
						 Int_LEn?32'b0:
									32'bx;												
//SAVE
assign Dm_WD=CPUOutData;
assign T0_WD=CPUOutData;
assign T1_WD=CPUOutData;
assign Dm_Addr=Addr[31:0];
assign T0_Addr=Addr[31:2];
assign T1_Addr=Addr[31:2];
assign Save  =  (Type===`SW||Type===`SH||Type===`SB)?1'b1:1'b0;
assign Dm_En =  (Addr >= 32'h0 && Addr <= 32'h2fff&&Save) ? CPUByteEn : 0;
assign T0_En =  (Addr >= 32'h7f00 && Addr <= 32'h7f0b && Save) ? 1 : 0;
assign T1_En =  (Addr >= 32'h7f10 && Addr <= 32'h7f1b && Save) ? 1 : 0;
assign Int_En=  (Addr >= 32'h7F20 && Addr <= 32'h7F23 && Save) ? 1 : 0;
assign SaveEn= Dm_En||T0_En||T1_En||Int_En;
assign T0_Count=(Addr === 32'h7f08&& Save) ? 1 : 0;
assign T1_Count=(Addr === 32'h7f18&& Save) ? 1 : 0;
assign Count=T1_Count||T0_Count;			  
assign excAdES=(Type===`SW&&Addr10 != 2'b00)||
					(Type===`SH&&Addr10[0] != 1'b0)||
					((Type===`SH||Type===`SB)&&(T0_En||T1_En))||
					(Type===`SW&&Count)||
 					(Save&&!SaveEn);
//fix ExcCode
assign M_ExcCodeFixed=excAdEL?`AdEL:
							 excAdES?`AdES:
												M_ExcCode;
assign m_int_addr=Addr[31:0];
assign m_int_ByteEn=Int_En?CPUByteEn:4'b0;
endmodule 


