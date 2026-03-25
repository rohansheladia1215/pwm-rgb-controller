module colortb;
reg  clk;
reg reset;
wire pwm_r;
wire pwm_g;
wire pwm_b;
wire [7:0] red;
wire [7:0] green;
wire [7:0] blue;

fsm fsm_inst (
    .clk(clk),
    .reset(reset),
    .red_ch(red),
    .green_ch(green),
    .blue_ch(blue)
);

rgb_controller rgb_inst (
    .clk(clk),
    .reset(reset),
    .red(red),
    .green(green),
    .blue(blue),
    .pwm_r(pwm_r),
    .pwm_g(pwm_g),
    .pwm_b(pwm_b)
);

always #5 clk = ~clk;
initial begin
    clk = 0;
    reset = 0;
    $dumpfile("sim/dump.vcd");
    #10;
    reset = 1;
    #20;
    reset = 0;
    #200000;
$finish;
end 
endmodule
