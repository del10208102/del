`timescale 1ns/1ps

module judge_collision_tb;

reg clk;
reg rst;
reg [9:0] player_x, player_y;
reg [9:0] moon_x, moon_y;
reg [9:0] hecatia_x, hecatia_y;
wire collision;

judge_collision test (
    .clk(clk),
    .rst(rst),
    .player_x(player_x),
    .player_y(player_y),
    .moon_x(moon_x),
    .moon_y(moon_y),
    .hecatia_x(hecatia_x),
    .hecatia_y(hecatia_y),
    .collision(collision)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    player_x = 0;
    player_y = 0;
    moon_x = 50;
    moon_y = 50;
    hecatia_x = 100;
    hecatia_y = 100;

    #10 rst = 0;

    #100;
    player_x = 90;
    player_y = 90;
    moon_x = 60;
    moon_y = 60;
    hecatia_x = 120;
    hecatia_y = 120;
    #100;

    player_x = 110;
    player_y = 110;
    moon_x = 70;
    moon_y = 70;
    hecatia_x = 90;
    hecatia_y = 90;
    #100;

    player_x = 80;
    player_y = 80;
    moon_x = 50;
    moon_y = 50;
    hecatia_x = 130;
    hecatia_y = 130;
    #100;

    player_x = 120;
    player_y = 120;
    moon_x = 60;
    moon_y = 60;
    hecatia_x = 70;
    hecatia_y = 70;
    #100;

    player_x = 100;
    player_y = 100;
    moon_x = 80;
    moon_y = 80;
    hecatia_x = 110;
    hecatia_y = 110;
    #100;

    player_x = 70;
    player_y = 70;
    moon_x = 90;
    moon_y = 90;
    hecatia_x = 120;
    hecatia_y = 120;
    #100;

    player_x = 130;
    player_y = 130;
    moon_x = 100;
    moon_y = 100;
    hecatia_x = 80;
    hecatia_y = 80;
    #100;

    player_x = 110;
    player_y = 110;
    moon_x = 120;
    moon_y = 120;
    hecatia_x = 60;
    hecatia_y = 60;
    #100;

    player_x = 90;
    player_y = 90;
    moon_x = 70;
    moon_y = 70;
    hecatia_x = 100;
    hecatia_y = 100;
    #100;

    player_x = 120;
    player_y = 120;
    moon_x = 90;
    moon_y = 90;
    hecatia_x = 80;
    hecatia_y = 80;
    #100;

    player_x = 70;
    player_y = 70;
    moon_x = 110;
    moon_y = 110;
    hecatia_x = 120;
    hecatia_y = 120;
    #100;

    player_x = 130;
    player_y = 130;
    moon_x = 80;
    moon_y = 80;
    hecatia_x = 100;
    hecatia_y = 100;
    #100;

    player_x = 110;
    player_y = 110;
    moon_x = 120;
    moon_y = 120;
    hecatia_x = 60;
    hecatia_y = 60;
    #100;

    player_x = 90;
    player_y = 90;
    moon_x = 70;
    moon_y = 70;
    hecatia_x = 100;
    hecatia_y = 100;
    #100;

    player_x = 120;
    player_y = 120;
    moon_x = 90;
    moon_y = 90;
    hecatia_x = 80;
    hecatia_y = 80;
    #100;

    #100 $finish;
end

endmodule
