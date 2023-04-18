
module add_float_tb;
   reg [15:0] a;
   reg [15:0] b;
  
   wire [15:0] c;
   
   initial begin
     a = 16'h3266;
     b = 16'h3a68;
   end
   
  add_float a1(.a, .b, .c);
endmodule