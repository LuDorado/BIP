`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2018 16:58:48
// Design Name: 
// Module Name: operation
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


module operation(
    output reg [15:0] o_2selA,
    input [15:0] i_selB,
    input [15:0] i_acc,
    input i_op
    );
    
    always @*
    begin
        if (i_op)
            o_2selA = i_selB + i_acc;
        else
            o_2selA = i_acc - i_selB;
    end
    
endmodule
