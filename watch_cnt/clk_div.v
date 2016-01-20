/*****************************************
ģ������clk_div
��д�ߣ�zcataox
��дʱ�䣺2016��1��14��21:23:23
���룺
    50MHZʱ��Դclk_50Mhz
    �첽��λ�ź�rst
�����
    1KHZʱ���ź�clk_1Khz
ע�����
    Ĭ��rst��λ�źŸߵ�ƽ��Ч����Ϊ�͵�ƽ��Ч�ǵ��޸�
    ����������Ƶ�ʱ��б仯�������޸�clk_divʵ��
***********************************************/
module clk_div(
    input clk_50Mhz,
    input rst,
    output clk_1Khz
    );

    reg clk_out;
    integer cnt = 1'b0;
    parameter integer clk_div = 32'd25000;

    always@(posedge clk_50Mhz or posedge rst) begin
        if(rst) begin
            cnt <= 0;
            clk_out <= 0;
        end else begin
            if (cnt < clk_div) begin
                cnt <= cnt + 1;
            end else begin
                cnt <= 1'b0 ;
                clk_out = ~ clk_out;
            end
        end
    end

    assign clk_1Khz = clk_out;
endmodule