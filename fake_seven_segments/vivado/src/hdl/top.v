module top
  #( //parameter definition
     parameter ms_limit = 100000,
     parameter sec_limit = 999
   ) (
     input clk, //10 ns de periodo, 100 MHz
     input [4:0] btn,
     output wire [7:0] led
   );


  //buttons! Only those connected to the FPGA.
  // This will create Asynchronous signals: We must sample them in a single flipflop to sync it to our clock.
  wire btnleft = btn[0]; //reset counter
  wire btnup = btn[1];
  wire btnright = btn[2]; //start counter
  wire btndown = btn[3];
  wire btncenter = btn[4]; //stop counter

  // The schematic to be able to sample the button signal:
  reg [1:0] btnleft_shift = 2'b00;
  reg [1:0] btnright_shift = 2'b00;
  reg [1:0] btncenter_shift = 2'b00;

  always @(posedge clk)
    begin
      btnleft_shift   <= {btnleft_shift, btnleft}; //as btn_left_shit has only 2 places, this concat will leave one bit out
      btnright_shift  <= {btnright_shift, btnright};
      btncenter_shift <= {btncenter_shift, btncenter};
    end

  // If:
  // - the current signal (btnleft_shift[0]) and the previous one (btnleft_shift[1]) are different
  // - and the current one is 1
  // Then: the button has been pressed.
  wire btnright_rise = btnright_shift[0]  & ~btnright_shift[1];
  wire btncenter_rise  = btncenter_shift[0] & ~btncenter_shift[1];
  wire btnleft_rise  = btnleft_shgusift[0]   & ~btnleft_shift[1];

  reg count_enable = 0;
  always @(posedge clk)
    begin
      if (btnright_rise)
        count_enable <= 1;
      else if (btncenter_rise)
        count_enable <= 0;
    end
  
  reg rst = 0;
  always @(posedge clk)
    begin
      if (btnleft_rise)
        rst <= 1;
      else
        rst <= 0;
    end
  
  // leds = {LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7} //concatenate
  wire [7:0] led_auxiliar;

  assign led = led_auxiliar | btnright;

  second_counter_displays #(.ms_limit(ms_limit), .sec_limit(sec_limit)) counter_display_1 (
                            .clk(clk),
                            .count_enable(count_enable),
                            .rst(rst),
                            .led(led_auxiliar));

endmodule
