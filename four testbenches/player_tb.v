`timescale 1ns/1ps

module player_tb;

reg clk;
reg reset;
reg ctrl_up, ctrl_down, ctrl_left, ctrl_right;
reg [9:0] x, y;
wire [9:0] player_x, player_y;

player test (
    .clk(clk),
    .reset(reset),
    .ctrl_up(ctrl_up),
    .ctrl_down(ctrl_down),
    .ctrl_left(ctrl_left),
    .ctrl_right(ctrl_right),
    .x(x),
    .y(y),
    .player_x(player_x),
    .player_y(player_y)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    ctrl_up = 0;
    ctrl_down = 0;
    ctrl_left = 0;
    ctrl_right = 0;
    x = 0;
    y = 0;

    #10 reset = 0;

    #100 ctrl_up = 1;
    #100 ctrl_up = 0;

    #100 ctrl_down = 1;
    #100 ctrl_down = 0;

    #100 ctrl_left = 1;
    #100 ctrl_left = 0;

    #100 ctrl_right = 1;
    #100 ctrl_right = 0;

    #100 ctrl_up = 1;
    #100 ctrl_left = 1;
    #100 ctrl_up = 0;
    #100 ctrl_left = 0;

    #100 ctrl_down = 1;
    #100 ctrl_right = 1;
    #100 ctrl_down = 0;
    #100 ctrl_right = 0;

    #100 ctrl_up = 1;
    #100 ctrl_right = 1;
    #100 ctrl_up = 0;
    #100 ctrl_right = 0;

    #100 ctrl_down = 1;
    #100 ctrl_left = 1;
    #100 ctrl_down = 0;
    #100 ctrl_left = 0;

    #100 ctrl_up = 1;
    #100 ctrl_down = 1;
    #100 ctrl_up = 0;
    #100 ctrl_down = 0;

    #100 ctrl_left = 1;
    #100 ctrl_right = 1;
    #100 ctrl_left = 0;
    #100 ctrl_right = 0;

    #100 ctrl_up = 1;
    #100 ctrl_left = 1;
    #100 ctrl_down = 1;
    #100 ctrl_right = 1;
    #100 ctrl_up = 0;
    #100 ctrl_left = 0;
    #100 ctrl_down = 0;
    #100 ctrl_right = 0;

    #100 ctrl_up = 1;
    #100 ctrl_down = 1;
    #100 ctrl_left = 1;
    #100 ctrl_right = 1;
    #100 ctrl_up = 0;
    #100 ctrl_down = 0;
    #100 ctrl_left = 0;
    #100 ctrl_right = 0;

    #100 ctrl_up = 1;
    #100 ctrl_down = 1;
    #100 ctrl_up = 0;
    #100 ctrl_down = 0;

    #100 ctrl_left = 1;
    #100 ctrl_right = 1;
    #100 ctrl_left = 0;
    #100 ctrl_right = 0;

    #100 ctrl_up = 1;
    #100 ctrl_down = 1;
    #100 ctrl_left = 1;
    #100 ctrl_right = 1;
    #100 ctrl_up = 0;
    #100 ctrl_down = 0;
    #100 ctrl_left = 0;
    #100 ctrl_right = 0;

    #100 $finish;
end

endmodule
