`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2018 18:12:38
// Design Name: 
// Module Name: adder
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


module adder #(
    parameter PC_SIZE = 11
    )
    (
    output [PC_SIZE-1:0] o_new_pc,
    input [PC_SIZE-1:0] i_old_pc
    );
    
    assign o_new_pc = i_old_pc + 1'b1;
endmodule
