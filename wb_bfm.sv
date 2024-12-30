// Lec 3 @ 2.21hrs

class wb_bfm;
  task run();
  virtual wb_intf vif;
    $display("wb_bfm::run");
    vif = mc_common ::wvif;
    forever begin
      mc_common::get2bfm.get(tx);
      tx.print("wb_bfm");
      drive_tx(tx);
    end
  endtask
  task drive_tx(wb_tx tx);
    @(posedge vif.clk_i);
    vif.wb_addr_i = tx.addr;
    vif.wb_we_i   = tx.wr_rd;
    vif.wb_sel_i = tx.sel;
    vif.wb_cyc_i  = 1;
    vif.wb_stb_i  = 1;
    if(tx.wr_rd == 1) vif.wb_data_i = tx .data; //WRITE
    wait(vif.wb_ack_o ==1);
    if(tx.wr_rd == 0) tx.data = vif.wb_data_o;  //READ
    @(posedge vif.clk_i);
    vif.wb_addr_i =0;
    vif.wb_we_i   =0;
    vif.wb_cyc_i  =0;
    vif.wb_stb_i  =0;
    vif.wb_sel_i  =0;
  endtask
endclass