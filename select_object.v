module select_object(
  object_val,
  over_thres
);
  parameter THRESHOLD =16'h3800;
  
  input [15:0] object_val;
  output over_thres;
  
  float_larger fl (.a(object_val), .b(THRESHOLD), .isLarger(over_thres));
endmodule
