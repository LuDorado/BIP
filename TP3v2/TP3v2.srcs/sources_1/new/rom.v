`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2018 16:54:09
// Design Name: 
// Module Name: rom
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


module rom #(
    parameter DATA_SIZE = 16,
              ADD_SIZE = 11,
              BLOCK_SIZE = 4
    )
    (
    output reg [DATA_SIZE-1:0] o_data,
    input clk,
    input [BLOCK_SIZE-1:0] i_addr
    );
    
    reg [DATA_SIZE-1:0] rom_pos;
   
    always @ (posedge clk)
    begin
        case (i_addr)
            4'b0000: o_data <= 16'b0000000000000000;
            4'b0001: o_data <= 16'b0001100000001000; //LDI 8
            4'b0010: o_data <= 16'b0011100000000100; //SUBI 4
            4'b0011: o_data <= 16'b0000100000000000; //STO 0
            4'b0100: o_data <= 16'b0010100000000001; // ADDI 1
            4'b0101: o_data <= 16'b0000100000000001; //STO 1
            4'b0110: o_data <= 16'b0001000000000000; //LD 0
            4'b0111: o_data <= 16'b0010000000000001; //ADD 1
            4'b1000: o_data <= 16'b0000100000000010; //STO 2
            4'b1001: o_data <= 16'b0001000000000001; //LD 1
            4'b1010: o_data <= 16'b0011000000000000; //SUB 0
            4'b1011: o_data <= 16'b0000000000000000;
            default: o_data <= 16'b0000000000000000;
        endcase
    end
endmodule
