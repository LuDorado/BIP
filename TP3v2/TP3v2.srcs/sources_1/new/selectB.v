`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2018 16:58:48
// Design Name: 
// Module Name: selectB
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


module selectB(
    output reg [15:0] o_2Op,
    input [15:0] i_fromSExt,
    input [15:0] i_fromRAM,
    input i_selB
    );
    
    always @*
    begin
        if (i_selB)
            o_2Op = i_fromSExt;
        else
            o_2Op = i_fromRAM;
    end
    
endmodule
