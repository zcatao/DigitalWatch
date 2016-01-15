/*****************************************
ģ������watch_cnt
��д�ߣ�zcatao
��дʱ�䣺2016��1��15�� 10:31:36
���룺
    1Khzʱ��Դclk_1Khz
    �첽��λ�ź�rst
    ���Լ��̴��������
�����
    �͸���ʾģ������ݻ���dispbuf
ע�����

***********************************************/

module watch_cnt (
    input clk_1Khz,
    input rst,
    input [27:0] preset,
    input EN,
    input load,
    output [23:0] dispbuf
    );
    reg [3:0] minute1;
    reg [3:0] minute0;
    reg [3:0] sec1;
    reg [3:0] sec0;
    reg [3:0] msec2;
    reg [3:0] msec1;
    reg [3:0] msec0;
    //reg [35:0] Time;
    reg [6:0] cout; // ������λ���ֵĽ�λ
    wire[3:0] minute1_set,minute0_set,sec1_set,sec0_set,msec2_sec,msec1_sec,msec0_sec;
    //�����λ

    decimal_counter(.clk_cin(clk_1Khz),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset())











endmodule // watch_cnt
