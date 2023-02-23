
module add_float (
  a, b, c
);
  input wire [15:0] a;
  input wire [15:0] b;
  
  output wire [15:0] c;
  
  wire [11:0] temp_mantisa_a1, temp_mantisa_b1, temp_mantisa_a2, temp_mantisa_b2, sum;
  wire [4:0] exponent;
  wire aIsLarger;
  
  float_larger fl (.a(a), .b(b), .isLarger(aIsLarger));

  //add 1 to the most left of variables
  assign temp_mantisa_a1 = a[9:0] | 11'h400;
  assign temp_mantisa_b1 = b[9:0] | 11'h400;

  assign temp_mantisa_a2 = aIsLarger ? temp_mantisa_a1 : temp_mantisa_a1 >> (b[14:10] - a[14:10]);
  assign temp_mantisa_b2 = ~aIsLarger ? temp_mantisa_b1 : temp_mantisa_b1 >> (a[14:10] - b[14:10]);
  
  assign sum = (a[15] ? (~temp_mantisa_a2 + 1) : temp_mantisa_a2) + (b[15] ? (~temp_mantisa_b2 + 1) : temp_mantisa_b2);
  assign exponent = sum[11] ? -1 :
                    sum[10] ? 4'd0 :
                    sum[9] ? 4'd1 :
                    sum[8] ? 4'd2 :
                    sum[7] ? 4'd3 :
                    sum[6] ? 4'd4 :
                    sum[5] ? 4'd5 :
                    sum[4] ? 4'd6 :
                    sum[3] ? 4'd7 :
                    sum[2] ? 4'd8 :
                    sum[1] ? 4'd9 : 
                    sum[0] ? 4'd10 : 4'd11;
    
  assign c[15] = aIsLarger ? a[15] : b[15];
  assign c[14:10] = exponent == 4'd11 ? 0 : ((aIsLarger ? a[14:10] : b[14:10]) - exponent);
  assign c[9:0]  = sum << exponent;
  
endmodule