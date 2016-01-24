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
    output rst,
    output EN,
    output load,
    output wren,
    output[23:0] data_write,
    output[23:0] disp_out
    );
    //START按键信号状态
    //START->STOP->RESET->START
    parameter START = 2'b00,
              STOP = 2'b01,
              RESET = 2'b10;

    reg [1:0] Start_status;
    reg en_,rst_,load_;
    reg disp_SEL,writedata,readdata;
    reg address;
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
            end
            STOP : begin
                    en_ <= 0; rst_ <= 0;
            end
            RESET: begin
                    en_ <= 0; rst_ <= 1;
            end
        endcase
    end

    always @ ( posedge key_Record ) begin
        case (Start_status)
            START:begin               
                        writedata = 1'b1;
                        readdata = 1'bz;
                  end
            STOP:begin
						writedata = 1'bz;
                        readdata = 1'b1;
                end
            default:begin
						writedata = 1'bz;
						readdata = 1'bz;
			end
        endcase
    end

    // always @ (key_pause) begin
    //     en_ <= ~ en_;
    // end
    parameter reg STARTWRITE = 2'b01,
                  WRITEDATA = 2'b10,
                  FINISHWRITE = 2'b11,
                  PREWRITE = 2'b00;
    reg [1:0] Write_Status;
    parameter reg READDATA = 2'b01,
                  FINISHREAD = 2'b10,
                  PREREAD = 2'b00;
    reg [1:0] Read_Status;

    always @ (posedge clk) begin
        case(Write_Status)
            PREWRITE:begin
            writedata <= 1'bz;
                if(writedata) Write_Status <= STARTWRITE;
                else Write_Status <= PREWRITE;
            end
            STARTWRITE:begin
                address <= address + 1;writedata <= 1'bz;
                Write_Status <= WRITEDATA;
            end
            WRITEDATA:begin
                wren_ <= 1;writedata <= 1'bz;
                Write_Status <= FINISHWRITE;
            end
            FINISHWRITE:begin
                wren_ <= 0; writedata <= 1'b0;
                Write_Status <= PREWRITE;
            end
        endcase
    end

    always @ (posedge clk) begin
        case(Read_Status)
            PREREAD:begin
				disp_SEL <= 0;
				readdata <= 1'bz;
                if(readdata) Read_Status <= READDATA;
                else Read_Status <= PREREAD;
            end
            READDATA:begin
				readdata <= 1'bz;
                data_read <= data_ram;
                Read_Status <= FINISHREAD;
            end
            FINISHREAD:begin
                disp_SEL <= 1;
                readdata <= 1'b0;
                address <= address + 1;
                Read_Status <= PREREAD;
            end
        endcase
    end

    assign EN = en_;
    assign rst = rst_;
    assign load = key_load;
    assign wren = wren_;
    //disp_SEL 置位为一时 选择输出 RAM中读取的数据，否则输出Watch当前计数值
    assign disp_out = (disp_SEL) ? data_read : data_write;

endmodule // key_Control
