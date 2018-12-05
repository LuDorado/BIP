`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2018 16:58:48
// Design Name: 
// Module Name: signal_ext
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


module signal_ext(
    output reg [15:0] o_2selAB,
    input [10:0] i_dataFromRom
    );
    
    always @*
    begin
        o_2selAB = {5'b00000,i_dataFromRom};
    end
endmodule
