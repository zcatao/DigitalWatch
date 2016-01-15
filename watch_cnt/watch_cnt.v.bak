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
    input [3:0]Command,
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
    //毫秒个位
    always @ (posedge clk_1Khz or posedge rst) begin
      if (rst) begin
          msec0 <= 0;
          cout <= 0;
      end else if (msec0 == 4'd9) begin
          msec0 <= 0;
          cout[0] <= 1;
      end else begin
          msec0 <= msec0 + 1;
          cout[0] < = 0;
      end
    end
    //毫秒十位
    always @ (posedge cout[0] or posedge rst) begin
        if(rst) begin
            msec1 <= 0;
            cout[1] <= 0;
        end else if (msec1 == 4'd9) begin
            msec1 <= 0;
            cout[1] <= 1;
        end else begin
            msec1 <= msec1 + 1;
            cout[1] <= 0;
        end
    end










endmodule // watch_cnt
