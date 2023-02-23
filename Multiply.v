module Multiply (a, b, result);
  input [15:0] a, b;
  output [15:0] result;
  
  wire [10:0] c1, c2;
  wire [21:0] temp, temp1;
  wire [15:0] re, fb;
  wire [4:0] ex;
  
  assign re[15] = a[15] ^ b[15];

  
  assign c1[10] = 1;
  assign c1[9:0] = a[9:0];
  
  assign c2[10] = 1;
  assign c2[9:0] = b[9:0];
  
  assign temp = c1 * c2;
  assign ex = temp[21] ? 5'h1f: //-1
              temp[20] ? 5'd0:
              temp[19] ? 5'd1:
              temp[18] ? 5'd2:
              temp[17] ? 5'd3:
              temp[16] ? 5'd4:
              temp[15] ? 5'd5:
              temp[14] ? 5'd6:
              temp[13] ? 5'd7:
              temp[12] ? 5'd8:
              temp[11] ? 5'd9:
              temp[10] ? 5'd10:
              temp[9] ? 5'd11:
              temp[8] ? 5'd12:
              temp[7] ? 5'd13:
              temp[6] ? 5'd14:
              temp[5] ? 5'd15:
              temp[4] ? 5'd16:
              temp[3] ? 5'd17:
              temp[2] ? 5'd18:
              temp[1] ? 5'd19: 5'd20;
  assign temp1 = temp << (ex == 5'h1f ? 1: (ex + 2));
  assign re[9:0] = temp1[21:12];
  assign re[14:10] = a[14:10] + b[14:10] - 5'd15 - ex;
  
  assign result = (a == 0 || b == 0) ? 0:re;
endmodule
