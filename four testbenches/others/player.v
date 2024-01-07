module player(
    input clk, reset,                       // 时钟和复位信号
    input ctrl_up, ctrl_down, ctrl_left, ctrl_right,   // 键盘控制器信号
    input [9:0] x, y,                       // VGA扫描位置
    output reg [9:0] player_x, player_y     // 玩家位置
);

    // 内部信号用于跟踪玩家位置
    reg signed [9:0] player_x_reg, player_y_reg;

    // 移动速度控制参数
    parameter MOVE_SPEED = 4; // 调整此值以更改移动速度

    // 计数器和计时器
    reg [23:0] move_counter; // 24位计数器，用于延长计时器周期
    reg move_allowed;

    // 初始化玩家位置和计数器
    always @(posedge reset or posedge clk) begin
        if (reset) begin
            player_x_reg <= 0;
            player_y_reg <= 0;
            move_counter <= 0;
            move_allowed <= 1;
        end
        else begin
            player_x_reg <= 10; // 初始X位置
            player_y_reg <= 10; // 初始Y位置
        end
    end

    // 玩家移动的逻辑
    always @(posedge clk) begin
        // 计数器递减
        if (move_counter > 0) begin
            move_counter <= move_counter - 1;
            move_allowed <= 0;
        end
        else begin
            move_allowed <= 1;
        end

        // 玩家移动
        if (move_allowed) begin
            if (ctrl_up)    player_y_reg <= player_y_reg + MOVE_SPEED;
            if (ctrl_down)  player_y_reg <= player_y_reg - MOVE_SPEED;
            if (ctrl_left)  player_x_reg <= player_x_reg - MOVE_SPEED;
            if (ctrl_right) player_x_reg <= player_x_reg + MOVE_SPEED;

            // 设置计时器，延长计时器周期
            move_counter <= 500000; // 调整此值以更改计时器周期，假设每个时钟周期为10ns，这里设置为500000，即5ms
        end
    end

    // 输出玩家位置
    always @(posedge clk) begin
        player_x <= player_x_reg;
        player_y <= player_y_reg;
    end

endmodule

