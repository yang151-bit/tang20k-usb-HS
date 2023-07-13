//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.9 Beta
//Part Number: GW2AR-LV18QN88PC7/I6
//Device: GW2AR-18
//Created Time: Thu Jul 13 11:23:24 2023

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	USB2_0_SoftPHY_Top your_instance_name(
		.clk_i(clk_i_i), //input clk_i
		.rst_i(rst_i_i), //input rst_i
		.fclk_i(fclk_i_i), //input fclk_i
		.pll_locked_i(pll_locked_i_i), //input pll_locked_i
		.ulpi_data_io(ulpi_data_io_io), //inout [7:0] ulpi_data_io
		.ulpi_dir_o(ulpi_dir_o_o), //output ulpi_dir_o
		.ulpi_stp_i(ulpi_stp_i_i), //input ulpi_stp_i
		.ulpi_nxt_o(ulpi_nxt_o_o), //output ulpi_nxt_o
		.usb_dxp_io(usb_dxp_io_io), //inout usb_dxp_io
		.usb_dxn_io(usb_dxn_io_io), //inout usb_dxn_io
		.usb_rxdp_i(usb_rxdp_i_i), //input usb_rxdp_i
		.usb_rxdn_i(usb_rxdn_i_i), //input usb_rxdn_i
		.usb_pullup_en_o(usb_pullup_en_o_o), //output usb_pullup_en_o
		.usb_term_dp_io(usb_term_dp_io_io), //inout usb_term_dp_io
		.usb_term_dn_io(usb_term_dn_io_io) //inout usb_term_dn_io
	);

//--------Copy end-------------------
