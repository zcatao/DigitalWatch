/**********************************************
模块名：key_Control
编写者：zcatao
编写时间：2016年1月15日13:19:37
描述:
    键盘输入和秒表控制
输入：
    键盘输入——START&STOP信号
    键盘输入——暂停信号
输出:

    计数器复位清零位rst
    计数器计数使能位 EN
    计数器预置数字装载位 load
版本：
    1.0 暂停 开始 停止 复位
注意事项：
***********************************************/
module key_Control (
    input key_start,
    input key_pause,
    input key_load,
    output rst,
    output EN,
    output load,
    );
    //START按键信号状态
    //START->STOP->RESET->START
    parameter START = 2'b00,
              STOP = 2'b01,
              RESET = 2'b10;

    reg [1:0] Start_status;
    always @ (posedge key_start) begin
        case (Start_status)
            START: Start_status <= STOP;
            STOP : Start_status <= RESET;
            RESET: Start_status <= START;
            default:Start_status <= START ;
        endcase
    end
    always @ ( * ) begin
        case (Start_status)
            START: EN <= 1
    end

    assign load = key_load;

endmodule // key_Control
