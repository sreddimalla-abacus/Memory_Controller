class wb_env;
  wb_bfm bfm = new();
  wb_gen gen = new();
  wb_mon mon = new();
  wb_cov cov = new();
  
  task run();
    fork 
      bfm.run();
      gen.run();
      mon.run();
      cov.run();
    join
    
endclass