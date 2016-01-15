/*****************************************
模块名：clk_div
编写者：zcataox
编写时间：2016年1月14日21:23:23
输入：
    50MHZ时钟源clk_50Mhz
    异步复位信号rst
输出：
    1KHZ时钟信号clk_1Khz
注意事项：
    默认rst复位信号高电平有效，若为低电平有效记得修改
    如果输入输出频率比有变化，可以修改clk_div实现
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
