module resize_datapath (
  clk,
  reset_n,
  enable,
  data_in1,
  data_in2,
  scale, 
  data_out
);

  input wire [15:0] data_in1, data_in2, scale;
  input wire clk, reset_n, enable;
  
  output reg [15:0] data_out;
  
  wire [15:0] fsum, fproduct1, fproduct2, sub_scale;
  
  Multiply  m1(.a(data_in2), .b(scale), .result(fproduct1));
  
  sub_float sf (.a(16'h3C00), .b(scale), .c(sub_scale));          //sub_scale = 1-scale
  Multiply  m2(.a(data_in1), .b(sub_scale), .result(fproduct2));
  
  add_float af (.a(fproduct1), .b(fproduct2), .c(fsum));          //fsum = data_in1 * scale + data_in2 * (1-scale); 
  
  always @(posedge clk or negedge reset_n) begin
      if (~reset_n) begin
          data_out <= 0;
      end
      else begin
        if (enable) begin
          data_out = fsum;
        end
      end
  end
  
endmodule