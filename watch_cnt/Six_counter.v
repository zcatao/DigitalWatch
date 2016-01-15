/*****************************************
模块名：Six_counter
编写者：zcatao
编写时间：2016年1月15日10:47:39
描述:
    一位六进制计数器
输入：
    来自上一位的进位始终 clk_cin
    复位清零位rst
    计数使能位 EN
    预置数字装载位 load
    预置数字 preset
输出:
    计数值: out
    进位输出
注意事项：
***********************************************/
module Six_counter (
    input clk_cin,
    input rst,
    input EN,
    input load,
    input[3:0] preset,
    output[3:0] out,
    output cout
    );
    reg [3:0] out_dat;
    reg FULL;

    always @ (posedge clk_cin or posedge rst or posedge load) begin
        if (rst) begin
            out_dat <= 0;
            FULL <= 0;
        end else if (load) begin
            out_dat <= preset;
            FULL <= 0;
        end else if (EN) begin
            if(out_dat == 4'd6) begin
                out_dat <= 0;
                FULL <= 1;
            end
            else begin
                out_dat <= out_dat + 1;
                FULL <= 0;
            end
        end
    end

    assign out = out_dat;
    assign cout = FULL;
endmodule // Six_counter
