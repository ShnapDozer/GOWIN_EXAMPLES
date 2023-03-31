
module pwm #(
    parameter WIDTH = 7,
    parameter DELAY = 1000
) (
    input CLK,
    output we,
    output out
);

reg [WIDTH-1:0] cnt = 1'h0;

assign we = cnt == {WIDTH{1'b1}};
assign out = cnt < DELAY;

always @(posedge CLK) begin
    cnt <= we ? 0 : cnt + 1'b1;
end

endmodule