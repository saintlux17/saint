`timescale 1ns / 1ps

module adder_new #(parameter N = 36)(
input clk, 
input rstn,
input vld_i,
input[8*N-1 :0] din,
output[21:0] acc_o,
output       vld_o
);

//----------------------------------------------------------------------
// Signals
//----------------------------------------------------------------------
// Level 1 - 18, 17bit
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


// Level 2 - 9, 18bit
reg [17:0] y2_0;
reg [17:0] y2_1;
reg [17:0] y2_2;
reg [17:0] y2_3;
reg [17:0] y2_4;
reg [17:0] y2_5;
reg [17:0] y2_6;
reg [17:0] y2_7;
reg [17:0] y2_8;


// Level 3 - 4, 19bit
reg [18:0] y3_0;
reg [18:0] y3_1;
reg [18:0] y3_2;
reg [18:0] y3_3;


// Level 4 - 2, 20bit
reg [19:0] y4_0;
reg [19:0] y4_1;


//Level 5.- 1, 21bit
reg [20:0] y5_0;

//Level 6 - final output => (y2_8 + y5_0);
reg [21:0] y_final;


// Delays
reg vld_i_d1, vld_i_d2, vld_i_d3, vld_i_d4, vld_i_d5, vld_i_final;

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
	end
end

// Level 3
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y3_0 <= 19'd0;
		y3_1 <= 19'd0;
		y3_2 <= 19'd0;
		y3_3 <= 10'd0;
	end
	else begin 
		y3_0 <= $signed(y2_0) + $signed(y2_1);
		y3_1 <= $signed(y2_2) + $signed(y2_3);
		y3_2 <= $signed(y2_4) + $signed(y2_5);
		y3_3 <= $signed(y2_6) + $signed(y2_7);
	end
end
// Level 4
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y4_0 <= 21'd0;
		y4_1 <= 21'd0;
    end
	else begin
		y4_0 <= $signed(y3_0) + $signed(y3_1);
		y4_1 <= $signed(y3_2) + $signed(y3_3);
	end
end

//Level 5
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y5_0 <= 21'd0;
    end
	else begin
		y5_0 <= $signed(y4_0) + $signed(y4_1);
	end
end

//Level 6
always@(posedge clk, negedge rstn) begin
	if(!rstn) begin
		y_final <= 22'd0;
    end
	else begin
		y_final <= $signed(y5_0) + $signed(y2_8);
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
		vld_i_d4 <= 0;å
		vld_i_d5 <= 0;
		vld_i_final <= 0;
	end
	else begin 
		vld_i_d1 <= vld_i;
		vld_i_d2 <= vld_i_d1;
		vld_i_d3 <= vld_i_d2;
		vld_i_d4 <= vld_i_d3;
		vld_i_d5 <= vld_i_d4;
		vld_i_final <= vld_i_d5;	
	end
end

//Output
assign vld_o = vld_i_final;
assign acc_o = $signed(y_final);
endmodule
