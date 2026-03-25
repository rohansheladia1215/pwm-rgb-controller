module fsm(
    input wire clk,
    input wire reset,
    output reg [7:0] red_ch,
    output reg [7:0] green_ch,
    output reg [7:0] blue_ch
);

reg [1:0] state;
localparam RED   = 2'd0,
           GREEN = 2'd1,
           BLUE  = 2'd2,
           WHITE = 2'd3;
reg [12:0] timer;

always @(posedge clk) begin
    if (reset) begin
        state <= RED;
        timer <= 0;
    end else begin
        if (timer >= 5000) begin
            timer <= 0;
            state <= state + 1;
        end else
            timer <= timer + 1;

        case(state)
            RED: begin
                red_ch <= 100;
                green_ch <= 0;
                blue_ch <= 0;
            end
            GREEN: begin
                red_ch <= 0;
                green_ch <= 100;
                blue_ch <= 0;
            end
            BLUE: begin
                red_ch <= 0;
                green_ch <= 0;
                blue_ch <= 100;
            end
            WHITE: begin
                red_ch <= 100;
                green_ch <= 100;
                blue_ch <= 100;
            end
        endcase
    end
end

endmodule