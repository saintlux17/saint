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

module top_mac #(parameter N = 720, M = 36)(
    input clk,
    input rstn,
    input vld_i1, //20 filters 
    input vld_i2,
    input vld_i3,
    input vld_i4,
    input vld_i5,
    input vld_i6,
    input vld_i7,
    input vld_i8,
    input vld_i9,
    input vld_i11,
    input vld_i12,
    input vld_i13,
    input vld_i14,
    input vld_i15,
    input vld_i16,
    input vld_i17,
    input vld_i18,
    input vld_i19,
    input vld_i20,
    input[8*N-1: 0] din,      // 720*8bit input data
    input[16*N-1: 0] weight,  // (720*8bit)*2 weight
    output[:0] sum1,         //partial sum from each module (3 x 3 x 16)
    output[21:0] sum2,
    output[21:0] sum3,
    output[21:0] sum4,
    output[21:0] sum5,
    output[21:0] sum6,
    output[21:0] sum7,
    output[21:0] sum8,
    output[21:0] sum9,
    output[21:0] sum10,
    output[21:0] sum11,
    output[21:0] sum12,
    output[21:0] sum13,
    output[21:0] sum14,
    output[21:0] sum15,
    output vld_o1,          //valid signal for each mac
    output vld_o2,
    output vld_o3,
    output vld_o4,
    output vld_o5,
    output vld_o6,
    output vld_o7,
    output vld_o8,
    output vld_o9,
    output vld_o10,
    output vld_o11,
    output vld_o12,
    output vld_o13,
    output vld_o14,
    output vld_o15,
    output vld_o16,
    output vld_o17,
    output vld_o18,
    output vld_o19,
    output vld_o20,
    );


wire[16*M-1:0] mul_out1, mul_out2, mul_out3, mul_out4;
wire[16*M-1:0] mul_out5, mul_out6, mul_out7, mul_out8;
wire[16*M-1:0] mul_out9, mul_out10, mul_out11, mul_out12;
wire[16*M-1:0] mul_out13, mul_out14, mul_out15, mul_out16;
wire[16*M-1:0] mul_out17, mul_out18, mul_out19, mul_out20;

localparam mul_1_param = 8*M-1;
localparam mul_2_param = 16*M-1;
localparam mul_3_param = 24*M-1;
localparam mul_4_param = 32*M-1;
localparam mul_5_param = 40*M-1;
localparam mul_6_param = 48*M-1;
localparam mul_7_param = 56*M-1;
localparam mul_8_param = 64*M-1;
localparam mul_9_param = 72*M-1;
localparam mul_10_param = 80*M-1;
localparam mul_11_param = 88*M-1;
localparam mul_12_param = 96*M-1;
localparam mul_13_param = 104*M-1;
localparam mul_14_param = 112*M-1;
localparam mul_15_param = 120*M-1;
localparam mul_16_param = 128*M-1;
localparam mul_17_param = 136*M-1;
localparam mul_18_param = 144*M-1;
localparam mul_19_param = 152*M-1;
localparam mul_20_param = 160*M-1;
localparam mul_21_param = 168*M-1;
localparam mul_22_param = 176*M-1;
localparam mul_23_param = 184*M-1;
localparam mul_24_param = 192*M-1;
localparam mul_25_param = 200*M-1;
localparam mul_26_param = 208*M-1;
localparam mul_27_param = 216*M-1;
localparam mul_28_param = 224*M-1;
localparam mul_29_param = 232*M-1;
localparam mul_30_param = 240*M-1;
localparam mul_31_param = 248*M-1;
localparam mul_32_param = 256*M-1;
localparam mul_33_param = 264*M-1;
localparam mul_34_param = 272*M-1;
localparam mul_35_param = 280*M-1;
localparam mul_36_param = 288*M-1;
localparam mul_37_param = 296*M-1;
localparam mul_38_param = 304*M-1;
localparam mul_39_param = 312*M-1;
localparam mul_40_param = 320*M-1;


//multiplier

