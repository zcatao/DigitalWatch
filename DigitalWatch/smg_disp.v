/**********************************************
模块名：smg_disp
编写者：yangsongtao
编写时间: 2016年1月15日13:12:57
描述:
    输出控制器
输入：
    来自计数器的显示总线Watch_cnt_disp
输出:
    数码管输出信号线disp_out
版本：
    1.0 简单输出计数器的值
注意事项：

***********************************************/
module smg_disp (
    input[23:0] Watch_cnt_disp,
    output[23:0] disp_out
    );

    assign disp_out = Watch_cnt_disp;
endmodule // smg_disp