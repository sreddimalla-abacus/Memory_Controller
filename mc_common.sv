class mc_common;
  static mailbox gen2bfm = new();
  static string testname;
  static virtual wb_intf wvif;
  static virtual mem_intf mvif;
  //static bit [31:0] csr_mask = {8'hFF, 13'h0,3'h7,5'h0,2'h3,1'h0};
  static bit[31:0] reg_maskA[19:0];
  static bit [31:0] spec_reset_valA[19:0];
  function new();
    reg_maskA[0] = { 8'hFF, 13'h0, 3'h7, 5'h0, 2'h3, 1'h0};
    reg_maskA[1] = 32'h0;
    reg_maskA[2] = 32'h0000_00FF;
    reg_maskA[3] = 32'h0;
    for(int i =0; i <8 ; i++) begin
      reg_maskA[4+i*2] = {8'h0, 8'hFF, 4'h0, 12'hFFF};
      reg_maskA[5+i*2] = 32'hFFFF_FFFF;
    end
    for(int i =0; i < 20; i++) begin
      spec_reset_valA[i] = 0;
    end
  endfunction
endclass