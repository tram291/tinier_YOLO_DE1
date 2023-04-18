`include "parameters.h"
module resize_controller_tb;
  reg clk;
  reg reset_n;
  reg enable;
  
  wire [`ADDR_SZ-1:0] src_addr1, src_addr2;
  wire [`ADDR_SZ-1:0] des_addr; 
  wire done, stage_flag;
  wire [15:0] fraction_part;
  
  initial begin
    clk <= 1;
    reset_n <= 0;
    enable <= 0;
    #4 reset_n <= 1;  
    #1 enable <= 1;  
  end
  
  always begin
    clk = ~clk;
    #1;
  end
  
  
  resize_controller hehe(
  .clk,
  .reset_n,
  .enable,
  .src_addr1, 
  .src_addr2,
  .des_addr,
  .stage_flag, 
  .fraction_part,  
  .done
  
); 
  
endmodule


