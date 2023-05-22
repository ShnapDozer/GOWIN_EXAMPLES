`timescale 1 ns / 1 ps


 module axi4_lite_slave_top #
 (
 // Users to add parameters here


 // User parameters ends
 // Do not modify the parameters beyond this line




 // Parameters of Axi Slave Bus Interface S00_AXI
 parameter integer C_S00_AXI_DATA_WIDTH = 32,
 parameter integer C_S00_AXI_ADDR_WIDTH = 7
 )
 (
 // Users to add ports here


 // User ports ends
 // Do not modify the ports beyond this line




 // Ports of Axi Slave Bus Interface S00_AXI
 input wire  S00_AXI_ACLK,
 input wire  s00_AXI_ARESETN,
 input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] S00_AXI_AWADDR,
 input wire [2 : 0] S00_AXI_AWPROT,
 input wire  S00_AXI_AWVALID,
 output wire  S00_AXI_AWREADY,
 input wire [C_S00_AXI_DATA_WIDTH-1 : 0] S00_AXI_WDATA,
 input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] S00_AXI_WSTRB,
 input wire  S00_AXI_WVALID,
 output wire  S00_AXI_WREADY,
 output wire [1 : 0] S00_AXI_BRESP,
 output wire  S00_AXI_BVALID,
 input wire  S00_AXI_BREADY,
 input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] S00_AXI_ARADDR,
 input wire [2 : 0] S00_AXI_ARPROT,
 input wire  S00_AXI_ARVALID,
 output wire  S00_AXI_ARREADY,
 output wire [C_S00_AXI_DATA_WIDTH-1 : 0] S00_AXI_RDATA,
 output wire [1 : 0] S00_AXI_RRESP,
 output wire  S00_AXI_RVALID,
 input wire  S00_AXI_RREADY,


 output wire [(C_S00_AXI_DATA_WIDTH*9)-1 : 0] REGS,
 input wire [C_S00_AXI_DATA_WIDTH-1 : 0] inReg
 );
// Instantiation of Axi Bus Interface S00_AXI
 axi4_lite_slave # ( 
 .C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
 .C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
 ) axi_ip_slave_v1_0_S00_AXI_inst (
 .S_AXI_ACLK(S00_AXI_ACLK),
 .S_AXI_ARESETN(s00_AXI_ARESETN),
 .S_AXI_AWADDR(S00_AXI_AWADDR),
 .S_AXI_AWPROT(S00_AXI_AWPROT),
 .S_AXI_AWVALID(S00_AXI_AWVALID),
 .S_AXI_AWREADY(S00_AXI_AWREADY),
 .S_AXI_WDATA(S00_AXI_WDATA),
 .S_AXI_WSTRB(S00_AXI_WSTRB),
 .S_AXI_WVALID(S00_AXI_WVALID),
 .S_AXI_WREADY(S00_AXI_WREADY),
 .S_AXI_BRESP(S00_AXI_BRESP),
 .S_AXI_BVALID(S00_AXI_BVALID),
 .S_AXI_BREADY(S00_AXI_BREADY),
 .S_AXI_ARADDR(S00_AXI_ARADDR),
 .S_AXI_ARPROT(S00_AXI_ARPROT),
 .S_AXI_ARVALID(S00_AXI_ARVALID),
 .S_AXI_ARREADY(S00_AXI_ARREADY),
 .S_AXI_RDATA(S00_AXI_RDATA),
 .S_AXI_RRESP(S00_AXI_RRESP),
 .S_AXI_RVALID(S00_AXI_RVALID),
 .S_AXI_RREADY(S00_AXI_RREADY),

 .REGS(REGS),
 .inReg(inReg)
 );


 // Add user logic here


 // User logic ends


 endmodule