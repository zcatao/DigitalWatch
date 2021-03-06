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
module clk_div(
    input clk_50Mhz,
    input rst,
    output clk_1Khz
    );

    reg clk_out;
    integer cnt = 1'b0;
    parameter integer clk_div = 32'd250;

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
