class mc_env;
  wb_env wb_env_i = new();
  mem_mon mem_mon_i= new();
  mc_ref mc_ref_i= new();
  mc_ckr mc_ckr_i= new();
  
  task run();
    $display("mc_env::run");
    fork
      wb_env_i.run();
      mem_mon_i.run();
      mc_ref_i.run();
      mc_ckr_i.run();
    join
  endtask
endclass