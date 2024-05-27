`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2023 02:02:47 PM
// Design Name: 
// Module Name: bcd_digit
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


module bcd_digit
    #(
        parameter modulus = 10 //where to wrap
    )
    (
    input clk,
    input carry_in,
    output [$clog2(modulus):0] digit, //number of bits depends on what modulus requires
    output carry_out //to connect to a more significan digit
    );

    reg digit = 0;
    // Hay carry_out si el digit está a tope y había carry in.
    assign carry_out = carry_in && digit == modulus - 1;

    always @(posedge clk)
        if (carry_in)
            if (carry_out)
                digit <= 0;
            else
                digit <= digit+1; //suma 1 al digit si había un carry in

endmodule
