`timescale 1ns/1ns
module model
  #(
    parameter ms_limit = 100000
    )
  (
   input clk,
   output reg [7:0] seconds
   );

  integer counter = 0;
  always @(posedge clk)
    counter <= counter+1;

  always @(posedge clk) begin
    seconds <= counter / (ms_limit * 1000);
  end
  //assign seconds = counter / (ms_limit * 1000);

endmodule
