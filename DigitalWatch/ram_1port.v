


module ram_1port(
    input [3:0] address,
    input       clk,
    input [23:0]data,
    input       wren,
    output[23:0]q
    );

    reg[23:0] mem[7:0];

    always @ (posedge clk) begin
        if(wren)
            mem[address] <= data;
    end

    assign q = mem[address];

endmodule
