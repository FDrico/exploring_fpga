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
    always #2 clk = ~clk; //10ns period, 100 MHz.
    
    
    reg [6:0] ssd; // SSD, the seven segment display, 7 bits, one reserved for control
    wire [7:0] led;
    
    top #(.ms_limit(3)) top (.clk(clk), .led(led));
    
    initial
      begin
        repeat (600) @(posedge clk);
        $finish;
      end
    
endmodule
