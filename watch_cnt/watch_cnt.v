/*****************************************
模块名：watch_cnt
编写者：zcatao
编写时间：2016年1月15日 10:31:36
输入：
    1Khz时钟源clk_1Khz
    异步复位信号rst
    来自键盘处理的命令
输出：
    送给显示模块的数据缓存dispbuf
注意事项：

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
    wire [6:0] cout; // 代表七位数字的进位
    wire[3:0] minute1_set,minute0_set,sec1_set,sec0_set,msec2_set,msec1_set,msec0_set;
    //毫秒个位

    decimal_counter(.clk_cin(clk_1Khz),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset(msec0_set),
                    .out(msec0),
                    .cout(cout[0])
                    );
    //毫秒十位
    decimal_counter(.clk_cin(cout[0]),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset(msec1_set),
                    .out(msec1),
                    .cout(cout[1])
                    );
    //毫秒百位
    decimal_counter(.clk_cin(cout[1]),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset(msec2_set),
                    .out(msec2),
                    .cout(cout[2])
                    );

    //秒个位
    decimal_counter(.clk_cin(cout[2]),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset(sec0_set),
                    .out(sec0),
                    .cout(cout[3])
                    );
    //秒十位
    Six_counter(.clk_cin(cout[3]),
                .rst(rst),
                .EN(EN),
                .load(load),
                .preset(sec1_set),
                .out(sec1),
                .cout(cout[4])
                );
    //分个位
    decimal_counter(.clk_cin(cout[4]),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset(minute0_set),
                    .out(minute0),
                    .cout(cout[5])
                    );
    //分十位
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
