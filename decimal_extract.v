module decimal_extract (
    in,
    out
);
  input wire  [15:0] in;
  output wire [15:0] out;
  
  wire sign;
  wire [4:0] exponent;
  wire [9:0] decimal;
  
  assign exponent = in[14:10] - 5'd15; 
  assign decimal  = in[9:0] >> (5'd10 - exponent);
  assign sign = in[15];
  
//convert to 2's complement if negative
  assign out = in == 0? 0 : ((1 << exponent | decimal) ^ (sign ? 16'hffff:0)) + sign;
  
endmodule
