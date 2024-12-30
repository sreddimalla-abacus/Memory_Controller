class wb_gen;
  wb_tx tx;
  bit [31:0] data_t;
  task run();
    $display("wb_gen::run");
    case(mc_common::testname)
      "test_reg_reset_test" : begin
        for(int i =0; i < 20; i++) begin
          if(i ==3) continue;
        tx = new();
          data_t = $random & mc_common :: reg_maskA[i];
          assert(tx.randomize() with {addr[28:0] == 29'h0+4*i; data == data_t; reg_mem_f == REG;wr_rd==1;});
        mc_common::gen2bfm.put(tx);
        end
        //READ from CSR
        for(int i =0; i <20; i++) begin
          if(i ==3) continue;
        tx = new();
          assert(tx.randomize() with {addr[28:0] == 29'h0+4*i; reg_mem_f == REG; wr_rd ==0;};
               mc_common::gen2bfm.put(tx);
             
      end
            end

      "test_reg_wr_rd" : begin
        //write to CSR
        for(int i =0; i < 20; i++) begin
          if(i ==3) continue;
        tx = new();
          data_t = $random & mc_common :: reg_maskA[i];
          assert(tx.randomize() with {addr[28:0] == 29'h0+4*i; data == data_t; reg_mem_f == REG;wr_rd==1;});
        mc_common::gen2bfm.put(tx);
        end
        //READ from CSR
        for(int i =0; i <20; i++) begin
          if(i ==3) continue;
        tx = new();
          assert(tx.randomize() with {addr[28:0] == 29'h0+4*i; reg_mem_f == REG; wr_rd ==0;};
               mc_common::gen2bfm.put(tx);
             
      end
       end          
    endcase
  endtask
endclass