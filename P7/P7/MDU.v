`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:08:59 11/19/2022 
// Design Name: 
// Module Name:    MDU 
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
`define nop 4'd0
`define mult 4'd1
`define multu 4'd2
`define div 4'd3
`define divu 4'd4
`define mfhi 4'd5
`define mflo 4'd6
`define mthi 4'd7
`define mtlo 4'd8
module MDU(
    input clk,
	 input reset,
	 input [3:0] MDUOpD,
	 input [3:0] MDUOp,
	 input [31:0] Data1,
	 input [31:0] Data2,
	 output [31:0] out,
	 output stall_mdu,
	 input Req
    );
wire start;
reg busy;
reg [31:0] HI_temp;
reg [31:0] LO_temp;
reg [31:0] HI;
reg [31:0] LO;
reg [6:0] count;
reg [6:0] max;
assign start=(MDUOp==`mult||MDUOp==`multu||MDUOp==`div||MDUOp==`divu)? 1'b1:1'b0;
assign out = (MDUOp == `mfhi) ? HI : 
             (MDUOp == `mflo) ? LO :32'b0;
assign stall_mdu=((busy||start)&&(MDUOpD!=`nop))?1'b1:1'b0;				 
always@(posedge clk) begin
  if(reset)begin
    HI<=0;
    LO<=0;
    HI_temp<=0;
    LO_temp<=0;
    count<=0;
	 busy<=0;	 
  end
  else
  begin
      if(start&&!Req)begin
			busy<=1;
		end
		if(busy==0&&!Req)begin
			case(MDUOp)
			`mthi: HI <= Data1;  
			`mtlo: LO <= Data1;
			`mult: begin 
				{HI_temp, LO_temp} <= $signed(Data1) * $signed(Data2);
				max <= 5;
			end
			`multu: begin 
				{HI_temp, LO_temp} <= Data1 * Data2;
				max <= 5;
			end
			`div: begin 
				if(Data2!=0) {HI_temp, LO_temp} <= {$signed(Data1) % $signed(Data2), $signed(Data1) / $signed(Data2)};
				else {HI_temp, LO_temp} <= 64'b0;
				
				max <= 10;
			end
			`divu: begin 
				if(Data2!=0) {HI_temp, LO_temp} <= {{Data1 % Data2,Data1 /Data2}};
				else  {HI_temp, LO_temp} <= 64'b0;

				max <= 10;
			end
			endcase
		end
		else if(busy) begin
			if(count==max-1) begin
						count<=0;
						busy<=0;	
						{HI, LO} <= {HI_temp, LO_temp};		 
				end
				else begin
						count<=count+1;
						{HI, LO} <= {HI, LO};
				end
		end
  end
  
end
endmodule
