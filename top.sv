module top;
  reg wb_clk,wb_rst;
  reg mem_clk;
  wb_intf wpif(wb_clk, wb_rst);
  mem_intf mpif(mem_clk);
  mc_common mc_common_i = new();
  
  initial begin
    wb_clk =0;
    forever #5 wb_clk = ~wb_clk;
  end
  initial begin
    mem_clk=0;
    forever #10 mem_clk = ~ mem_clk;
  end
    
  initial begin 
   $value$plusargs("testname = %s", mc_common ::testname);
    mc_common::wvif = wpif;
    mc_common::mvif = mpif;

    
    wb_rst =1;
    repeat(2) @(posedge wb_clk);
    wb_rst =0;
  end
  mc_top dut(clk_i, rst_i,
          wb_data_i,wb_data_o,wb_addr_i,wb_sel_i,wb_we_i,wb_cyc_i,
   wb_stb_i, wb_ack_o, wb_err_o,
   susp_req_i,resume_req_i,suspended_o,poc_o,
  mc_br_pad_i,
  mc_bg_pad_o,
  mc_ack_pad_i,
  mc_addr_pad_o,
  mc_data_pad_i,
  mc_data_pad_o,
  mc_dp_pad_i,
  mc_dp_pad_o,
  mc_doe_pad_doe_o,
  mc_dqm_pad_o,
  mc_oe_pad_o_,
  mc_we_pad_o_,
  mc_cas_pad_o_,
  mc_ras_pad_o_,
  mc_cke_pad_o_,
  mc_cs_pad_o_,
  mc_sts_pad_i,
  mc_rp_pad_o_,
  mc_vpen_pad_o,
  mc_adsc_pad_o_,
  mc_adv_pad_o_,
  mc_zz_pad_o,
  mc_coe_pad_coe_o );
  
  //program block
  mc_tb tb();
  
  initial begin
    #1500;
    $finish();
  end
  
endmodule
