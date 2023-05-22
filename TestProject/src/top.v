module top (
    input       clk_50M,
    input       rst,

    input       [3:0]sw,

    inout       GPIO_01,
    inout       GPIO_02,
    inout       GPIO_03_SDA,
    inout       GPIO_04_SCL,

    inout       AD_DA_SDA,
    inout       AD_DA_SCL,

    output      reg [3:0]led
);

    DAC_fsm dac_fsm_ins (
            .i_clk(clk_50M),
            .i_rst(rst),
            .io_sda(AD_DA_SDA),
            .io_scl(AD_DA_SCL)
    );

    always @(posedge clk_50M) begin
        if(rst) led[0] <= 1;
        else led[0] <= 0;
    end

    assign GPIO_03_SDA = AD_DA_SDA;
    assign GPIO_04_SCL = AD_DA_SCL;


   
endmodule

