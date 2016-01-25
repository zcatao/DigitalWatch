/*****************************************
模块名：DigitalWatch
编写者：yangsongtao
编写时间：2016年1月15日17:00:58
描述：
    数字秒表的顶层文件
输入：
    键盘输入——START&STOP信号
    键盘输入——暂停信号
输出：
    数码管输出——disp_out
注意事项：
***********************************************/
module DigitalWatch (
    input clk_50Mhz,
    input key_start,
    input key_pause,
    input key_load,
    input key_Record,
    output[23:0] disp_out
    );
    //时钟计数需要的1KHZ时钟
    wire clk_1Khz;
    //时钟控制信号
    wire rst,EN,load;
    wire [23:0] dispbuf;
    wire [3:0] address;
    wire [23:0] data_out;
    wire ram_wren;
    wire [23:0] watch_data;

    parameter preset = 28'h1234567;

    clk_div fdiv(.clk_50Mhz(clk_50Mhz),
                 .rst(rst),
                 .clk_1Khz(clk_1Khz)
                 );
    key_Control Control(.clk(clk_50Mhz),
                        .key_start(key_start),
                        .key_pause(key_pause),
                        .key_load(key_load),
                        .key_Record(key_Record),
                        .data_ram(data_out),
                        //.data_write(data_in),
                        .watch_data(watch_data),
                        .disp_out(dispbuf),
                        .wren(ram_wren),
                        .address(address),
                        .rst(rst),
                        .EN(EN),
                        .load(load)
                        );
    watch_cnt cnt(.clk_1Khz(clk_1Khz),
                  .rst(rst),
                  .EN(EN),
                  .load(load),
                  .preset(preset),
                  .dispbuf(watch_data)
                  );
    smg_disp disp(.clk(clk_50Mhz),
                  .Watch_cnt_disp(dispbuf),
                  .disp_out(disp_out)
                  );
    ram_1port ram(.address(address),
                  .clk(clk_50Mhz),
                  .data(watch_data),

                  .wren(ram_wren),
                  .q(data_out)
                  );

endmodule // DigitalWatch
