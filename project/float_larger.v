module float_larger (
  a, b, isLarger
);

  input [15:0] a, b;
  output isLarger;
  
  wire isEqualSign, isSign, isEx, isEqualEx, isMan;
  
  assign isEqualSign = a[15] ~^ b[15];
  assign isSign = ~a[15] & b[15];
  assign isEx   = a[14:10] > b[14:10];
  assign isEqualEx   = a[14:10] == b[14:10];
  assign isMan = a[9:0] > b[9:0];
  assign isLarger = isSign | (isEqualSign & (isEx | (isEqualEx & isMan)));
  
endmodule


