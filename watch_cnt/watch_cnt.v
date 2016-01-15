/*****************************************
ģ������watch_cnt
��д�ߣ�zcatao
��дʱ�䣺2016��1��15�� 10:31:36
���룺
    1Khzʱ��Դclk_1Khz
    �첽��λ�ź�rst
    ���Լ��̴��������
�����
    �͸���ʾģ������ݻ���dispbuf
ע�����

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
    reg [6:0] cout; // ������λ���ֵĽ�λ
    //�����λ
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
    //����ʮλ
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
