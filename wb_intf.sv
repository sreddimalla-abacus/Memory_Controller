interface wb_intf(input logic clk_i, input logic rst_i);
  logic [31:0] wb_data_i;
  logic [31:0] wb_data_o;
  logic [31:0] wb_addr_i;
  logic [3:0] wb_sel_i;
  logic wb_we_i;
  logic wb_cyc_i;
  logic wb_stb_i;
  logic wb_ack_o;
  logic wb_err_o;
  logic susp_req_i;
  logic resume_req_i;
  logic suspended_o;
  logic [31:0] poc_o;
endinterface