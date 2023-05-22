module MedianFilter #(
    parameter DATA_WIDTH = 8,
    parameter DATA_SIZE = 9
)(
    input [(DATA_WIDTH*DATA_SIZE) - 1:0] inData,
    output reg [DATA_WIDTH - 1:0] outData
);
    
    wire [DATA_WIDTH-1:0] highBus [0:(DATA_SIZE / 3)];
    wire [DATA_WIDTH-1:0] medianBus [0:(DATA_SIZE / 3) - 1];
    wire [DATA_WIDTH-1:0] lowBus [0:(DATA_SIZE / 3)];
    wire [DATA_WIDTH-1:0] finishBus [0:(DATA_SIZE / 3) - 1];

    wire [DATA_WIDTH-1:0] median;
    
    wire [DATA_WIDTH-1:0] dataArray [0:DATA_SIZE-1];
    genvar i;
    generate 
        for (i = 0; i < DATA_SIZE; i = i+1) begin : arrayAssign
            assign dataArray[i] = inData[DATA_WIDTH*(i + 1) - 1:DATA_WIDTH*i];
        end
    endgenerate
    
    always @(*) begin
        outData <= median;
    end
    
    // First compair:
    MedianNode #(.DATA_WIDTH(DATA_WIDTH)) firstNode (
        .inData({dataArray[0], dataArray[1], dataArray[2]}),
        .high(highBus[0]),
        .median(medianBus[0]),
        .low(lowBus[0])
    );
    MedianNode #(.DATA_WIDTH(DATA_WIDTH)) secondNode (
        .inData({dataArray[3], dataArray[4], dataArray[5]}),
        .high(highBus[1]),
        .median(medianBus[1]),
        .low(lowBus[1])
    );
    MedianNode #(.DATA_WIDTH(DATA_WIDTH)) thirdNode (
        .inData({dataArray[6], dataArray[7], dataArray[8]}),
        .high(highBus[2]),
        .median(medianBus[2]),
        .low(lowBus[2])
    );
    
    // Low compair:
    MedianComporator #(.DATA_WIDTH(DATA_WIDTH)) lowComporator1 (
        .dataA(lowBus[0]),
        .dataB(lowBus[1]),

        .high(lowBus[3])
    );
    MedianComporator #(.DATA_WIDTH(DATA_WIDTH)) lowComporator2 (
        .dataA(lowBus[2]),
        .dataB(lowBus[3]),

        .high(finishBus[2])
    );

    // High compair:
    MedianComporator #(.DATA_WIDTH(DATA_WIDTH)) highComporator1 (
        .dataA(highBus[0]),
        .dataB(highBus[1]),

        .low(highBus[3])
    );
    MedianComporator #(.DATA_WIDTH(DATA_WIDTH)) highComporator2 (
        .dataA(highBus[2]),
        .dataB(highBus[3]),

        .low(finishBus[0])
    );

    // Median compair:
    MedianNode #(.DATA_WIDTH(DATA_WIDTH)) medianNode (
        .inData({medianBus[0], medianBus[1], medianBus[2]}),
        .median(finishBus[1])
    );    

    // Finish compair:
    MedianNode #(.DATA_WIDTH(DATA_WIDTH)) finishNode (
        .inData({finishBus[0], finishBus[1], finishBus[2]}),
        .median(median)
    );
endmodule