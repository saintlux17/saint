`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/17 15:40:04
// Design Name: 
// Module Name: top_mac
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

module top_mac #(parameter N = 576, M = 144)(
    input clk,
    input rstn,
    input vld_i1,
    input vld_i2,
    input vld_i3,
    input vld_i4,
    input vld_i5,
    input vld_i6,
    input vld_i7,
    input vld_i8,
    input[8*N-1: 0] din,      // 576 input data
    input[16*N-1: 0] weight,  // 1152 weight
    output[7:0] sum1,         //partial sum from each module (3 x 3 x 16)
    output[7:0] sum2,
    output[7:0] sum3,
    output[7:0] sum4,
    output[7:0] sum5,
    output[7:0] sum6,
    output[7:0] sum7,
    output[7:0] sum8,
    output vld_o1,          //valid signal for each mac
    output vld_o2,
    output vld_o3,
    output vld_o4,
    output vld_o5,
    output vld_o6,
    output vld_o7,
    output vld_o8
    );


wire[16*M-1:0] mul_out1, mul_out2, mul_out3, mul_out4;
wire[16*M-1:0] mul_out5, mul_out6, mul_out7, mul_out8;

small_mac mac1(
    .clk(clk), 
    .in_1(din[(8*M-1) : 0]), 
    .in_2(weight[(8*M-1): 0]), 
    .in_3(weight[(16*M-1) -: 1152]), 
    .out1(mul_out1), 
    .out2(mul_out2));

small_mac mac2(
    .clk(clk), 
    .in_1(din[(16*M-1) -: 1152]), 
    .in_2(weight[(24*M-1) -: 1152]), 
    .in_3(weight[(32*M-1) -: 1152]), 
    .out1(mul_out3), 
    .out2(mul_out4));
    
small_mac mac3(
    .clk(clk), 
    .in_1(din[(24*M-1) -: 1152]), 
    .in_2(weight[(40*M-1) -: 1152]), 
    .in_3(weight[(48*M-1) -: 1152]), 
    .out1(mul_out5), 
    .out2(mul_out6));
    
 small_mac mac4(
    .clk(clk), 
    .in_1(din[(32*M-1) -: 1152]), 
    .in_2(weight[(56*M-1) -: 1152]), 
    .in_3(weight[(64*M-1) -: 1152]), 
    .out1(mul_out7), 
    .out2(mul_out8));

adder_new adder1(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i1),
    .din(mul_out1),
    .acc_o(sum1),
    .vld_o(vld_o1)
    );

adder_new adder2(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i2),
    .din(mul_out2),
    .acc_o(sum2),
    .vld_o(vld_o2)
    );

adder_new adder3(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i3),
    .din(mul_out3),
    .acc_o(sum3),
    .vld_o(vld_o3)
    );
    
adder_new adder4(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i4),
    .din(mul_out4),
    .acc_o(sum4),
    .vld_o(vld_o4)
    );
    
adder_new adder5(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i5),
    .din(mul_out5),
    .acc_o(sum5),
    .vld_o(vld_o5)
    );
    
adder_new adder6(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i6),
    .din(mul_out6),
    .acc_o(sum6),
    .vld_o(vld_o6)
    );

adder_new adder7(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i7),
    .din(mul_out7),
    .acc_o(sum7),
    .vld_o(vld_o7)
    );
    
adder_new adder8(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i8),
    .din(mul_out8),
    .acc_o(sum8),
    .vld_o(vld_o8)
    );   

endmodule