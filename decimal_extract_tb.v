
module decimal_extract_tb;
  reg  [15:0] in;
  wire [15:0] out;
  
  initial begin
    in = 16'h4E4C;
  end
  
  decimal_extract d(.in, .out);
endmodule