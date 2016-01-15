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
    wire [3:0] minute1,minute0,sec1,sec0,msec2,msec1,msec0;
    // wire [3:0] minute0;
    // wire [3:0] sec1;
    // reg [3:0] sec0;
    // reg [3:0] msec2;
    // reg [3:0] msec1;
    // reg [3:0] msec0;
    //reg [35:0] Time;
    wire [6:0] cout; // ������λ���ֵĽ�λ
    wire[3:0] minute1_set,minute0_set,sec1_set,sec0_set,msec2_set,msec1_set,msec0_set;
    //�����λ

    decimal_counter(.clk_cin(clk_1Khz),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset(msec0_set),
                    .out(msec0),
                    .cout(cout[0])
                    );
    //����ʮλ
    decimal_counter(.clk_cin(cout[0]),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset(msec1_set),
                    .out(msec1),
                    .cout(cout[1])
                    );
    //�����λ
    decimal_counter(.clk_cin(cout[1]),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset(msec2_set),
                    .out(msec2),
                    .cout(cout[2])
                    );

    //���λ
    decimal_counter(.clk_cin(cout[2]),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset(sec0_set),
                    .out(sec0),
                    .cout(cout[3])
                    );
    //��ʮλ
    Six_counter(.clk_cin(cout[3]),
                .rst(rst),
                .EN(EN),
                .load(load),
                .preset(sec1_set),
                .out(sec1),
                .cout(cout[4])
                );
    //�ָ�λ
    decimal_counter(.clk_cin(cout[4]),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset(minute0_set),
                    .out(minute0),
                    .cout(cout[5])
                    );
    //��ʮλ
    Six_counter(.clk_cin(cout[5]),
                .rst(rst),
                .EN(EN),
                .load(load),
                .preset(minute1_set),
                .out(minute1),
                .cout(cout[6])
                );
    assign dispbuf = {minute1,minute0,sec1,sec0,msec2,msec1};
    assign preset = {minute1_set,minute0_set,sec1_set,sec0_set,msec2_set,msec1_set,msec0_set};


endmodule // watch_cnt
