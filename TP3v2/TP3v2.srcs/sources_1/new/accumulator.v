`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2018 16:58:48
// Design Name: 
// Module Name: accumulator
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


module accumulator(
    output [15:0] o_2op,
    input clk,
    input [15:0] i_selA,
    input i_wrAcc
    );
    
    reg signed [15:0] value, new_value;
    
    always @(posedge clk)
    begin
        value <= new_value;
    end
    
    always @*
    begin
        if (i_wrAcc)
            new_value = i_selA;
        else
            new_value = 16'b0;
    end
    
    assign o_2op = value;
endmodule
