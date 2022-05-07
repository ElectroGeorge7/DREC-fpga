// Декодер двоичного числа в hex цифру на индикаторе

module seg7(

	input [3:0]data_i,
	
	output reg [7:0]seg_o 
);

always @(*) begin
	case (data_i)
		4'h00: seg_o = 8'b11111100;
		4'h01: seg_o = 8'b01100000;
		4'h02: seg_o = 8'b11011010;
		4'h03: seg_o = 8'b11110010;
		4'h04: seg_o = 8'b01100110;
		4'h05: seg_o = 8'b10110110;
		4'h06: seg_o = 8'b10111110;
		4'h07: seg_o = 8'b11100000;
		4'h08: seg_o = 8'b11111110;
		4'h09: seg_o = 8'b11110110;
		4'h0A: seg_o = 8'b11101111;
		4'h0B: seg_o = 8'b11111111;
		4'h0C: seg_o = 8'b10011101;
		4'h0D: seg_o = 8'b11111101;
		4'h0E: seg_o = 8'b10011111;
		4'h0F: seg_o = 8'b10001111;
		default: seg_o = 8'b00000000;
	endcase
end

endmodule