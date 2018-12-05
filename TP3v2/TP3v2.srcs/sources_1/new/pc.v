`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2018 00:54:00
// Design Name: 
// Module Name: pc
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


module pc #(
    parameter PC_SIZE = 11
    )
    (
    output  [PC_SIZE-1:0] o_rom_addr,
    input clk,
    input rst,
    input pc_en,
    input [PC_SIZE-1:0] i_new_pc
    );
    
    reg [PC_SIZE-1:0] pc_value, pc_new_value;
    
    always @ (posedge clk)
    begin
        if (rst)
            pc_value <= 0;
        else
            pc_value <= pc_new_value;
    end
    
    always @*
    begin
        if (pc_en)
            pc_new_value = i_new_pc;
            
        else
            pc_new_value = pc_value;
    end
    
    assign o_rom_addr = pc_value;
endmodule
