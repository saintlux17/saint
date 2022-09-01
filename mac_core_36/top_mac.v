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


// 3 x 3 x 4 data input
// 3 x 3 x 4 filter input for 40 filters [36DSP : 2filters at a time, 720DSP : 40 filters] 
module top_mac #(parameter N = 720, M = 36)(
    input clk,
    input rstn,
    input[8*M-1: 0] din,      // 720*8bit input data
    input[16*N-1: 0] weight,  // (720*8bit)*2 weight [40 filter weights] [weight 1 / weight 2 /weight 3 / weight 4 / ... / weight 40]  
    output[21:0] sum1,         //partial sum from each module (3 x 3 x 4)
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
    output[21:0] sum16,
    output[21:0] sum17,
    output[21:0] sum18,
    output[21:0] sum19,
    output[21:0] sum20,
    output[21:0] sum21,
    output[21:0] sum22,
    output[21:0] sum23,
    output[21:0] sum24,
    output[21:0] sum25,    
    output[21:0] sum26,
    output[21:0] sum27,
    output[21:0] sum28,
    output[21:0] sum29,
    output[21:0] sum30,
    output[21:0] sum31,
    output[21:0] sum32,
    output[21:0] sum33,
    output[21:0] sum34,
    output[21:0] sum35,    
    output[21:0] sum36,
    output[21:0] sum37,
    output[21:0] sum38,
    output[21:0] sum39,
    output[21:0] sum40,
    output vld_o1,          //valid signal for each filter mac opeation
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
    output vld_o21,     
    output vld_o22,
    output vld_o23,
    output vld_o24,
    output vld_o25,
    output vld_o26,
    output vld_o27,
    output vld_o28,
    output vld_o29,
    output vld_o30,
    output vld_o31,
    output vld_o32,
    output vld_o33,
    output vld_o34,
    output vld_o35,
    output vld_o36,
    output vld_o37,
    output vld_o38,
    output vld_o39,
    output vld_o40
    );

wire vld_i1, vld_i2, vld_i3, vld_i4;
wire vld_i5, vld_i6, vld_i7, vld_i8;
wire vld_i9, vld_i10, vld_i11, vld_i12;
wire vld_i13, vld_i14, vld_i15, vld_i16;
wire vld_i17, vld_i18, vld_i19, vld_i20;
wire vld_i21, vld_i22, vld_i23, vld_i24;
wire vld_i25, vld_i26, vld_i27, vld_i28;
wire vld_i29, vld_i30, vld_i31, vld_i32;
wire vld_i33, vld_i34, vld_i35, vld_i36;
wire vld_i37, vld_i38, vld_i39, vld_i40;
    
wire[16*M-1:0] mul_out1, mul_out2, mul_out3, mul_out4;
wire[16*M-1:0] mul_out5, mul_out6, mul_out7, mul_out8;
wire[16*M-1:0] mul_out9, mul_out10, mul_out11, mul_out12;
wire[16*M-1:0] mul_out13, mul_out14, mul_out15, mul_out16;
wire[16*M-1:0] mul_out17, mul_out18, mul_out19, mul_out20;
wire[16*M-1:0] mul_out21, mul_out22, mul_out23, mul_out24;
wire[16*M-1:0] mul_out25, mul_out26, mul_out27, mul_out28;
wire[16*M-1:0] mul_out29, mul_out30, mul_out31, mul_out32;
wire[16*M-1:0] mul_out33, mul_out34, mul_out35, mul_out36;
wire[16*M-1:0] mul_out37, mul_out38, mul_out39, mul_out40;

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
    .in_1(din), 
    .in_2(weight[mul_1_param: 0]), 
    .in_3(weight[mul_2_param -: 288]), 
    .out1(mul_out1), 
    .out2(mul_out2),
    .vld_o1(vld_i1),
    .vld_o2(vld_i2)
    );

mul_36 mul_2(
    .clk(clk), 
    .in_1(din),
    .in_2(weight[mul_3_param -: 288]), 
    .in_3(weight[mul_4_param -: 288]), 
    .out1(mul_out3), 
    .out2(mul_out4),
    .vld_o1(vld_i3),
    .vld_o2(vld_i4)
    );


