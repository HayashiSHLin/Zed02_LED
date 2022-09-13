`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/13 16:36:13
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input clk,
    input reset,
    output [7:0] led
    );
    
    reg [31:0]  counter;
    
    reg [7:0]   led;
    always@(posedge clk or posedge reset)begin
        if(reset ) counter <= 0;
        else   counter <= counter==32'd100000000 ? 0 : counter + 1'd1;
    end
    always@(posedge clk or posedge reset)begin
        if(reset ) led <= 8'h1;
        else if(counter==32'd100000000) led <= (led <<1)|(led>>7);
    end
endmodule
