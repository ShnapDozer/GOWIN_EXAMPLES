//Copyright (C)2014-2022 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: GowinSynthesis V1.9.8.09
//Part Number: GW2A-LV55PG484C8/I7
//Device: GW2A-55C
//Created Time: Thu May 11 16:40:22 2023

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	AHB2AXI_Bridge your_instance_name(
		.AHB_HCLK(AHB_HCLK_i), //input AHB_HCLK
		.AHB_HRESETN(AHB_HRESETN_i), //input AHB_HRESETN
		.AHB_HSEL(AHB_HSEL_i), //input AHB_HSEL
		.AHB_HWRITE(AHB_HWRITE_i), //input AHB_HWRITE
		.AHB_HSIZE(AHB_HSIZE_i), //input [2:0] AHB_HSIZE
		.AHB_HBURST(AHB_HBURST_i), //input [2:0] AHB_HBURST
		.AHB_HPROT(AHB_HPROT_i), //input [3:0] AHB_HPROT
		.AHB_HTRANS(AHB_HTRANS_i), //input [1:0] AHB_HTRANS
		.AHB_HADDR(AHB_HADDR_i), //input [31:0] AHB_HADDR
		.AHB_HRDATA(AHB_HRDATA_o), //output [31:0] AHB_HRDATA
		.AHB_HWDATA(AHB_HWDATA_i), //input [31:0] AHB_HWDATA
		.AHB_HREADY(AHB_HREADY_i), //input AHB_HREADY
		.AHB_HREADYOUT(AHB_HREADYOUT_o), //output AHB_HREADYOUT
		.AHB_HRESP(AHB_HRESP_o), //output AHB_HRESP
		.AXI_ACLK(AXI_ACLK_i), //input AXI_ACLK
		.AXI_ARESETN(AXI_ARESETN_i), //input AXI_ARESETN
		.AXI_ARADDR(AXI_ARADDR_o), //output [31:0] AXI_ARADDR
		.AXI_ARBURST(AXI_ARBURST_o), //output [1:0] AXI_ARBURST
		.AXI_ARCACHE(AXI_ARCACHE_o), //output [3:0] AXI_ARCACHE
		.AXI_ARLEN(AXI_ARLEN_o), //output [7:0] AXI_ARLEN
		.AXI_ARLOCK(AXI_ARLOCK_o), //output AXI_ARLOCK
		.AXI_ARPROT(AXI_ARPROT_o), //output [2:0] AXI_ARPROT
		.AXI_ARREADY(AXI_ARREADY_i), //input AXI_ARREADY
		.AXI_ARSIZE(AXI_ARSIZE_o), //output [2:0] AXI_ARSIZE
		.AXI_ARVALID(AXI_ARVALID_o), //output AXI_ARVALID
		.AXI_AWADDR(AXI_AWADDR_o), //output [31:0] AXI_AWADDR
		.AXI_AWBURST(AXI_AWBURST_o), //output [1:0] AXI_AWBURST
		.AXI_AWCACHE(AXI_AWCACHE_o), //output [3:0] AXI_AWCACHE
		.AXI_AWLEN(AXI_AWLEN_o), //output [7:0] AXI_AWLEN
		.AXI_AWLOCK(AXI_AWLOCK_o), //output AXI_AWLOCK
		.AXI_AWPROT(AXI_AWPROT_o), //output [2:0] AXI_AWPROT
		.AXI_AWREADY(AXI_AWREADY_i), //input AXI_AWREADY
		.AXI_AWSIZE(AXI_AWSIZE_o), //output [2:0] AXI_AWSIZE
		.AXI_AWVALID(AXI_AWVALID_o), //output AXI_AWVALID
		.AXI_BREADY(AXI_BREADY_o), //output AXI_BREADY
		.AXI_BRESP(AXI_BRESP_i), //input [1:0] AXI_BRESP
		.AXI_BVALID(AXI_BVALID_i), //input AXI_BVALID
		.AXI_RDATA(AXI_RDATA_i), //input [31:0] AXI_RDATA
		.AXI_RLAST(AXI_RLAST_i), //input AXI_RLAST
		.AXI_RREADY(AXI_RREADY_o), //output AXI_RREADY
		.AXI_RRESP(AXI_RRESP_i), //input [1:0] AXI_RRESP
		.AXI_RVAILD(AXI_RVAILD_i), //input AXI_RVAILD
		.AXI_WDATA(AXI_WDATA_o), //output [31:0] AXI_WDATA
		.AXI_WLAST(AXI_WLAST_o), //output AXI_WLAST
		.AXI_WREADY(AXI_WREADY_i), //input AXI_WREADY
		.AXI_WSTRB(AXI_WSTRB_o), //output [3:0] AXI_WSTRB
		.AXI_WVALID(AXI_WVALID_o) //output AXI_WVALID
	);

//--------Copy end-------------------
