`include "parameters.h"
module reorg_layer_tb;
  reg clk;
  reg reset_n;
  reg enable;
  
  wire [`ADDR_SZ-1:0]src_addr;
  wire [`ADDR_SZ-1:0] des_addr; 
  wire done;
  
  initial begin
    clk <= 1;
    reset_n <= 0;
    enable <= 0;
    #4 reset_n <= 1;  
    #2 enable <= 1;  
  end
  
  always begin
    clk = ~clk;
    #1;
  end
  
  
  reorg_controller hehe(
  .clk,
  .reset_n,
  .enable,
    .src_addr, 
  .des_addr,
  .done
); 
  
endmodule
