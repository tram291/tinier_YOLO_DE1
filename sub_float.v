module sub_float(
  a, b, c
);

  input wire [15:0] a, b;
  output wire [15:0] c;
  
  wire [15:0] n_b;
  
  assign n_b[15] = 1;
  assign n_b[14:0] = b[14:0];
  
  add_float a1(.a(a), .b(n_b), .c(c));
  
endmodule
