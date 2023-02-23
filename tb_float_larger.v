module tb_float_larger;
  reg [15:0] a, b;
  wire isLarger;
  
  initial begin 
    a = 16'h3a21;
    b = 16'h3821;
    #10
    b = 16'hB800;
    a = 16'h3266;
    #10
    a = 16'hB800;
    b = 16'hB800;
  end
  
   float_larger fl (
  .a, .b, .isLarger
);
endmodule
