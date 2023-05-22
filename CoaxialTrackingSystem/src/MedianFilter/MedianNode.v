module MedianNode #(
    parameter DATA_WIDTH = 8,
    parameter DATA_SIZE = 3
)(
    input [(DATA_WIDTH*DATA_SIZE)-1:0] inData,

    output [DATA_WIDTH-1:0] high,
    output [DATA_WIDTH-1:0] median,
    output [DATA_WIDTH-1:0] low
);
    wire [DATA_WIDTH-1:0] highLeft;
    wire [DATA_WIDTH-1:0] highMiddle;
    wire [DATA_WIDTH-1:0] lowLeft;
    
    wire [DATA_WIDTH-1:0] dataArray [0:2];
    genvar i;
    generate 
        for (i = 0; i < DATA_SIZE; i= i+1) begin : arrayAssign
            assign dataArray[i] = inData[DATA_WIDTH*(i + 1) - 1:DATA_WIDTH*i];
        end
    endgenerate
    
    MedianComporator #(.DATA_WIDTH(DATA_WIDTH)) left (
        .dataA(dataArray[0]),
        .dataB(dataArray[1]),
        
        .high(highLeft),
        .low(lowLeft)
    );

    MedianComporator #(.DATA_WIDTH(DATA_WIDTH)) middle (
        .dataA(lowLeft),
        .dataB(dataArray[2]),

        .high(highMiddle),
        .low(low)
    );

    MedianComporator #(.DATA_WIDTH(DATA_WIDTH)) right (
        .dataA(highLeft),
        .dataB(highMiddle),

        .high(high),
        .low(median)
    );
                         
endmodule