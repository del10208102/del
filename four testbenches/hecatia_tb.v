`timescale 1ns/1ps

module hecatia_tb;

reg clk;
reg reset;
reg [9:0] player_x, player_y;
reg [9:0] x, y;
reg [25:0] speed_offset;
reg is_hit;

wire [9:0] hecatia_x, hecatia_y;
wire hecatia_on;
wire [11:0] rgb_out;
wire [7:0] health;
wire die;

hecatia test(
    .clk(clk),
    .reset(reset),
    .player_x(player_x),
    .player_y(player_y),
    .x(x),
    .y(y),
    .speed_offset(speed_offset),
    .is_hit(is_hit),
    .hecatia_x(hecatia_x),
    .hecatia_y(hecatia_y),
    .hecatia_on(hecatia_on),
    .rgb_out(rgb_out),
    .health(health),
    .die(die)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    player_x = 0;
    player_y = 0;
    x = 0;
    y = 0;
    speed_offset = 0;
    is_hit = 0;

    #10 reset = 0;

    #100;
    player_x = 100;
    player_y = 200;
    is_hit = 0;
    #100;

    player_x = 50;
    player_y = 150;
    is_hit = 1;
    #100;

    player_x = 200;
    player_y = 300;
    is_hit = 0;
    #100;

    player_x = 80;
    player_y = 250;
    is_hit = 1;
    #100;

    player_x = 120;
    player_y = 180;
    is_hit = 0;
    #100;

    player_x = 60;
    player_y = 220;
    is_hit = 1;
    #100;

    player_x = 180;
    player_y = 280;
    is_hit = 0;
    #100;

    player_x = 90;
    player_y = 190;
    is_hit = 1;
    #100;

    player_x = 110;
    player_y = 210;
    is_hit = 0;
    #100;

    player_x = 70;
    player_y = 240;
    is_hit = 1;
    #100;
    
    #100 $finish;
end

endmodule
