`include "parameters.h"

module upsample_controller (
  clk,
  reset_n,
  enable,
  done,
  src_addr,
  des_addr
);
  parameter WIDTH_SRC   = 12;
  parameter HEIGHT_SRC  = 12;
  parameter DEPTH_SRC   = 128;
  parameter STRIDE      = 2;

  input wire clk;
  input wire reset_n;
  input wire enable;
  
  output wire done;
  output reg [`ADDR_SZ-1:0] src_addr;
  output reg [`ADDR_SZ-1:0] des_addr;
  
  reg [4:0] row, column;
  reg [8:0] channel;
  
  assign done = channel == DEPTH_SRC;
     
  always @(posedge clk or negedge reset_n) begin
      if (~reset_n) begin 
          src_addr   <= 0;
          des_addr   <= 0;
          row        <= 0;
          column     <= 0;
          channel    <= 0;
      end
      else begin
          if (enable & ~done) begin
              
              column  = column + 1;
              if (column == WIDTH_SRC*STRIDE) begin
                  column  = 0;
                  row     = row + 1;
              end
              if (row == HEIGHT_SRC*STRIDE) begin
                  row     = 0;
                  channel = channel + 1;
              end 
              
              src_addr = column/STRIDE + WIDTH_SRC*(row/STRIDE + HEIGHT_SRC*channel);
              des_addr = column + WIDTH_SRC*STRIDE*(row + HEIGHT_SRC*STRIDE*channel);
          end
      end
  end

endmodule