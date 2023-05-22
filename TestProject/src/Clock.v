module Clock( 
    input   CLK,
    input   RST,
    input   [1:0] opsw,
    output  new_clk
);
    parameter c_CNT_100HZ = 100000000;
    parameter c_CNT_50HZ  = 50000000;
    parameter c_CNT_10HZ  = 25000000;
    parameter c_CNT_1HZ   = 12500000;

    // These signals will be the counters:
    reg [31:0] r_CNT_100HZ = 0;
    reg [31:0] r_CNT_50HZ = 0;
    reg [31:0] r_CNT_10HZ = 0;
    reg [31:0] r_CNT_1HZ = 0;

    // These signals will toggle at the frequencies needed:
    reg        r_TOGGLE_100HZ = 1'b0;
    reg        r_TOGGLE_50HZ  = 1'b0;
    reg        r_TOGGLE_10HZ  = 1'b0;
    reg        r_TOGGLE_1HZ   = 1'b0;

    // One bit select
    reg        r_LED_SELECT;
 
    always @ (posedge CLK)
    begin
      if (r_CNT_100HZ == c_CNT_100HZ-1) begin        
          r_TOGGLE_100HZ <= !r_TOGGLE_100HZ;
          r_CNT_100HZ    <= 0;
        end
      else
        r_CNT_100HZ <= r_CNT_100HZ + 1;
    end


    always @ (posedge CLK)
    begin
      if (r_CNT_50HZ == c_CNT_50HZ-1) // -1, since counter starts at 0
        begin        
          r_TOGGLE_50HZ <= !r_TOGGLE_50HZ;
          r_CNT_50HZ    <= 0;
        end
      else
        r_CNT_50HZ <= r_CNT_50HZ + 1;
    end


    always @ (posedge CLK)
    begin
      if (r_CNT_10HZ == c_CNT_10HZ-1) // -1, since counter starts at 0
        begin        
          r_TOGGLE_10HZ <= !r_TOGGLE_10HZ;
          r_CNT_10HZ    <= 0;
        end
      else
        r_CNT_10HZ <= r_CNT_10HZ + 1;
    end


    always @ (posedge CLK)
    begin
      if (r_CNT_1HZ == c_CNT_1HZ-1) // -1, since counter starts at 0
        begin        
          r_TOGGLE_1HZ <= !r_TOGGLE_1HZ;
          r_CNT_1HZ    <= 0;
        end
      else
        r_CNT_1HZ <= r_CNT_1HZ + 1;
    end

    always @ (*)
    begin
    case (opsw) 
      2'b11 : r_LED_SELECT <= r_TOGGLE_1HZ;
      2'b10 : r_LED_SELECT <= r_TOGGLE_10HZ;
      2'b01 : r_LED_SELECT <= r_TOGGLE_50HZ;
      2'b00 : r_LED_SELECT <= r_TOGGLE_100HZ;
    endcase     
    end
    
    assign new_clk = r_LED_SELECT;

endmodule