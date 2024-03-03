`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:55 12/09/2022 
// Design Name: 
// Module Name:    CP0 
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
`define IM SR[15:10]//分别对应六个外部中断，相应位置 1 表示允许中断，置 0 表示禁止中断。这是一个被动的功能，只能通过 mtc0 这个指令修改，通过修改这个功能域，我们可以屏蔽一些中断。
`define EXL SR[1]//任何异常发生时置位，这会强制进入核心态（也就是进入异常处理程序）并禁止中断。
`define IE SR[0]//全局中断使能，该位置 1 表示允许中断，置 0 表示禁止中断。
`define BD Cause[31]//当该位置 1 的时候，EPC 指向当前指令的前一条指令（一定为跳转），否则指向当前指令。
`define IP Cause[15:10]//为 6 位待决的中断位，分别对应 6 个外部中断，相应位置 1 表示有中断，置 0 表示无中断，将会每个周期被修改一次，修改的内容来自计时器和外部中断。
`define ExcCode Cause[6:2]//异常编码，记录当前发生的是什么异常。
`define SRNum 12
`define CauseNum 13
`define EPCNum 14
module CP0(
   output CU0,
	output EXLL,
	input clk,
	input reset,
	input en,//写使能，只能写SR和EPC
	input BDIn,//判断是不是延迟槽指令
	input EXLClr,//用来复位 EXL
	input [4:0] CP0Add,//读寄存器，可以读出SR,Cause，EPC
	input [31:0] CP0In,//CP0 写入数据，mtC0使用，不能写入Cause
	input [31:0] VPC,//受害 PC
	input [4:0] ExcCodeIn,//记录异常类型
	input [5:0] HWInt,//输入中断信号
	output [31:0] EPCOut,//EPC 的值
	output [31:0] CP0Out,//CP0 读出数据
	output Req//进入中断处理程序请求
	
    );
reg [31:0] SR,Cause;
assign CU0=SR[28];
reg [31:0] EPC;//记录异常处理结束后需要返回的 PC。
wire InReq = ((HWInt&`IM)!=6'b0)&&(`EXL==0)&&(`IE==1);//外部中断
wire ExcReq = (ExcCodeIn!=5'b0)?1'b1:1'b0;//内部异常
//判断是否中断
assign Req= ExcReq||InReq;
//字对齐
assign EPCOut=EPC;
//mfC0
assign CP0Out= (CP0Add==`SRNum)? 			SR:
					(CP0Add==`CauseNum)?		Cause:
					(CP0Add==`EPCNum)?	     EPC:
													32'bx;
//for SR					
always@(posedge clk)begin
	if(reset) begin 
	SR<=32'h1000_0000;
	end
	else begin
	  if(EXLClr) `EXL<=1'b0;
	  if(Req) `EXL<=1'b1;
	  else if(en&&CP0Add==`SRNum) SR<=CP0In;
	end
end					
//for Cause
always@(posedge clk)begin
	if(reset) Cause<=0;
	else begin
	   `IP<=HWInt;
		if(Req) begin
				`ExcCode<=(InReq)?5'b0:ExcCodeIn;
				`BD<=BDIn;
			end
	end
end
//for EPC
always@(posedge clk)begin
	if(reset) EPC<=0;
	else if(Req)begin
		if(BDIn) EPC<=VPC-32'b100;
		else EPC<=VPC;
	end
	else if(en&&CP0Add==`EPCNum) begin
		EPC<=CP0In;
	end
	
end
assign EXLL=`EXL;
endmodule
