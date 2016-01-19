/**********************************************
ģ������key_Control
��д�ߣ�zcatao
��дʱ�䣺2016��1��15��13:19:37
����:
    ���������������
���룺
    �������롪��START&STOP�ź�
    �������롪����ͣ�ź�
���:

    ��������λ����λrst
    ����������ʹ��λ EN
    ������Ԥ������װ��λ load
�汾��
    1.0 ��ͣ ��ʼ ֹͣ ��λ
ע�����
***********************************************/
module key_Control (
    input key_start,
    input key_pause,
    input key_load,
    output rst,
    output EN,
    output load
    );
    //START�����ź�״̬
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
