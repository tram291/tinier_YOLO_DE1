
module tb_multiply;
    reg [15:0] a, b;
  wire [15:0] result;
  
  initial begin
    a = 16'h482b;
    b = 16'd0;
  end
  
  
  
  Multiply m(.a, .b, .result);
endmodule