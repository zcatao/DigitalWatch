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
module watch_cnt (
    input clk_1Khz,
    input rst,
    input pause,
    output[23:0] dispbuf
    );

    reg[:0] hour;
    reg [3:0] minute
    reg [3:0] sec;
    reg [3:right_range] name;




endmodule // watch_cnt
