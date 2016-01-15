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
    reg [3:0] minute1;
    reg [3:0] minute0;
    reg [3:0] sec1;
    reg [3:0] sec0;
    reg [3:0] msec2;
    reg [3:0] msec1;
    reg [3:0] msec0;
    //reg [35:0] Time;
    reg [6:0] cout; // 代表七位数字的进位
    wire[3:0] minute1_set,minute0_set,sec1_set,sec0_set,msec2_sec,msec1_sec,msec0_sec;
    //毫秒个位

    decimal_counter(.clk_cin(clk_1Khz),
                    .rst(rst),
                    .EN(EN),
                    .load(load),
                    .preset())











endmodule // watch_cnt
