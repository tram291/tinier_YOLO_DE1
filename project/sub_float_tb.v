module sub_float_tb;
   reg [15:0] a, b;
  wire [15:0] c;
  
  initial begin 
    a = 16'h3c00;
    b = 16'h3266;
  end
  
  sub_float s1(.a, .b, .c);
endmodule
