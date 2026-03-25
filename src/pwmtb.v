module pwm_tb;
reg clk;
reg reset;
reg [7:0] duty;
integer high_count;
integer i;
wire pwm_out;
pwm uut (
    .clk(clk),
    .duty(duty),
    .reset(reset),
    .pwm_out(pwm_out)
);
always #5 clk = ~clk;
initial begin
    clk = 0;
    reset = 0;
    duty = 0;
    $dumpfile("sim/dump.vcd");
    $dumpvars(0, pwm_tb);
    #10;
    reset = 1;
    #20;
    reset = 0;
    #10;
duty = 25;
#200;
high_count = 0;
for (i = 0; i < 100; i = i + 1) begin
    @(posedge clk);
    if (pwm_out) high_count = high_count + 1;
end
if (high_count == duty)
    $display("PASS: duty=%0d, high_count=%0d", duty, high_count);
else
    $display("FAIL: duty=%0d, expected=%0d, got=%0d", duty, duty, high_count);

duty = 50;
#200;
high_count = 0;
for (i = 0; i < 100; i = i + 1) begin
    @(posedge clk);
    if (pwm_out) high_count = high_count + 1;
end
if (high_count == duty)
    $display("PASS: duty=%0d, high_count=%0d", duty, high_count);
else
    $display("FAIL: duty=%0d, expected=%0d, got=%0d", duty, duty, high_count);

duty = 75;
#200;
high_count = 0;
for (i = 0; i < 100; i = i + 1) begin
    @(posedge clk);
    if (pwm_out) high_count = high_count + 1;
end
if (high_count == duty)
    $display("PASS: duty=%0d, high_count=%0d", duty, high_count);
else
    $display("FAIL: duty=%0d, expected=%0d, got=%0d", duty, duty, high_count);

$finish;
end
endmodule