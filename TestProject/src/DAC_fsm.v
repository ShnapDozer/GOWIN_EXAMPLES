module DAC_fsm 
#(
    parameter           I2C_RW_STATE = 0, // I2C read/write state (0-write)
    parameter    [6:0]  I2C_DEVICE_ADDR = 7'b001_0000, // I2C device address
    parameter    [7:0]  I2C_REG_ADDR = 8'b0000_0101, // I2C register address
    parameter    [15:0] I2C_WRITE_DATA = 16'b0000_0000_1000_1001, // I2C data to write
    parameter    [15:0] I2C_DIVIDER = 16'd30 // for 50mg to 400kg
)
(
    input       i_clk,
    input       i_rst,

    inout       io_sda,
    inout       io_scl
);
    // flags:
    wire i2c_busy;
    reg i2c_enable;
    reg i2c_rw_state;

    reg [15:0] i2c_divider;

    // addreses:
    reg [6:0] i2c_device_addr;
    reg [7:0] i2c_register_addr;

    // in/out data
    reg [15:0] i2c_in_mosi_data;
    wire [15:0] i2c_out_miso_data;
    
    i2c_master_git #(
        .REG_WIDTH(8),
        .ADDR_WIDTH(7), 
        .DATA_WIDTH(16)
        ) 
        i2c_DAC(
            .i_clk(i_clk),
            .i_rst(i_rst),
            .i_enable(i2c_enable),
            .i_rw(i2c_rw_state),
            .i_mosi_data(i2c_in_mosi_data),
            .i_reg_addr(i2c_register_addr),
            .i_device_addr(i2c_device_addr),
            .i_divider(i2c_divider),
            .o_miso_data(i2c_out_miso_data),
            .o_busy(i2c_busy),
            .io_sda(io_sda),
            .io_scl(io_scl)
        );

    reg [3:0] state;
    reg [3:0] nextState;

    localparam [3:0] S_IDLE             = 0;
    localparam [3:0] S_CHECK_BUSY       = 1;
    localparam [3:0] S_START_WORK       = 2;
    localparam [3:0] S_CHECK_COMPLETE   = 3;
    localparam [3:0] S_STOP             = 4;

    initial begin
        state <= S_IDLE;
        i2c_enable <= 0; 
    end

    // Блок обновления состояний
    always @(posedge i_clk or posedge i_rst) begin
        if(i_rst)   state <= S_IDLE;
        else        state <= nextState;
    end

    // Комбинаторный блок перехода состояний
    always @(*) begin
        case(state)
            S_IDLE: begin // Устанавливаем начальные значения
                nextState <= S_CHECK_BUSY;
            end

            S_CHECK_BUSY: begin // Смотрим на флаг загрузки, если опущен - начинаем пересылку
                if(i2c_busy == 0) nextState <= S_START_WORK;
                else nextState <= state;
            end

            S_START_WORK: begin // Смотрим на флаг загрузки, если поднял - началась пересылка
                if(i2c_busy == 1) nextState <= S_CHECK_COMPLETE;
                else nextState <= state;
            end

            S_CHECK_COMPLETE: begin // Ждем окончания операции по флагу загруженности
                if(i2c_busy == 0) nextState <= S_IDLE;
                else nextState <= state;
            end

            S_STOP: begin // Останавливаем машину
                nextState <= state;
            end

            default: begin
                nextState = state;
            end

        endcase
    end

    // Блок выставление выходов
    always @(posedge i_clk or posedge i_rst) begin 
        if(i_rst) begin
            i2c_rw_state <= 1'b0;           //write operation
            i2c_register_addr <= 8'h00;     //writing to slave register 0
            i2c_in_mosi_data <= 16'h0000;      //data to be written
            i2c_device_addr <= 7'b0000000;  //slave address
            i2c_divider <= 16'h0000;        //divider value for i2c serial clock

            i2c_enable <= 0;                //enable to start
        end
        else begin
            case(state)
                S_IDLE: begin
                    i2c_rw_state <= I2C_RW_STATE;           //write operation
                    i2c_register_addr <= I2C_REG_ADDR;      //writing to slave register 0
                    i2c_in_mosi_data <= I2C_WRITE_DATA;     //data to be written
                    i2c_device_addr <= I2C_DEVICE_ADDR;     //slave address
                    i2c_divider <= I2C_DIVIDER;             //divider value for i2c serial clock
                end
            
                S_CHECK_BUSY: begin // Смотрим на флаг загрузки, если опущен - выставляем регистр enable
                    if(i2c_busy == 0)  begin 
                        i2c_enable <= 1; 
                    end
                end

                S_START_WORK: begin // Смотрим на флаг загрузки, если поднят -> началась пересылка убираем флаг enable
                    if(i2c_busy == 1) begin 
                        i2c_enable <= 0; 
                    end
                end

                S_CHECK_COMPLETE: begin // Ничего не делаем
                    
                end

                S_STOP: begin // Останавливаем машину
                    
                end

                default: begin
                    i2c_enable <= 1'bX; 

                    i2c_rw_state <= 1'bX;       //write operation
                    i2c_register_addr <= 1'bX;  //writing to slave register 0
                    i2c_in_mosi_data <= 1'bX;   //data to be written
                    i2c_device_addr <= 1'bX;    //slave address
                    i2c_divider <= 1'bX;        //divider value for i2c serial clock
                end
            endcase
        end
    end

endmodule