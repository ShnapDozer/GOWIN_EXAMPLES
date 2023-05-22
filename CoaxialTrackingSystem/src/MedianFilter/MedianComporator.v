module MedianComporator #(
    parameter DATA_WIDTH = 8
)(  
    input wire [DATA_WIDTH-1:0] dataA,
    input wire [DATA_WIDTH-1:0] dataB,

    output reg [DATA_WIDTH-1:0] high,
    output reg [DATA_WIDTH-1:0] low
);

    always @(*) begin
        case(dataA > dataB)
            0: begin
                high <= dataB;
                low <= dataA;
            end

            1:begin
                high <= dataA;
                low <= dataB;
            end

            default: begin
                high <= {DATA_WIDTH{1'b0}};
                low <= {DATA_WIDTH{1'b0}};
            end
        endcase
    
    end

endmodule

