module second_counter_displays 
#( //parameter definition
   parameter ms_limit = 100
) (
    input clk, //10 ns de periodo, 100 MHz
    output wire [7:0] led
);

    integer count_a = 0;
    integer count_b = 0;
    reg ms_pulse = 0;
    integer ms_count = 0;
    reg sec_pulse = 0;
    reg [7:0] sec_count = 8'b00000000;
    wire [7:0] led_aux;
    reg count_b_pulse = 0;

// Generate a millisecond pulse
    always @(posedge clk)
    begin
        if (count_a >= ms_limit-1)
            begin
                count_a <= 0;
                ms_pulse <= 1;
            end
        else
            begin
                count_a <= count_a + 1;
                ms_pulse <= 0;
            end
    end
    
    
    always @(posedge clk)
        begin //Cuenta cada 1 ms
            if (ms_pulse >= 1)
                begin
                    if (ms_count >= 999) //en este caso, llegamos a 1 segundo!
                        begin
                            ms_count <= 0;
                            sec_pulse <= 1; //cuando cumple 1 ms, tenemos un pulso
                        end
                    else
                        begin
                            ms_count <= ms_count+1;
                            sec_pulse <= 0;
                        end
                end
            else
                sec_pulse <= 0;
        end
    
    always @(posedge clk)
        begin //Cuenta la cantidad de segundos, hasta 255.
            if (sec_pulse) // cada vez que pasa 1 segundo
                begin
                    if (sec_count >= 8'b11111111) //tenemos que venir intentar sumar uno al contador si podemos.
                        begin
                            sec_count <= 8'b00000000;
                        end
                    else
                        begin
                            sec_count <= sec_count+8'b00000001;
                        end
        
                end
        end
    
//    seven_segm_displ disp_1 (.clk(clk),
//                               .ssd_leds(ssd),
//                               .switch_indicator(switch[3:0]));
//    seven_segm_displ disp_2 (.clk(clk),
//                               .ssd_leds(ssd),
//                               .switch_indicator(switch[7:4]));

    assign led = sec_count;                         
    
//    leds_displ disp_led (
//                        .clk(clk), // leds!
//                        .leds(led_aux),
//                        .counter(sec_count)
//                        );
    
    
endmodule