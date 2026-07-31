// Licensed under the Apache-2.0 license
//
// Stub replacement for ecc_top (~24 source files, ~57K LUTs at synthesis).
// Used when STUB_ECC is defined to skip compiling the full ECC (P-384)
// accelerator for faster FPGA builds. AHB reads return 0 / OKAY.

`ifdef STUB_ECC

module ecc_top
    import ecc_defines_pkg::*;
    import ecc_reg_pkg::*;
    import kv_defines_pkg::*;
#(
    parameter AHB_ADDR_WIDTH   = 32,
    parameter AHB_DATA_WIDTH   = 32,
    parameter CLIENT_DATA_WIDTH = 32
) (
    input  wire                        clk,
    input  wire                        reset_n,
    input  wire                        cptra_pwrgood,

    input  wire  [AHB_ADDR_WIDTH-1:0]  haddr_i,
    input  wire  [AHB_DATA_WIDTH-1:0]  hwdata_i,
    input  wire                        hsel_i,
    input  wire                        hwrite_i,
    input  wire                        hready_i,
    input  wire  [1:0]                 htrans_i,
    input  wire  [2:0]                 hsize_i,

    output logic                       hresp_o,
    output logic                       hreadyout_o,
    output logic [AHB_DATA_WIDTH-1:0]  hrdata_o,

    output kv_read_t  [1:0] kv_read,
    output kv_write_t       kv_write,
    input  kv_rd_resp_t [1:0] kv_rd_resp,
    input  kv_wr_resp_t     kv_wr_resp,

    input  pcr_signing_t    pcr_signing_data,

    input  logic            ocp_lock_in_progress,
    output logic            busy_o,

    output logic            error_intr,
    output logic            notif_intr,
    input  logic            debugUnlock_or_scan_mode_switch
);
    assign hresp_o      = '0;
    assign hreadyout_o  = 1'b1;
    assign hrdata_o     = '0;
    assign kv_read      = '0;
    assign kv_write     = '0;
    assign busy_o       = '0;
    assign error_intr   = '0;
    assign notif_intr   = '0;
endmodule

`endif // STUB_ECC
