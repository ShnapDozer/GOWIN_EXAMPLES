module I2C_clock_devire #(
    parameter WIDTH = 10,
    parameter DELAY = 10 
) (
    input wire  ref_clk,
    output reg  i2c_clk
);
    reg[WIDTH-1:0] counter;

    initial begin
        counter <= 0;
        i2c_clk <= 0;
    end

    always @(posedge ref_clk) begin
        if(counter == DELAY - 1) begin
            i2c_clk <= ~i2c_clk;
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end

endmodule