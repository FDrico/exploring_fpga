module top
  #( //parameter definition
     parameter ms_limit = 100000
   ) (
     input clk, //10 ns de periodo, 100 MHz
     output wire [0:7] led
   );
  // leds = {LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7} //concatenate
  wire [7:0] led_auxiliar;

  assign led = led_auxiliar;

  second_counter_displays #(.ms_limit(ms_limit)) counter_display_1 (
                            .clk(clk),
                            .led(led_auxiliar));

endmodule
