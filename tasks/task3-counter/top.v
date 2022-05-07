module top(
    input CLK,

    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G, DS_DP
);

// Общий счётчик-делитель для получения частот смены индикаторов и изменения значения счётчика 
reg [24:0]cnt = 0;
assign val_clk = cnt[24];
assign en_clk = cnt[15];
always @(posedge CLK) begin
    cnt <= cnt + 25'b1;
end

// 16-битное значение счётчика
reg [15:0]val = 0;
always @(posedge val_clk) begin
    val <= val + 16'b1;
end

// Последовательно переключаем индикаторы
wire [3:0]anodes;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~anodes;
reg [1:0]i = 0;
assign anodes = (4'b1 << i);
always @(posedge en_clk) begin
    i <= i + 2'b1;
end
// Выбор из шины i-ого набора из 4 бит
wire [3:0]val_i = val[i * 4 +: 4];

wire [7:0]segments;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G, DS_DP} = segments;

seg7 seg7(.data_i(val_i), .seg_o(segments));

endmodule