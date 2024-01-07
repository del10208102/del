module player(
    input clk, reset,                      
    input ctrl_up, ctrl_down, ctrl_left, ctrl_right,   
    input [9:0] x, y,                      
    output reg [9:0] player_x, player_y     
);

    // 内部信号用于跟踪玩家位置
    reg signed [9:0] player_x_reg, player_y_reg;

    // 初始化player位置
    always @(posedge reset or posedge clk) begin
        if (reset) begin
            player_x_reg <= 0;
            player_y_reg <= 0;
        end
        else begin
            player_x_reg <= 10; // 初始X位置
            player_y_reg <= 10; // 初始Y位置
        end
    end
  
    always @(posedge clk) begin
        if (ctrl_up)    player_y_reg <= player_y_reg + 1;
        if (ctrl_down)  player_y_reg <= player_y_reg - 1;
        if (ctrl_left)  player_x_reg <= player_x_reg - 1;
        if (ctrl_right) player_x_reg <= player_x_reg + 1;
    end
  
  always @(posedge clk) begin//player位置
        player_x <= player_x_reg;
        player_y <= player_y_reg;
    end

endmodule