mul_36 mul_1(
    .clk(clk), 
    .in_1(din[mul_1_param : 0]), 
    .in_2(weight[mul_1_param: 0]), 
    .in_3(weight[mul_2_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_2(
    .clk(clk), 
    .in_1(din[mul_2_param -: 288]), 
    .in_2(weight[mul_3_param -: 288]), 
    .in_3(weight[mul_4_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));


mul_36 mul_3(
    .clk(clk), 
    .in_1(din[mul_3_param -: 288]), 
    .in_2(weight[mul_5_param -: 288]), 
    .in_3(weight[mul_6_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_4(
    .clk(clk), 
    .in_1(din[mul_4_param -: 288]), 
    .in_2(weight[mul_7_param -: 288]), 
    .in_3(weight[mul_8_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_5(
    .clk(clk), 
    .in_1(din[mul_5_param -: 288]), 
    .in_2(weight[mul_9_param -: 288]), 
    .in_3(weight[mul_10_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));


mul_36 mul_6(
    .clk(clk), 
    .in_1(din[mul_6_param -: 288]), 
    .in_2(weight[mul_11_param -: 288]), 
    .in_3(weight[mul_12_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_7(
    .clk(clk), 
    .in_1(din[mul_7_param -: 288]), 
    .in_2(weight[mul_13_param -: 288]), 
    .in_3(weight[mul_14_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_8(
    .clk(clk), 
    .in_1(din[mul_8_param -: 288]), 
    .in_2(weight[mul_15_param -: 288]), 
    .in_3(weight[mul_16_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));


mul_36 mul_9(
    .clk(clk), 
    .in_1(din[mul_9_param -: 288]), 
    .in_2(weight[mul_17_param -: 288]), 
    .in_3(weight[mul_18_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_10(
    .clk(clk), 
    .in_1(din[mul_10_param -: 288]), 
    .in_2(weight[mul_19_param -: 288]), 
    .in_3(weight[mul_20_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_11(
    .clk(clk), 
    .in_1(din[mul_11_param -: 288]), 
    .in_2(weight[mul_21_param -: 288]), 
    .in_3(weight[mul_22_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));


mul_36 mul_12(
    .clk(clk), 
    .in_1(din[mul_12_param -: 288]), 
    .in_2(weight[mul_23_param -: 288]), 
    .in_3(weight[mul_24_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_13(
    .clk(clk), 
    .in_1(din[mul_13_param -: 288]), 
    .in_2(weight[mul_25_param -: 288]), 
    .in_3(weight[mul_26_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_14(
    .clk(clk), 
    .in_1(din[mul_14_param -: 288]), 
    .in_2(weight[mul_27_param -: 288]), 
    .in_3(weight[mul_28_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));


mul_36 mul_15(
    .clk(clk), 
    .in_1(din[mul_15_param -: 288]), 
    .in_2(weight[mul_29_param -: 288]), 
    .in_3(weight[mul_30_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_16(
    .clk(clk), 
    .in_1(din[mul_16_param -: 288]), 
    .in_2(weight[mul_31_param -: 288]), 
    .in_3(weight[mul_32_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_17(
    .clk(clk), 
    .in_1(din[mul_17_param -: 288]), 
    .in_2(weight[mul_33_param -: 288]), 
    .in_3(weight[mul_34_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_18(
    .clk(clk), 
    .in_1(din[mul_18_param -: 288]), 
    .in_2(weight[mul_35_param -: 288]), 
    .in_3(weight[mul_36_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));


mul_36 mul_19(
    .clk(clk), 
    .in_1(din[mul_19_param -: 288]), 
    .in_2(weight[mul_37_param -: 288]), 
    .in_3(weight[mul_38_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));

mul_36 mul_20(
    .clk(clk), 
    .in_1(din[mul_20_param -: 288]), 
    .in_2(weight[mul_39_param -: 288]), 
    .in_3(weight[mul_40_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2));


//adder 

adder_36 adder_1(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i1),
    .din(mul_out1),
    .acc_o(sum1),
    .vld_o(vld_o1)
    );

adder_36 adder_2(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i2),
    .din(mul_out2),
    .acc_o(sum2),
    .vld_o(vld_o2)
    );

adder_36 adder_3(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i3),
    .din(mul_out3),
    .acc_o(sum3),
    .vld_o(vld_o3)
    );
    
adder_36 adder_4(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i4),
    .din(mul_out4),
    .acc_o(sum4),
    .vld_o(vld_o4)
    );
    
adder_36 adder_5(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i5),
    .din(mul_out5),
    .acc_o(sum5),
    .vld_o(vld_o5)
    );
    
adder_36 adder_6(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i6),
    .din(mul_out6),
    .acc_o(sum6),
    .vld_o(vld_o6)
    );

adder_36 adder_7(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i7),
    .din(mul_out7),
    .acc_o(sum7),
    .vld_o(vld_o7)
    );
    
adder_36 adder_8(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i8),
    .din(mul_out8),
    .acc_o(sum8),
    .vld_o(vld_o8)
    );   

adder_36 adder_9(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i9),
    .din(mul_out9),
    .acc_o(sum9),
    .vld_o(vld_o9)
    );   

adder_36 adder_10(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i10),
    .din(mul_out10),
    .acc_o(sum10),
    .vld_o(vld_o10)
    );   

adder_36 adder_11(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i11),
    .din(mul_out11),
    .acc_o(sum11),
    .vld_o(vld_o11)
    );

adder_36 adder_12(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i12),
    .din(mul_out12),
    .acc_o(sum12),
    .vld_o(vld_o12)
    );

adder_36 adder_13(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i13),
    .din(mul_out13),
    .acc_o(sum13),
    .vld_o(vld_o13)
    );
    
adder_36 adder_14(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i14),
    .din(mul_out14),
    .acc_o(sum14),
    .vld_o(vld_o14)
    );
    
adder_36 adder_15(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i15),
    .din(mul_out15),
    .acc_o(sum15),
    .vld_o(vld_o15)
    );
    
adder_36 adder_16(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i16),
    .din(mul_out16),
    .acc_o(sum16),
    .vld_o(vld_o16)
    );

adder_36 adder_17(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i17),
    .din(mul_out17),
    .acc_o(sum17),
    .vld_o(vld_o17)
    );
    
adder_36 adder_18(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i18),
    .din(mul_out18),
    .acc_o(sum18),
    .vld_o(vld_o18)
    );   

adder_36 adder_19(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i19),
    .din(mul_out19),
    .acc_o(sum19),
    .vld_o(vld_o19)
    );   

adder_36 adder_20(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i20),
    .din(mul_out20),
    .acc_o(sum20),
    .vld_o(vld_o20)
    );   

endmodule