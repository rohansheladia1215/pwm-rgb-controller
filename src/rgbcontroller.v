module rgbcontroller(
    input wire clk,
    input wire reset,
    input wire [7:0] red,
    input wire [7:0] green,
    input wire [7:0] blue,
    output wire pwm_r,
    output wire pwm_g,
    output wire pwm_b
);
pwm #(.PERIOD(100)) red_ch (
    .clk(clk),
    .reset(reset),
    .duty(red),
    .pwm_out(pwm_r)
);
pwm #(.PERIOD(100)) green_ch (
    .clk(clk),
    .reset(reset),
    .duty(green),
    .pwm_out(pwm_g)
);
pwm #(.PERIOD(100)) blue_ch (
    .clk(clk),
    .reset(reset),
    .duty(blue),
    .pwm_out(pwm_b)
);
endmodule