mul_36 mul_3(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_5_param -: 288]), 
    .in_3(weight[mul_6_param -: 288]), 
    .out1(mul_out5), 
    .out2(mul_out6),
    .vld_o1(vld_i5),
    .vld_o2(vld_i6)
    );

mul_36 mul_4(
    .clk(clk), 
    .in_1(din),
    .in_2(weight[mul_7_param -: 288]), 
    .in_3(weight[mul_8_param -: 288]), 
    .out1(mul_out7), 
    .out2(mul_out8),
    .vld_o1(vld_i7),
    .vld_o2(vld_i8)
    );

mul_36 mul_5(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_9_param -: 288]), 
    .in_3(weight[mul_10_param -: 288]), 
    .out1(mul_out9), 
    .out2(mul_out10),
    .vld_o1(vld_i9),
    .vld_o2(vld_i10)
    );


mul_36 mul_6(
    .clk(clk), 
    .in_1(din),
    .in_2(weight[mul_11_param -: 288]), 
    .in_3(weight[mul_12_param -: 288]), 
    .out1(mul_out11), 
    .out2(mul_out12),
    .vld_o1(vld_i11),
    .vld_o2(vld_i12)
    );

mul_36 mul_7(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_13_param -: 288]), 
    .in_3(weight[mul_14_param -: 288]), 
    .out1(mul_out13), 
    .out2(mul_out14),
    .vld_o1(vld_i13),
    .vld_o2(vld_i14)
    );

mul_36 mul_8(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_15_param -: 288]), 
    .in_3(weight[mul_16_param -: 288]), 
    .out1(mul_out15), 
    .out2(mul_out16),
    .vld_o1(vld_i15),
    .vld_o2(vld_i16)
    );


mul_36 mul_9(
    .clk(clk), 
    .in_1(din),
    .in_2(weight[mul_17_param -: 288]), 
    .in_3(weight[mul_18_param -: 288]), 
    .out1(mul_out17), 
    .out2(mul_out18),
    .vld_o1(vld_i17),
    .vld_o2(vld_i18)
    );

mul_36 mul_10(
    .clk(clk), 
    .in_1(din),
    .in_2(weight[mul_19_param -: 288]), 
    .in_3(weight[mul_20_param -: 288]), 
    .out1(mul_out19), 
    .out2(mul_out20),
    .vld_o1(vld_i19),
    .vld_o2(vld_i20)
    );

mul_36 mul_11(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_21_param -: 288]), 
    .in_3(weight[mul_22_param -: 288]), 
    .out1(mul_out21), 
    .out2(mul_out22),
    .vld_o1(vld_i21),
    .vld_o2(vld_i22)
    );


mul_36 mul_12(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_23_param -: 288]), 
    .in_3(weight[mul_24_param -: 288]), 
    .out1(mul_out23), 
    .out2(mul_out24),
    .vld_o1(vld_i23),
    .vld_o2(vld_i24)
    );

mul_36 mul_13(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_25_param -: 288]), 
    .in_3(weight[mul_26_param -: 288]), 
    .out1(mul_out25), 
    .out2(mul_out26),
    .vld_o1(vld_i25),
    .vld_o2(vld_i26)
    );

mul_36 mul_14(
    .clk(clk), 
    .in_1(din),
    .in_2(weight[mul_27_param -: 288]), 
    .in_3(weight[mul_28_param -: 288]), 
    .out1(mul_out27), 
    .out2(mul_out28),
    .vld_o1(vld_i27),
    .vld_o2(vld_i28)
    );


mul_36 mul_15(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_29_param -: 288]), 
    .in_3(weight[mul_30_param -: 288]), 
    .out1(mul_out29), 
    .out2(mul_out30),
    .vld_o1(vld_i29),
    .vld_o2(vld_i30)
    );

mul_36 mul_16(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_31_param -: 288]), 
    .in_3(weight[mul_32_param -: 288]), 
    .out1(mul_out31), 
    .out2(mul_out32),
    .vld_o1(vld_i31),
    .vld_o2(vld_i32)
    );

