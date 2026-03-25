module pwm #(parameter PERIOD = 100)(
    input wire clk,
    input wire reset,       
    input wire [7:0] duty,
    output reg pwm_out
);
  reg [7:0] counter;
  always @(posedge clk)begin
    if (reset) begin
    counter <= 0;
    pwm_out <= 0;
end else begin
    if (counter >= PERIOD-1)begin
      counter <= 0;
    end else begin
      counter <= counter + 1;
    end
    if(counter < duty)begin
      pwm_out <= 1;
    end else
      pwm_out <= 0;
  end
end
   
endmodule