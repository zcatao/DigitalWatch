/**********************************************
模块名：key_Control
编写者：yangsongtao
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
    input clk,
    input key_start,
    input key_Record,
    input key_pause,
    input key_load,
    input[23:0] data_ram,
    input [23:0] watch_data,
    output [3:0]address,
    output rst,
    output EN,
    output load,
    output wren,
    //output[23:0] data_write,
    output[23:0] disp_out
    );
    //START按键信号状态
    //START->STOP->RESET->START
    parameter START = 2'b00,
              STOP = 2'b01,
              RESET = 2'b10;

    reg [1:0] Start_status;
    reg en_,rst_,load_,en__;
    reg disp_SEL;
    // WRSEL 读写选择
    // 00 没有读写任务
    // 01 有读写任务
    // 10 有写任务
    reg [1:0] WRSEL;
    reg [3:0]address_ = 4'b0;
    reg wren_;
    reg[23:0] data_read;
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
            START: begin
                    en_ <= 1; rst_ <= 0;
                    //en__ <= 1;
            end
            STOP : begin
                    en_ <= 0; rst_ <= 0;
                    //en__ <= 1'bz;
            end
            RESET: begin
                    en_ <= 0; rst_ <= 1;
                    //en__ <= 0;
            end
        endcase
    end

    always @ ( posedge key_Record ) begin
        case (Start_status)
            START:begin
                WRSEL <= 2'b10;
                  end
            STOP:begin
                WRSEL <= 2'B01;
                end
            default:begin
                WRSEL <= 2'B00;
			end
        endcase
    end

    always @ (posedge key_pause) begin
		if(Start_status == START)
			en__ <= ~ en__;
		else
			en__ <= 1;
    end
    parameter     STARTWRITE = 2'b01,
                  WRITEDATA = 2'b10,
                  FINISHWRITE = 2'b11,
                  PREWRITE = 2'b00;
    reg [1:0] Write_Status;
    parameter     READDATA = 2'b01,
                  FINISHREAD = 2'b10,
                  PREREAD = 2'b00;
    reg [1:0] Read_Status;

    always @ (posedge clk) begin
        case(Write_Status)
            PREWRITE:begin
                if(WRSEL == 2'b10) Write_Status <= STARTWRITE;
                else Write_Status <= PREWRITE;
            end
            STARTWRITE:begin
                if(WRSEL == 2'b10)
                    address_ <= address_ + 1'b1;
                else
                    address_ <= 4'bz;
                Write_Status <= WRITEDATA;
            end
            WRITEDATA:begin
                wren_ <= 1;
                Write_Status <= FINISHWRITE;
            end
            FINISHWRITE:begin
                wren_ <= 0;
                Write_Status <= PREWRITE;
            end
        endcase
    end

    always @ (posedge clk) begin
        case(Read_Status)
            PREREAD:begin
				disp_SEL <= 0;
                if(WRSEL == 2'b01) Read_Status <= READDATA;
                else Read_Status <= PREREAD;
            end
            READDATA:begin

                data_read <= data_ram;
                Read_Status <= FINISHREAD;
            end
            FINISHREAD:begin
                disp_SEL <= 1;
                if(WRSEL == 2'b10)
                    address_ <= address_ - 1'b1;
                else
                    address_ <= 4'bz;
                Read_Status <= PREREAD;
            end
        endcase
    end

    assign EN = en_&en__;
    assign rst = rst_;
    assign load = key_load;
    assign wren = wren_;
    //assign data_write = watch_data;
    assign address = address_;
    //disp_SEL 置位为一时 选择输出 RAM中读取的数据，否则输出Watch当前计数值
    assign disp_out = (disp_SEL) ? data_read : watch_data;

endmodule // key_Control
