`resetall

module top (
    input hClk,//System Clock
    input hRstN, //System Reset 

    inout [15:0] GPIO, //GPIO

    //Debug Access Port
    inout JTAG_7,   //tms   |       swdio
    inout JTAG_9,   //tck   |       swclk

    //UART0
    input UART0RXD,
    output UART0TXD,

    //UART1
    input UART1RXD,
    output UART1TXD,

    //I2C Master
    inout SCL,
    inout SDA,

    //SPI Master
    output MOSI,   // SPI output
    input MISO,    // SPI input
    output SCLK,   // SPI clock
    output NSS,    // SPI chip select

    //SPI-Flash
    inout FLASH_SPI_HOLDN,
    inout FLASH_SPI_CSN,
    inout FLASH_SPI_MISO,
    inout FLASH_SPI_MOSI,
    inout FLASH_SPI_WPN,
    inout FLASH_SPI_CLK,
    
    output LED
);
    wire [31:0] dataOut;

    //-------------------------AHB2 Extension----------------------//
    wire        AHB2HCLK;        // Bus clock signal
    wire        AHB2HRESET;      // Bus reset signal
    wire        AHB2HSEL;        // Select
    wire        AHB2HWRITE;      // Transfer direction
    wire [2:0]  AHB2HSIZE;       // Transfer size
    wire [2:0]  AHB2HBURST;      // Burst type
    wire [3:0]  AHB2HPROT;       // Transfer protection bits
    wire [1:0]  AHB2HTRANS;      // Transfer type
    wire [31:0] AHB2HADDR;       // Transfer address
    wire [31:0] AHB2HRDATA;      // Data from slave to master
    wire [31:0] AHB2HWDATA;      // Data from master to slave
    wire        AHB2HREADYMUX;   // Ready mux signal
    wire        AHB2HREADYOUT;   // Slave ready signal
    wire [1:0]  AHB2HRESP;       // Slave response signal  

    wire        AHB2HMASTLOCK;   // Transfer is a locked transfer
    wire [3:0]  AH2BHMASTER;     // Transfer is a locked transfer

    //--------------------AXI Signal---------------------------//
    wire [31:0] AXI_ARADDR;
    wire [2:0]  AXI_ARPROT;
    wire        AXI_ARREADY;
    wire        AXI_ARVALID;
    wire [31:0] AXI_AWADDR;
    wire [2:0]  AXI_AWPROT;
    wire        AXI_AWREADY;
    wire        AXI_AWVALID;
    wire        AXI_BREADY;
    wire [1:0]  AXI_BRESP;
    wire        AXI_BVALID;
    wire [31:0] AXI_RDATA;
    wire        AXI_RREADY;
    wire [1:0]  AXI_RRESP;
    wire        AXI_RVAILD;
    wire [31:0] AXI_WDATA;
    wire        AXI_WREADY;
    wire [3:0]  AXI_WSTRB;
    wire        AXI_WVALID;

    wire AHB2HRESP_0;
    wire AHB2HRESP_1;
    assign {AHB2HRESP_0, AHB2HRESP_1} = AHB2HRESP;

    AHB2AXI_Bridge ahb2AxiBridge (
		.AHB_HCLK(AHB2HCLK),            //input AHB_HCLK
		.AHB_HRESETN(AHB2HRESET),       //input AHB_HRESETN
		.AHB_HSEL(AHB2HSEL),            //input AHB_HSEL
		.AHB_HWRITE(AHB2HWRITE),        //input AHB_HWRITE
		.AHB_HSIZE(AHB2HSIZE),          //input [2:0] AHB_HSIZE
		.AHB_HBURST(AHB2HBURST),        //input [2:0] AHB_HBURST
		.AHB_HPROT(AHB2HPROT),          //input [3:0] AHB_HPROT
		.AHB_HTRANS(AHB2HTRANS),        //input [1:0] AHB_HTRANS
		.AHB_HADDR(AHB2HADDR),          //input [31:0] AHB_HADDR
		.AHB_HRDATA(AHB2HRDATA),        //output [31:0] AHB_HRDATA
		.AHB_HWDATA(AHB2HWDATA),        //input [31:0] AHB_HWDATA
		.AHB_HREADY(AHB2HREADYMUX),     //input AHB_HREADY
		.AHB_HREADYOUT(AHB2HREADYOUT),  //output AHB_HREADYOUT
		.AHB_HRESP(AHB2HRESP_0),        // ahb slave,output,should be 2bit:00:okay 01:error 10:retry 11:split

		.AXI_ACLK(AHB2HCLK),        // input AXI_ACLK
		.AXI_ARESETN(AHB2HRESET),   // input AXI_ARESETN

		.AXI_ARADDR(AXI_ARADDR),    // AXI Lite,read channel,address,output[31:0]
		// .AXI_ARBURST(AXI_ARBURST),  //output [1:0] AXI_ARBURST
		// .AXI_ARCACHE(AXI_ARCACHE),  //output [3:0] AXI_ARCACHE
		// .AXI_ARLEN(AXI_ARLEN),      //output [7:0] AXI_ARLEN
		// .AXI_ARLOCK(AXI_ARLOCK),    //output AXI_ARLOCK
		.AXI_ARPROT(AXI_ARPROT),    //output [2:0] AXI_ARPROT
		.AXI_ARREADY(AXI_ARREADY),  //input AXI_ARREADY
		// .AXI_ARSIZE(AXI_ARSIZE),    //output [2:0] AXI_ARSIZE
		.AXI_ARVALID(AXI_ARVALID),  //output AXI_ARVALID
		.AXI_AWADDR(AXI_AWADDR),    //output [31:0] AXI_AWADDR
		// .AXI_AWBURST(AXI_AWBURST),  //output [1:0] AXI_AWBURST
		// .AXI_AWCACHE(AXI_AWCACHE),  //output [3:0] AXI_AWCACHE
		// .AXI_AWLEN(AXI_AWLEN),      //output [7:0] AXI_AWLEN
		// .AXI_AWLOCK(AXI_AWLOCK),    //output AXI_AWLOCK
		.AXI_AWPROT(AXI_AWPROT),    //output [2:0] AXI_AWPROT
		.AXI_AWREADY(AXI_AWREADY),  //input AXI_AWREADY
		// .AXI_AWSIZE(AXI_AWSIZE),    //output [2:0] AXI_AWSIZE
		.AXI_AWVALID(AXI_AWVALID),  //output AXI_AWVALID
		.AXI_BREADY(AXI_BREADY),    //output AXI_BREADY
		.AXI_BRESP(AXI_BRESP),      //input [1:0] AXI_BRESP
		.AXI_BVALID(AXI_BVALID),    //input AXI_BVALID
		.AXI_RDATA(AXI_RDATA),      //input [31:0] AXI_RDATA
		.AXI_RLAST(1'b0),           //input AXI_RLAST
		.AXI_RREADY(AXI_RREADY),    //output AXI_RREADY
		.AXI_RRESP(AXI_RRESP),      //input [1:0] AXI_RRESP
		.AXI_RVAILD(AXI_RVAILD),    //input AXI_RVAILD
		.AXI_WDATA(AXI_WDATA),      //output [31:0] AXI_WDATA
		// .AXI_WLAST(AXI_WLAST),      //output AXI_WLAST
		.AXI_WREADY(AXI_WREADY),    //input AXI_WREADY
		.AXI_WSTRB(AXI_WSTRB),      //output [3:0] AXI_WSTRB
		.AXI_WVALID(AXI_WVALID)     //output AXI_WVALID
	);

    wire led;

    //---------------------------- AXI4-Lite Slave model --------------------//
    axi4_lite_slave_top # (
        .C_S00_AXI_DATA_WIDTH(32),
        .C_S00_AXI_ADDR_WIDTH(7)
    ) 
    u_axi4_lite_slave_top (
        //-- AXI4-Lite Global ----------------------------------------------
        .S00_AXI_ACLK(AHB2HCLK), 
        .s00_AXI_ARESETN(AHB2HRESET), 

        //--- AXI4-Lite Write Address Channel ------------------------------
        .S00_AXI_AWADDR(AXI_AWADDR[6:0]),   //input[6:0],32 registers
        .S00_AXI_AWPROT(AXI_AWPROT),        //input[2:0]
        .S00_AXI_AWVALID(AXI_AWVALID),      //input
        .S00_AXI_AWREADY(AXI_AWREADY),      //output

        //--- AXI4-Lite Write data Channel --------------------------------
        .S00_AXI_WDATA(AXI_WDATA),      //input[31:0]
        .S00_AXI_WSTRB(AXI_WSTRB),      //input[3:0]
        .S00_AXI_WVALID(AXI_WVALID),    //input
        .S00_AXI_WREADY(AXI_WREADY),    //output

        //--- AXI4-Lite Write response Channel ------------------------------
        .S00_AXI_BRESP(AXI_BRESP),      //output[1:0]
        .S00_AXI_BVALID(AXI_BVALID),    //output
        .S00_AXI_BREADY(AXI_BREADY),    //input

        //--- AXI4-Lite Read Address Channel ------------------------------
        .S00_AXI_ARADDR(AXI_ARADDR[6:0]),   //input[6:0]
        .S00_AXI_ARPROT(AXI_ARPROT),        //input[2:0]
        .S00_AXI_ARVALID(AXI_ARVALID),      //input
        .S00_AXI_ARREADY(AXI_ARREADY),      //output

        //--- AXI4-Lite Read Data Channel ------------------------------
        .S00_AXI_RDATA(AXI_RDATA),      //output[31:0]
        .S00_AXI_RRESP(AXI_RRESP),      //output[1:0]
        .S00_AXI_RVALID(AXI_RVAILD),    //output
        .S00_AXI_RREADY(AXI_RREADY),     //input

        .REGS(REGS),
        .inReg(dataOut)
    );

    //-------------------------Gowin_EMPU_M3_Top----------------------//
    wire clkin = hClk;	//Input 50MHz
    wire processClk;	//MCU 20MHz

    Gowin_rPLL u_Gowin_rPLL(
        .clkin(clkin),          //input 50MHz
        .clkout(processClk)   //MCU 20MHz
    );

    wire LOCKUP;
    wire HALTED;
    Gowin_EMPU_M3_Top processUnit (
        .LOCKUP(LOCKUP),
        .HALTED(HALTED),

        .HCLK(processClk),
        .hwRstn(hRstN),

        .GPIO(GPIO),

        .JTAG_7(JTAG_7),
        .JTAG_9(JTAG_9),

        .UART0RXD(UART0RXD),
        .UART0TXD(UART0TXD),

        .UART1RXD(UART1RXD),
        .UART1TXD(UART1TXD),

        .TIMER0EXTIN(1'b0),
        .TIMER1EXTIN(1'b0),

        .SCL(SCL),
        .SDA(SDA),

        .MOSI(MOSI),
        .MISO(MISO),
        .SCLK(SCLK),
        .NSS(NSS),

        .FLASH_SPI_HOLDN(FLASH_SPI_HOLDN),
        .FLASH_SPI_CSN(FLASH_SPI_CSN),
        .FLASH_SPI_MISO(FLASH_SPI_MISO),
        .FLASH_SPI_MOSI(FLASH_SPI_MOSI),
        .FLASH_SPI_WPN(FLASH_SPI_WPN),
        .FLASH_SPI_CLK(FLASH_SPI_CLK),

        .AHB2HRDATA(AHB2HRDATA),       // Data from slave to master
        .AHB2HREADYOUT(AHB2HREADYOUT), // Slave ready signal, from slave, 1'b1
        .AHB2HRESP(AHB2HRESP),         // Slave response signal  
        .AHB2HTRANS(AHB2HTRANS),       // Transfer type
        .AHB2HBURST(AHB2HBURST),       // Burst type
        .AHB2HPROT(AHB2HPROT),         // Transfer protection bits
        .AHB2HSIZE(AHB2HSIZE),         // Transfer size
        .AHB2HWRITE(AHB2HWRITE),       // Transfer direction
        .AHB2HREADYMUX(AHB2HREADYMUX), // Ready mux
        .AHB2HMASTLOCK(AHB2HMASTLOCK), // Transfer is a locked transfer
        .AHB2HMASTER(AH2BHMASTER),     // Transfer is a locked transfer
        .AHB2HADDR(AHB2HADDR),         // Transfer address
        .AHB2HWDATA(AHB2HWDATA),       // Data from master to slave AHB2HSEL,
        .AHB2HSEL(AHB2HSEL),           // Select

        .AHB2HCLK(AHB2HCLK),           // Clock
        .AHB2HRESET(AHB2HRESET)        // Reset
    );
    
    parameter DATA_WIDTH = 32;
    parameter DATA_SIZE = 9;

    MedianFilter medianFilter (
        .inData(REGS),
        .outData(dataOut)
    );



endmodule