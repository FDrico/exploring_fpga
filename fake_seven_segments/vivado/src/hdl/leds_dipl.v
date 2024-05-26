`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2023 08:12:33 PM
// Design Name: 
// Module Name: seven_segm_displ
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


module leds_displ(
    input clk,
    input [7:0] counter,
    output [7:0] leds
    );
    
    
    //always @(posedge clk)
    //    leds <= counter;
    assign leds = counter;
         
endmodule
