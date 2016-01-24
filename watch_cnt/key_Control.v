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
    output load
    );
    //START按键信号状态
    //START->STOP->RESET->START
    reg en_,rst_;
    parameter START = 2'b10,
              STOP = 2'b10,
              RESET = 2'b11;

    reg [1:0] Start_status;
    always @ (posedge key_start) begin
        case (Start_status)
            START: Start_status <= STOP;
            STOP : Start_status <= RESET;
            RESET: Start_status <= START;
            default:Start_status <= START;
        endcase
    end
    always @ ( * ) begin
        case (Start_status)
            START: begin
                        en_ <= 1; rst_ <= 0;
                   end
            STOP : begin
                        en_ <= 0; rst_ <= 0;
                   end
            RESET: begin
                        en_ <= 0; rst_ <= 1;
                   end
        endcase
    end
    assign EN = en_;
    assign rst = rst_;
    assign load = key_load;

endmodule // key_Control
