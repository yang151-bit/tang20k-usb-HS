module usb_serial
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
    parameter BAUDRATE         = 1000000
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // output          uart_rx_o,
    // input           uart_tx_i,

    // ULPI Interface
    output          ulpi_reset_o,
    inout [7:0]     ulpi_data_io,
    output          ulpi_stp_o,
    input           ulpi_nxt_i,
    input           ulpi_dir_i,
    input           ulpi_clk60_i
);

// USB clock / reset
wire usb_clk_w;
wire usb_rst_w;

wire clk_bufg_w;

assign clk_bufg_w = ~ulpi_clk60_i;
assign usb_clk_w = clk_bufg_w;

reg [3:0] count_q = 4'b0;
reg       rst_q   = 1'b1;

always @(posedge usb_clk_w) 
if (count_q != 4'hF)
    count_q <= count_q + 4'd1;
else
    rst_q <= 1'b0;

assign usb_rst_w = rst_q;

// ULPI Buffers
wire [7:0] ulpi_out_w;
wire [7:0] ulpi_in_w;
wire       ulpi_stp_w;


assign ulpi_data_io = ulpi_dir_i ? 8'hz : ulpi_out_w;
assign ulpi_in_w = ulpi_data_io;


assign ulpi_stp_o = ulpi_stp_w;

// USB Core
usb_cdc_top
#( .BAUDRATE(BAUDRATE) )
u_usb
(
     .clk_i(usb_clk_w)
    ,.rst_i(usb_rst_w)

    // ULPI
    ,.ulpi_data_out_i(ulpi_in_w)
    ,.ulpi_dir_i(ulpi_dir_i)
    ,.ulpi_nxt_i(ulpi_nxt_i)
    ,.ulpi_data_in_o(ulpi_out_w)
    ,.ulpi_stp_o(ulpi_stp_w)

    ,.tx_i(uart_tx_i)
    ,.rx_o(uart_rx_o)
);

assign uart_tx_i = uart_rx_o;
assign ulpi_reset_o = 1'b1;

endmodule