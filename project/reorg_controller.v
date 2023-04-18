
//This module will calculate the address of elements in source array and destination array 
`include "parameters.h"

module reorg_controller(
  clk,
  reset_n,
  enable,
  done,
  src_addr, 
  des_addr
);
  parameter WIDTH       = 12;
  parameter HEIGHT      = 12;
  parameter DEPTH       = 256;
  parameter WIDTH_SRC   = 24;
  parameter HEIGHT_SRC  = 24;
  parameter DEPTH_SRC   = 64;
  parameter STRIDE      = 2;
  
  input wire clk;
  input wire reset_n;
  input wire enable;
  
  output reg done;
  output reg [`ADDR_SZ-1:0] src_addr;
  output reg [`ADDR_SZ-1:0] des_addr; 
  
  reg [4:0] row_des, column_des, row_src, column_src;
  reg [8:0] channel_des, channel_src;
  reg [2:0] offset; 


  
  always @(posedge clk or negedge reset_n) begin
      if (~reset_n) begin 
          row_des     <= 0;
          column_des  <= 0;
          channel_des <= 0;
          row_src     <= 0;
          column_src  <= 0;
          channel_src <= 0;
          offset      <= 0;
          src_addr    <= 0;
          des_addr    <= 0;
          done        <= 0;
          
      end 
      else begin
          if (enable & ~done) begin 
              column_des  = column_des + 1;
              if (column_des == WIDTH) begin
                  column_des  = 0;
                  row_des     = row_des + 1;
              end
              if (row_des == HEIGHT) begin
                  row_des     = 0;
                  channel_des = channel_des + 1;
              end 
              if (channel_des == DEPTH) begin
                  done = 1;
              end
              offset      = channel_des / DEPTH_SRC;
              column_src  = column_des*STRIDE + offset%STRIDE;
              row_src     = row_des*STRIDE + offset/STRIDE;
              channel_src = channel_des % DEPTH_SRC; 
              
              src_addr    = column_src + WIDTH_SRC*(row_src + channel_src*HEIGHT_SRC);
              des_addr    = column_des + WIDTH*(row_des + channel_des*HEIGHT); 
              
          end          
      end
  end
  
endmodule

