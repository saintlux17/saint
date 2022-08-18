`timescale 1ns / 1ps

module adder_new (
input clk, 
input rstn,
input vld_i,
input[2303 :0] din,
output[7:0] acc_o,
output       vld_o 
);

//----------------------------------------------------------------------
// Signals
//----------------------------------------------------------------------
// Level 1 - 72 
reg [16:0] y1_0;
reg [16:0] y1_1;
reg [16:0] y1_2;
reg [16:0] y1_3;
reg [16:0] y1_4;
reg [16:0] y1_5;
reg [16:0] y1_6;
reg [16:0] y1_7;
reg [16:0] y1_8;
reg [16:0] y1_9;
reg [16:0] y1_10;
reg [16:0] y1_11;
reg [16:0] y1_12;
reg [16:0] y1_13;
reg [16:0] y1_14;
reg [16:0] y1_15;
reg [16:0] y1_16;
reg [16:0] y1_17;
reg [16:0] y1_18;
reg [16:0] y1_19;
reg [16:0] y1_20;
reg [16:0] y1_21;
reg [16:0] y1_22;
reg [16:0] y1_23;
reg [16:0] y1_24;
reg [16:0] y1_25;
reg [16:0] y1_26;
reg [16:0] y1_27;
reg [16:0] y1_28;
reg [16:0] y1_29;
reg [16:0] y1_30;
reg [16:0] y1_31;
reg [16:0] y1_32;
reg [16:0] y1_33;
reg [16:0] y1_34;
reg [16:0] y1_35;
reg [16:0] y1_36;
reg [16:0] y1_37;
reg [16:0] y1_38;
reg [16:0] y1_39;
reg [16:0] y1_40;
reg [16:0] y1_41;
reg [16:0] y1_42;
reg [16:0] y1_43;
reg [16:0] y1_44;
reg [16:0] y1_45;
reg [16:0] y1_46;
reg [16:0] y1_47;
reg [16:0] y1_48;
reg [16:0] y1_49;
reg [16:0] y1_50;
reg [16:0] y1_51;
reg [16:0] y1_52;
reg [16:0] y1_53;
reg [16:0] y1_54;
reg [16:0] y1_55;
reg [16:0] y1_56;
reg [16:0] y1_57;
reg [16:0] y1_58;
reg [16:0] y1_59;
reg [16:0] y1_60;
reg [16:0] y1_61;
reg [16:0] y1_62;
reg [16:0] y1_63;
reg [16:0] y1_64;
reg [16:0] y1_65;
reg [16:0] y1_66;
reg [16:0] y1_67;
reg [16:0] y1_68;
reg [16:0] y1_69;
reg [16:0] y1_70;
reg [16:0] y1_71;

// Level 2 - 36
reg [17:0] y2_0;
reg [17:0] y2_1;
reg [17:0] y2_2;
reg [17:0] y2_3;
reg [17:0] y2_4;
reg [17:0] y2_5;
reg [17:0] y2_6;
reg [17:0] y2_7;
reg [17:0] y2_8;
reg [17:0] y2_9;
reg [17:0] y2_10;
reg [17:0] y2_11;
reg [17:0] y2_12;
reg [17:0] y2_13;
reg [17:0] y2_14;
reg [17:0] y2_15;
reg [17:0] y2_16;
reg [17:0] y2_17;
reg [17:0] y2_18;
reg [17:0] y2_19;
reg [17:0] y2_20;
reg [17:0] y2_21;
reg [17:0] y2_22;
reg [17:0] y2_23;
reg [17:0] y2_24;
reg [17:0] y2_25;
reg [17:0] y2_26;
reg [17:0] y2_27;
reg [17:0] y2_28;
reg [17:0] y2_29;
reg [17:0] y2_30;
reg [17:0] y2_31;
reg [17:0] y2_32;
reg [17:0] y2_33;
reg [17:0] y2_34;
reg [17:0] y2_35;

// Level 3 - 18
reg [18:0] y3_0;
reg [18:0] y3_1;
reg [18:0] y3_2;
reg [18:0] y3_3;
reg [18:0] y3_4;
reg [18:0] y3_5;
reg [18:0] y3_6;
reg [18:0] y3_7;
reg [18:0] y3_8;
reg [18:0] y3_9;
reg [18:0] y3_10;
reg [18:0] y3_11;
reg [18:0] y3_12;
reg [18:0] y3_13;
reg [18:0] y3_14;
reg [18:0] y3_15;
reg [18:0] y3_16;
reg [18:0] y3_17;

// Level 4 - 9
reg [19:0] y4_0;
reg [19:0] y4_1;
reg [19:0] y4_2;
reg [19:0] y4_3;
reg [19:0] y4_4;
reg [19:0] y4_5;
reg [19:0] y4_6;
reg [19:0] y4_7;
reg [19:0] y4_8;

//Level 5.- 4 + send y4_8 to lsst level
reg [20:0] y5_0;
reg [20:0] y5_1;
reg [20:0] y5_2;
reg [20:0] y5_3;

//Level 6 - 2
reg [21:0] y6_0;
reg [21:0] y6_1;

// Level 7 - 1
reg [22:0] y7;

//final layer (Level 8)
reg [23:0] temp, final_temp;
reg [7:0] y_final;

// Delays
reg vld_i_d1, vld_i_d2, vld_i_d3, vld_i_d4, vld_i_d5, vld_i_d6, vld_i_d7, vld_i_final;

//-------------------------------------------------
// Reduction tree
//-------------------------------------------------
// Level 1
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y1_0 <= 17'd0;
		y1_1 <= 17'd0;
		y1_2 <= 17'd0;
		y1_3 <= 17'd0;
		y1_4 <= 17'd0;
		y1_5 <= 17'd0;
		y1_6 <= 17'd0;
		y1_7 <= 17'd0;
		y1_8 <= 17'd0;
		y1_9 <= 17'd0;
		y1_10 <= 17'd0;
		y1_11 <= 17'd0;
		y1_12 <= 17'd0;
	    y1_13 <= 17'd0;
		y1_14 <= 17'd0;
		y1_15 <= 17'd0;
		y1_16 <= 17'd0;
		y1_17 <= 17'd0;
		y1_18 <= 17'd0;
		y1_19 <= 17'd0;
		y1_20 <= 17'd0;
		y1_21 <= 17'd0;
		y1_22 <= 17'd0;
		y1_23 <= 17'd0;
		y1_24 <= 17'd0;
		y1_25 <= 17'd0;
		y1_26 <= 17'd0;
		y1_27 <= 17'd0;
		y1_28 <= 17'd0;
		y1_29 <= 17'd0;
		y1_30 <= 17'd0;
		y1_31 <= 17'd0;
		y1_32 <= 17'd0;
		y1_33 <= 17'd0;
		y1_34 <= 17'd0;
		y1_35 <= 17'd0;
		y1_36 <= 17'd0;
		y1_37 <= 17'd0;
		y1_38 <= 17'd0;
		y1_39 <= 17'd0;
		y1_40 <= 17'd0;
		y1_41 <= 17'd0;
		y1_42 <= 17'd0;
		y1_43 <= 17'd0;
		y1_44 <= 17'd0;
		y1_45 <= 17'd0;
		y1_46 <= 17'd0;
		y1_47 <= 17'd0;
		y1_48 <= 17'd0;
		y1_49 <= 17'd0;
		y1_50 <= 17'd0;
		y1_51 <= 17'd0;
		y1_52 <= 17'd0;
	    y1_53 <= 17'd0;
		y1_54 <= 17'd0;
		y1_55 <= 17'd0;
		y1_56 <= 17'd0;
		y1_57 <= 17'd0;
		y1_58 <= 17'd0;
		y1_59 <= 17'd0;
		y1_60 <= 17'd0;
		y1_61 <= 17'd0;
		y1_62 <= 17'd0;
		y1_63 <= 17'd0;
		y1_64 <= 17'd0;
		y1_65 <= 17'd0;
		y1_66 <= 17'd0;
		y1_67 <= 17'd0;
		y1_68 <= 17'd0;
		y1_69 <= 17'd0;
		y1_70 <= 17'd0;
		y1_71 <= 17'd0;
	end
	else begin 
		y1_0 <= $signed(din[15 -:16]) + $signed(din[31 -:16]);
		y1_1 <= $signed(din[47 -:16]) + $signed(din[63 -:16]);
		y1_2 <= $signed(din[79 -:16]) + $signed(din[95 -:16]);
		y1_3 <= $signed(din[111 -:16]) + $signed(din[127 -:16]);
		y1_4 <= $signed(din[143 -:16]) + $signed(din[159 -:16]);
		y1_5 <= $signed(din[175 -:16]) + $signed(din[191 -:16]);
		y1_6 <= $signed(din[207 -:16]) + $signed(din[223 -:16]);
		y1_7 <= $signed(din[239 -:16]) + $signed(din[255 -:16]);
		y1_8 <= $signed(din[271 -:16]) + $signed(din[287 -:16]);
		y1_9 <= $signed(din[303 -:16]) + $signed(din[319 -:16]);
		y1_10 <= $signed(din[335 -:16]) + $signed(din[351 -:16]);
		y1_11 <= $signed(din[367 -:16]) + $signed(din[383 -:16]);
		y1_12 <= $signed(din[399 -:16]) + $signed(din[415 -:16]);
		y1_13 <= $signed(din[431 -:16]) + $signed(din[447 -:16]);
		y1_14 <= $signed(din[463 -:16]) + $signed(din[479 -:16]);
		y1_15 <= $signed(din[495 -:16]) + $signed(din[511 -:16]);
		y1_16 <= $signed(din[527 -:16]) + $signed(din[543 -:16]);
		y1_17 <= $signed(din[559 -:16]) + $signed(din[575 -:16]);
		y1_18 <= $signed(din[591 -:16]) + $signed(din[607 -:16]);
		y1_19 <= $signed(din[623 -:16]) + $signed(din[639 -:16]);
		y1_20 <= $signed(din[655 -:16]) + $signed(din[671 -:16]);
		y1_21 <= $signed(din[687 -:16]) + $signed(din[703 -:16]);
		y1_22 <= $signed(din[719 -:16]) + $signed(din[735 -:16]);
		y1_23 <= $signed(din[751 -:16]) + $signed(din[767 -:16]);
		y1_24 <= $signed(din[783 -:16]) + $signed(din[799 -:16]);
		y1_25 <= $signed(din[815 -:16]) + $signed(din[831 -:16]);
		y1_26 <= $signed(din[847 -:16]) + $signed(din[863 -:16]);
		y1_27 <= $signed(din[879 -:16]) + $signed(din[895 -:16]);
		y1_28 <= $signed(din[911 -:16]) + $signed(din[927 -:16]);
		y1_29 <= $signed(din[943 -:16]) + $signed(din[959 -:16]);
		y1_30 <= $signed(din[975 -:16]) + $signed(din[991 -:16]);
		y1_31 <= $signed(din[1007 -:16]) + $signed(din[1023 -:16]);
		y1_32 <= $signed(din[1039 -:16]) + $signed(din[1055 -:16]);
		y1_33 <= $signed(din[1071 -:16]) + $signed(din[1087 -:16]);
		y1_34 <= $signed(din[1103 -:16]) + $signed(din[1119 -:16]);
		y1_35 <= $signed(din[1135 -:16]) + $signed(din[1151 -:16]);
		y1_36 <= $signed(din[1167 -:16]) + $signed(din[1183 -:16]);
		y1_37 <= $signed(din[1199 -:16]) + $signed(din[1215 -:16]);
		y1_38 <= $signed(din[1231 -:16]) + $signed(din[1247 -:16]);
		y1_39 <= $signed(din[1263 -:16]) + $signed(din[1279 -:16]);
		y1_40 <= $signed(din[1295 -:16]) + $signed(din[1311 -:16]);
		y1_41 <= $signed(din[1327 -:16]) + $signed(din[1343 -:16]);
		y1_42 <= $signed(din[1359 -:16]) + $signed(din[1375 -:16]);
		y1_43 <= $signed(din[1391 -:16]) + $signed(din[1407 -:16]);
		y1_44 <= $signed(din[1423 -:16]) + $signed(din[1439 -:16]);
		y1_45 <= $signed(din[1455 -:16]) + $signed(din[1471 -:16]);
		y1_46 <= $signed(din[1487 -:16]) + $signed(din[1503 -:16]);
		y1_47 <= $signed(din[1519 -:16]) + $signed(din[1535 -:16]);
		y1_48 <= $signed(din[1551 -:16]) + $signed(din[1567 -:16]);
		y1_49 <= $signed(din[1583 -:16]) + $signed(din[1599 -:16]);
		y1_50 <= $signed(din[1615 -:16]) + $signed(din[1631 -:16]);
		y1_51 <= $signed(din[1647 -:16]) + $signed(din[1663 -:16]);
		y1_52 <= $signed(din[1679 -:16]) + $signed(din[1695 -:16]);
		y1_53 <= $signed(din[1711 -:16]) + $signed(din[1727 -:16]);
		y1_54 <= $signed(din[1743 -:16]) + $signed(din[1759 -:16]);
		y1_55 <= $signed(din[1775 -:16]) + $signed(din[1791 -:16]);
		y1_56 <= $signed(din[1807 -:16]) + $signed(din[1823 -:16]);
		y1_57 <= $signed(din[1839 -:16]) + $signed(din[1855 -:16]);
		y1_58 <= $signed(din[1871 -:16]) + $signed(din[1887 -:16]);
		y1_59 <= $signed(din[1903 -:16]) + $signed(din[1919 -:16]);
		y1_60 <= $signed(din[1935 -:16]) + $signed(din[1951 -:16]);
		y1_61 <= $signed(din[1967 -:16]) + $signed(din[1983 -:16]);
		y1_62 <= $signed(din[1999 -:16]) + $signed(din[2015 -:16]);
		y1_63 <= $signed(din[2031 -:16]) + $signed(din[2047 -:16]);
		y1_64 <= $signed(din[2063 -:16]) + $signed(din[2079 -:16]);
		y1_65 <= $signed(din[2095 -:16]) + $signed(din[2111 -:16]);
		y1_66 <= $signed(din[2127 -:16]) + $signed(din[2143 -:16]);
		y1_67 <= $signed(din[2159 -:16]) + $signed(din[2175 -:16]);
		y1_68 <= $signed(din[2191 -:16]) + $signed(din[2207 -:16]);
		y1_69 <= $signed(din[2223 -:16]) + $signed(din[2239 -:16]);
		y1_70 <= $signed(din[2255 -:16]) + $signed(din[2271 -:16]);
		y1_71 <= $signed(din[2287 -:16]) + $signed(din[2303 -:16]);
	end
end

// Level 2
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y2_0 <= 18'd0;
		y2_1 <= 18'd0;
		y2_2 <= 18'd0;
		y2_3 <= 18'd0;
		y2_4 <= 18'd0;
		y2_5 <= 18'd0;
		y2_6 <= 18'd0;
		y2_7 <= 18'd0;
		y2_8 <= 18'd0;
		y2_9 <= 18'd0;
		y2_10 <= 18'd0;
		y2_11 <= 18'd0;
		y2_12 <= 18'd0;
	    y2_13 <= 18'd0;
		y2_14 <= 18'd0;
		y2_15 <= 18'd0;
		y2_16 <= 18'd0;
		y2_17 <= 18'd0;
		y2_18 <= 18'd0;
		y2_19 <= 18'd0;
		y2_20 <= 18'd0;
		y2_21 <= 18'd0;
		y2_22 <= 18'd0;
		y2_23 <= 18'd0;
		y2_24 <= 18'd0;
		y2_25 <= 18'd0;
		y2_26 <= 18'd0;
		y2_27 <= 18'd0;
		y2_28 <= 18'd0;
		y2_29 <= 18'd0;
		y2_30 <= 18'd0;
		y2_31 <= 18'd0;
		y2_32 <= 18'd0;
		y2_33 <= 18'd0;
		y2_34 <= 18'd0;
		y2_35 <= 18'd0;
	end
	else begin 
		y2_0 <= $signed(y1_0) + $signed(y1_1);
		y2_1 <= $signed(y1_2) + $signed(y1_3);
		y2_2 <= $signed(y1_4) + $signed(y1_5);
		y2_3 <= $signed(y1_6) + $signed(y1_7);
		y2_4 <= $signed(y1_8) + $signed(y1_9);
		y2_5 <= $signed(y1_10) + $signed(y1_11);
		y2_6 <= $signed(y1_12) + $signed(y1_13);
		y2_7 <= $signed(y1_14) + $signed(y1_15);
		y2_8 <= $signed(y1_16) + $signed(y1_17);
		y2_9 <= $signed(y1_18) + $signed(y1_19);
		y2_10 <= $signed(y1_20) + $signed(y1_21);
		y2_11 <= $signed(y1_22) + $signed(y1_23);
		y2_12 <= $signed(y1_24) + $signed(y1_25);
		y2_13 <= $signed(y1_26) + $signed(y1_27);
		y2_14 <= $signed(y1_28) + $signed(y1_29);
		y2_15 <= $signed(y1_30) + $signed(y1_31);
		y2_16 <= $signed(y1_32) + $signed(y1_33);
		y2_17 <= $signed(y1_34) + $signed(y1_35);
		y2_18 <= $signed(y1_36) + $signed(y1_37);
		y2_19 <= $signed(y1_38) + $signed(y1_39);
		y2_20 <= $signed(y1_40) + $signed(y1_41);
		y2_21 <= $signed(y1_42) + $signed(y1_43);
		y2_22 <= $signed(y1_44) + $signed(y1_45);
		y2_23 <= $signed(y1_46) + $signed(y1_47);
		y2_24 <= $signed(y1_48) + $signed(y1_49);
		y2_25 <= $signed(y1_50) + $signed(y1_51);
		y2_26 <= $signed(y1_52) + $signed(y1_53);
		y2_27 <= $signed(y1_54) + $signed(y1_55);
		y2_28 <= $signed(y1_56) + $signed(y1_57);
		y2_29 <= $signed(y1_58) + $signed(y1_59);
		y2_30 <= $signed(y1_60) + $signed(y1_61);
		y2_31 <= $signed(y1_62) + $signed(y1_63);
		y2_32 <= $signed(y1_64) + $signed(y1_65);
		y2_33 <= $signed(y1_66) + $signed(y1_67);
		y2_34 <= $signed(y1_68) + $signed(y1_69);
		y2_35 <= $signed(y1_70) + $signed(y1_71);
				
	end
end

// Level 3
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y3_0 <= 19'd0;
		y3_1 <= 19'd0;
		y3_2 <= 19'd0;
		y3_3 <= 10'd0;
		y3_4 <= 19'd0;
		y3_5 <= 19'd0;
		y3_6 <= 19'd0;
		y3_7 <= 19'd0;
		y3_8 <= 19'd0;
		y3_9 <= 19'd0;
		y3_10 <= 19'd0;
		y3_11 <= 19'd0;
		y3_12 <= 19'd0;
		y3_13 <= 19'd0;
		y3_14 <= 19'd0;
		y3_15 <= 19'd0;
		y3_16 <= 19'd0;
		y3_17 <= 19'd0;
	end
	else begin 
		y3_0 <= $signed(y2_0) + $signed(y2_1);
		y3_1 <= $signed(y2_2) + $signed(y2_3);
		y3_2 <= $signed(y2_4) + $signed(y2_5);
		y3_3 <= $signed(y2_6) + $signed(y2_7);
		y3_4 <= $signed(y2_8) + $signed(y2_9);
		y3_5 <= $signed(y2_10) + $signed(y2_11);
		y3_6 <= $signed(y2_12) + $signed(y2_13);
		y3_7 <= $signed(y2_14) + $signed(y2_15);
		y3_8 <= $signed(y2_16) + $signed(y2_17);
		y3_9 <= $signed(y2_18) + $signed(y2_19);
		y3_10 <= $signed(y2_20) + $signed(y2_21);
		y3_11 <= $signed(y2_22) + $signed(y2_23);
		y3_12 <= $signed(y2_24) + $signed(y2_25);
		y3_13 <= $signed(y2_26) + $signed(y2_27);
		y3_14 <= $signed(y2_28) + $signed(y2_29);
		y3_15 <= $signed(y2_30) + $signed(y2_31);
		y3_16 <= $signed(y2_32) + $signed(y2_33);
		y3_17 <= $signed(y2_34) + $signed(y2_35);
	end
end
// Level 4
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y4_0 <= 21'd0;
		y4_1 <= 21'd0;
		y4_2 <= 21'd0;
		y4_3 <= 21'd0;
		y4_4 <= 21'd0;
		y4_5 <= 21'd0;
		y4_6 <= 21'd0;
		y4_7 <= 21'd0;
		y4_8 <= 21'd0;
    end
	else begin
		y4_0 <= $signed(y3_0) + $signed(y3_1);
		y4_1 <= $signed(y3_2) + $signed(y3_3);
		y4_2 <= $signed(y3_4) + $signed(y3_5);
		y4_3 <= $signed(y3_6) + $signed(y3_7);
		y4_4 <= $signed(y3_8) + $signed(y3_9);
		y4_5 <= $signed(y3_10) + $signed(y3_11);
		y4_6 <= $signed(y3_12) + $signed(y3_13);
		y4_7 <= $signed(y3_14) + $signed(y3_15);
		y4_8 <= $signed(y3_16) + $signed(y3_17);
	end
end

//Level 5
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y5_0 <= 21'd0;
		y5_1 <= 21'd0;
		y5_2 <= 21'd0;
		y5_3 <= 21'd0;
    end
	else begin
		y5_0 <= $signed(y4_0) + $signed(y4_1);
		y5_1 <= $signed(y4_2) + $signed(y4_3);
		y5_2 <= $signed(y4_4) + $signed(y4_5);
		y5_3 <= $signed(y4_6) + $signed(y4_7);
	end
end

//Level 6
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y6_0 <= 22'd0;
		y6_1 <= 22'd0;
    end
	else begin
		y6_0 <= $signed(y5_0) + $signed(y5_1);
		y6_1 <= $signed(y5_2) + $signed(y5_3);
	end
end

//Level 7
always@(posedge clk, negedge rstn) begin
	if(!rstn)
		y7 <= 23'd0;
	else begin
		y7  <= $signed(y6_0) + $signed(y6_1);
	end
end

//final layer 
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		temp <= 24'd0;
		final_temp <= 24'd0;
		y_final <= 8'd0;
		end
	else begin
		temp <= $signed(y7) + $signed(y4_8);
		final_temp <= (temp >>> 16);
		y_final <= final_temp[7:0];
		end
end
//-------------------------------------------------
// Valid signal
//-------------------------------------------------
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		vld_i_d1 <= 0;
		vld_i_d2 <= 0;
		vld_i_d3 <= 0;
		vld_i_d4 <= 0;
		vld_i_d5 <= 0;
		vld_i_d6 <= 0;
		vld_i_d7 <= 0;
		vld_i_final <= 0;
	end
	else begin 
		vld_i_d1 <= vld_i;
		vld_i_d2 <= vld_i_d1;
		vld_i_d3 <= vld_i_d2;
		vld_i_d4 <= vld_i_d3;
		vld_i_d5 <= vld_i_d4;
		vld_i_d6 <= vld_i_d5;
		vld_i_d7 <= vld_i_d6;	
		vld_i_final <= vld_i_d7;	
	end
end
//Output
assign vld_o = vld_i_final;
assign acc_o = $signed(y_final);
endmodule
