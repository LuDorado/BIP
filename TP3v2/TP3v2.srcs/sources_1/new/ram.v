`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2018 16:52:58
// Design Name: 
// Module Name: ram
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


module ram #( 
    parameter DATA_WIDTH = 16,
    parameter ADDR_WIDTH = 11
    )
    (
    output [DATA_WIDTH-1:0] o_data,
    input i_clk,
    input i_rd,
    input i_wr,
    input [ADDR_WIDTH-1:0] i_addr,
    input [DATA_WIDTH-1:0] i_datafromAcc
    );
    
    // signal declaration
        reg [DATA_WIDTH-1: 0] block [ 2**3 : 0];
        reg [ADDR_WIDTH -1: 0] addr_reg;
        
        // body
        always@(posedge i_clk)
        begin
            if (i_rd)
                addr_reg <= i_addr;
            else
                addr_reg <=16'b000000000000000;
        end
        
        always @(negedge i_clk)
        begin
            if (i_wr) // write operation
                block [i_addr] <= i_datafromAcc;
        end
        // read operation
        assign o_data = block [addr_reg];
endmodule
