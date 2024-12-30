enum {
  REG,
  MEM,
}reg_mem_t;

class wb_tx;
  //KNOBS
  rand bit reg_mem_f;
  rand bit [7:0] cs_target;
  
  //properties 
  rand bit [31:0] addr;
  rand bit [31:0] data;
  rand bit wr_rd;
  rand bit [3:0] sel;
  // se1[0] = 1, data[7:0] is valid
  // se1[1] = 1, data[15:8] is valid
  // se1[2] = 1, data[23:16] is valid
  // se1[3] = 1, data[31:24] is valid
  // Handshaking signals will never be part of trasaction class
  
  
  //methods
  function void print(string name = "");
    $display("wb_tx print from %s", name);
    $display("addr = %h", addr);
    $display("data = %h", data);
    $display("wr_rd = %h", wr_rd);
    $display("sel = %h", sel);
    $display("reg_mem_f = %h", reg_mem_f);
    $display("cs_target= %h", cs_target);

  endfunction
  //constraints
  
  constraint wb_addr_c_1{
    (reg_mem_t == REG) -> (addr[31:29] == 3'b011);
    (reg_mem_t == MEM) -> (addr[31:29] == 3'b000);
  }
  
  constraint wb_addr_c_2 {
    addr[1:0] ==0;
    //addr%4 ==0;
  }
  constraint sel_c{
    soft sel == 4'hf;
  }
  
endclass