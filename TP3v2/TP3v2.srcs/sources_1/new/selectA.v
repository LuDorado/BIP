`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2018 16:58:48
// Design Name: 
// Module Name: selectA
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


module selectA(
    output reg [15:0] o_2acc,
    input [15:0] i_fromOp,
    input [15:0] i_sExt,
    input [15:0] i_fromRAM,
    input [1:0] i_selA
    );
    localparam [1:0]
                RAM = 2'b00,
                SE = 2'b01,
                OP = 2'b10;
    reg [15:0] ram_value, sext_value, op_value;            
    always @*
    begin
        ram_value = i_fromRAM;
        sext_value = i_sExt;
        op_value = i_fromOp;
        case (i_selA)

                    RAM:
                    begin
                        o_2acc = ram_value;
                    end
                    SE:
                    begin
                        o_2acc = sext_value;
                    end
                    OP:
                    begin
                        o_2acc = op_value;
                    end
                    default:
                    begin
                        o_2acc = o_2acc;
                    end
        endcase
               
    end
    
endmodule
