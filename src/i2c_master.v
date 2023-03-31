module I2C_master(
    input clk,
    input reset,
    output reg i2c_sda,
    output wire i2c_scl
);

    localparam IDLE_STATE   = 0;
    localparam START_STATE  = 1;
    localparam ADDRES_STATE = 2;
    localparam RW_STATE     = 3;
    localparam WACK_STATE   = 4;
    localparam DATA_STATE   = 5;
    localparam STOP_STATE   = 6;

    reg[7:0] state;
    reg[6:0] addres;
    reg[2:0] count;
    reg[7:0] data;

    reg scl_enable;

    assign i2c_scl = scl_enable == 0 ? 1 : ~clk;

    // for tests
    initial begin
        state <= IDLE_STATE;

        addres = 7'b1100101;
        data = 8'b11001010;
        count <= 3'b0;
    end

    // scl
    always @(negedge clk) begin
        if(reset) begin 
            scl_enable <= 0;
        end else begin
            if((state == IDLE_STATE) || (state == START_STATE) || (state == STOP_STATE)) begin
                scl_enable <= 0;
            end else begin
                scl_enable <= 1;
            end
        end
    end

    //sda
    always @(posedge clk) begin
        if(reset) begin 
            state <= IDLE_STATE;

            addres = 7'b1100101;
            data = 8'b11001010;
            count <= 3'b0;

            i2c_sda <= 1;
        end else begin
            case(state)
                IDLE_STATE: begin 
                    i2c_sda <= 1;

                    state <= START_STATE;
                end // Idle 

                START_STATE: begin  
                    i2c_sda <= 0; // bug (has 1)?
                    count <= 3'd6;
                    
                    state <= ADDRES_STATE;
                end // Start

                ADDRES_STATE: begin
                    i2c_sda <= addres[count];
                    if(count == 3'b0) state <= RW_STATE;
                    else count = count - 1;
                end

                RW_STATE: begin
                    i2c_sda <= 1; // read?
                    
                    state <= WACK_STATE;
                end // RW

                WACK_STATE: begin                    
                    count <= 3'd7;

                    state <= DATA_STATE;
                end // Wait ACK

                DATA_STATE: begin
                    i2c_sda <= data[count]; 
                    if(count == 3'b0) state <= STOP_STATE;
                    else count = count - 1;
                end // Data

                STOP_STATE: begin
                    i2c_sda <= 1;
                    
                    state <= IDLE_STATE;
                end // Stop

                default: begin
                    i2c_sda <= 1;
                    
                    state <= IDLE_STATE;
                end

            endcase        
        end
    end
endmodule