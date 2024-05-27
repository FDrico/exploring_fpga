`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2023 09:50:58 PM
// Design Name: 
// Module Name: simulation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module simulation(

  );
  reg clk = 1;
  reg [4:0] btn = 5'b00000; // start!
  always #2 clk = ~clk; //10ns period, 100 MHz.
  
  wire [7:0] led;
  localparam mslimit = 50;
  localparam sec_limit = 50;
  integer num_errors = 0;
  integer num_checks = 0;
  top #(.ms_limit(mslimit), .sec_limit(sec_limit)) top (.clk(clk), .led(led), .btn(btn));
  wire [7:0] model_seconds;
  
  initial
    begin
      #3 btn = 5'b00100; //start
      #8 btn = 5'b00000; //stop pressing button
      #400 btn = 5'b10000; //stop
      #408 btn = 5'b00000; //stop
      wait (model_seconds == 20);
      $display("Simulation complete at time %0fns.",$realtime);
      if (num_errors > 0)
        $display("*** Simulation FAILED %0d/%0d",num_errors,num_checks);
      else
        $display("*** Simulation PASSED %0d/%0d",num_errors,num_checks);
      //repeat (600) @(posedge clk);
      $finish;
    end

  model
    #(.ms_limit(mslimit))
    model
    (
      .clk(clk),
      .seconds(model_seconds)
    );

  always @(posedge clk)
    begin
      num_checks = num_checks+1;
      if (led != model_seconds)
        begin
          $display("ERROR: digits value %0x does not match expected value %0x at time %0fns",
          led,model_seconds,$realtime);
        num_errors = num_errors+1;
        end
    end

endmodule
