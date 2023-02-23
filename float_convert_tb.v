module float_convert_tb;
  
  reg [15:0] d;
  wire [15:0] f;

  initial begin
    d = 16'd15;
  end

  float_convert fc(.f, .d);
endmodule
