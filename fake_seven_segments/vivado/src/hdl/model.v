`timescale 1ns/1ns
module model
  #(
    parameter ms_limit = 100000
    )
  (
   input clk,
   output [7:0] seconds
   );
  
  integer counter = 0;
  always @(posedge clk)
    counter <= counter+1;

  assign seconds = counter / (ms_limit * 1000);

endmodule