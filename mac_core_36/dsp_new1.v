`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/09 15:21:14
// Design Name: 
// Module Name: mul_dsp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dsp_new(
input clk,
input[7:0] in_1,
input[7:0] in_2,
input[7:0] in_3,
output[15:0] out1,
output[15:0] out2
    );

wire[24:0] dsp_a;
wire[24:0] dsp_d;
wire[17:0] dsp_b;
wire[42:0] dsp_p;

assign dsp_in1 = in_1[7]? {17'b1_1111_1111_1111_1111, in_1} : {17'b0_0000_0000_0000_0000, in_1};
assign dsp_in2 = {in_2, 17'd0};
assign dsp_in3 = in_3[7]? {10'b11_1111_1111, in_3} : {10'b00_0000_0000, in_3};

dsp_macro_0 dsp(.CLK(clk),.A(dsp_in1), .B(dsp_in3), .D(dsp_in2),.P(dsp_p));

assign out1 = dsp_p[15:0];  //first filter output (3x3x128 as reference)
assign out2 = dsp_p[15]? (dsp_p[32:17] + 1'd1) : dsp_p[32:17];  //second filter output (3x3256 as reference) 

endmodule