mul_36 mul_17(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_33_param -: 288]), 
    .in_3(weight[mul_34_param -: 288]), 
    .out1(mul_out33), 
    .out2(mul_out34),
    .vld_o1(vld_i33),
    .vld_o2(vld_i34)
    );

mul_36 mul_18(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_35_param -: 288]), 
    .in_3(weight[mul_36_param -: 288]), 
    .out1(mul_out35), 
    .out2(mul_out36),
    .vld_o1(vld_i35),
    .vld_o2(vld_i36)
    );


mul_36 mul_19(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_37_param -: 288]), 
    .in_3(weight[mul_38_param -: 288]), 
    .out1(mul_out37), 
    .out2(mul_out38),
    .vld_o1(vld_i37),
    .vld_o2(vld_i38)
    );

mul_36 mul_20(
    .clk(clk), 
    .in_1(din), 
    .in_2(weight[mul_39_param -: 288]), 
    .in_3(weight[mul_40_param -: 288]), 
    .out1(mul_out39), 
    .out2(mul_out40),
    .vld_o1(vld_i39),
    .vld_o2(vld_i40)
    );
 

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

adder_36 adder_21(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i21),
    .din(mul_out21),
    .acc_o(sum21),
    .vld_o(vld_o21)
    );

adder_36 adder_22(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i22),
    .din(mul_out22),
    .acc_o(sum22),
    .vld_o(vld_o22)
    );

adder_36 adder_23(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i23),
    .din(mul_out23),
    .acc_o(sum23),
    .vld_o(vld_o23)
    );
    
adder_36 adder_24(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i24),
    .din(mul_out24),
    .acc_o(sum24),
    .vld_o(vld_o24)
    );
    
adder_36 adder_25(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i25),
    .din(mul_out25),
    .acc_o(sum25),
    .vld_o(vld_o25)
    );
    
adder_36 adder_26(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i26),
    .din(mul_out26),
    .acc_o(sum26),
    .vld_o(vld_o26)
    );

adder_36 adder_27(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i27),
    .din(mul_out27),
    .acc_o(sum27),
    .vld_o(vld_o27)
    );
    
adder_36 adder_28(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i28),
    .din(mul_out28),
    .acc_o(sum28),
    .vld_o(vld_o28)
    );   

adder_36 adder_29(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i29),
    .din(mul_out29),
    .acc_o(sum29),
    .vld_o(vld_o29)
    );   

adder_36 adder_30(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i30),
    .din(mul_out30),
    .acc_o(sum30),
    .vld_o(vld_o30)
    );   

adder_36 adder_31(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i31),
    .din(mul_out31),
    .acc_o(sum31),
    .vld_o(vld_o31)
    );

adder_36 adder_32(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i32),
    .din(mul_out32),
    .acc_o(sum32),
    .vld_o(vld_o32)
    );

adder_36 adder_33(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i33),
    .din(mul_out33),
    .acc_o(sum33),
    .vld_o(vld_o33)
    );
    
adder_36 adder_34(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i34),
    .din(mul_out34),
    .acc_o(sum34),
    .vld_o(vld_o34)
    );
    
adder_36 adder_35(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i35),
    .din(mul_out35),
    .acc_o(sum35),
    .vld_o(vld_o35)
    );
    
adder_36 adder_36(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i36),
    .din(mul_out36),
    .acc_o(sum36),
    .vld_o(vld_o36)
    );

adder_36 adder_17(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i37),
    .din(mul_out37),
    .acc_o(sum37),
    .vld_o(vld_o17)
    );
    
adder_36 adder_38(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i38),
    .din(mul_out38),
    .acc_o(sum38),
    .vld_o(vld_o38)
    );   

adder_36 adder_39(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i39),
    .din(mul_out39),
    .acc_o(sum39),
    .vld_o(vld_o39)
    );   

adder_36 adder_40(
    .clk(clk),
    .rstn(rstn),
    .vld_i(vld_i40),
    .din(mul_out40),
    .acc_o(sum40),
    .vld_o(vld_o40)
    );
    
endmodule
