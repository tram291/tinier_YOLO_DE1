
module tb_resize_datapath;
  reg [15:0] data_in1, data_in2, scale;
  reg state_flag, clk, reset_n, enable;
  
  wire [15:0] data_out;
  
  initial begin
    data_in1   <= 16'h3C00; //1
    data_in2   <= 16'h4000; //2
    scale      <= 16'h3A00; //0.75  
    reset_n    <= 0;
    enable     <= 0;
    clk        <= 1;
    #2 reset_n   <= 1;
    #1 enable    <= 1;
    #7 state_flag<= 1;
  end
  
  always begin
    #1 clk = ~clk;
 end
  resize_datapath rd (
    .clk,
    .reset_n,
    .enable,
    .data_in1,
    .data_in2,
    .scale, 
    .data_out
  );
endmodule