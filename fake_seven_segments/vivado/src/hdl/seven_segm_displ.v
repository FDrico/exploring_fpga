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


module seven_segm_displ(
    input clk,
    input [3:0] switch_indicator,
    output reg [6:0] ssd_leds
    );
    
    initial ssd_leds = 7'b0;
    
    always @(posedge clk)
        begin
            case (switch_indicator) // Sólo miro de 3 a 0 (4 bits, puedo contar hasta 15)
              0: ssd_leds <= 7'b1111110;
              1: ssd_leds <= 7'b0110000;
              2: ssd_leds <= 7'b1101101;
              3: ssd_leds <= 7'b1111001;
              4: ssd_leds <= 7'b0110011;
              5: ssd_leds <= 7'b1011011;
              6: ssd_leds <= 7'b1011111;
              7: ssd_leds <= 7'b1110000;
              8: ssd_leds <= 7'b1111111;
              9: ssd_leds <= 7'b1110011;
              10: ssd_leds <= 7'b1110111;
              11: ssd_leds <= 7'b0011111;
              12: ssd_leds <= 7'b1001110;
              13: ssd_leds <= 7'b0111101;
              14: ssd_leds <= 7'b1001111;
              15: ssd_leds <= 7'b1000111;
            endcase
         end

         
endmodule
