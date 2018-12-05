`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.11.2018 11:36:27
// Design Name: 
// Module Name: control
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


module control #(
    parameter BUS_SIZE = 16,
              OPS_SIZE = 5,
              ADD_SIZE = 11
    )
    (
    output [1:0] sel_A,
    output sel_B,
    output wr_Acc,
    output op,
    output wr_Ram,
    output rd_Ram,
    output [ADD_SIZE-1:0] rom_addr,
    input clk,
    input rst,
    input start,
    input [OPS_SIZE-1:0] opCode
    );
    
    wire wrPc; 
    wire [ADD_SIZE-1:0] addr;
    wire [ADD_SIZE-1:0] pc_value;
    
    decoder
    deco (
        .o_wr_pc(wrPc),
        .o_sel_A(sel_A),
        .o_sel_B(sel_B),
        .o_wr_acc(wr_Acc),
        .o_op(op),
        .o_wr_ram(wr_Ram),
        .o_rd_ram(rd_Ram),
        //output reg o_addr,
        .clk(clk),
        .rst(rst),
        .i_start(start),
        .i_op_code(opCode)
        );
            
   pc
   progCtr (
         .o_rom_addr(addr),
         .clk(clk),
         .rst(rst),
         .pc_en(wrPc),
         .i_new_pc(pc_value)
      );
      
   adder
   pcSum (
            .o_new_pc(pc_value),
            .i_old_pc(addr)
       );
   
   assign rom_addr = addr;
endmodule
