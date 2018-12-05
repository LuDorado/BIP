`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2018 17:44:33
// Design Name: 
// Module Name: datapath
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


module datapath(
        output [15:0] o_Acc2Ram,
        input clk,
        input [10:0] i_dataFromRom,
        input [15:0] i_dataFromRam,
        input [1:0] i_selaFromControl,
        input i_selbFromControl,
        input i_wrAccFromControl,
        input i_opFromcontrol
    );
    
    wire [15:0] o_2sels, selA2Acc, acc2Op, op2SelA, selB2op;
    
    signal_ext
    signalExt_unit (
                    .o_2selAB(o_2sels),
                    .i_dataFromRom(i_dataFromRom)
                   );
                   
    selectA
    selector_A (
               .o_2acc(selA2Acc),
               .i_fromOp(op2SelA),
               .i_sExt(o_2sels),
               .i_fromRAM(i_dataFromRam),
               .i_selA(i_selaFromControl)
               );
    accumulator
    accum (
           .o_2op(acc2Op),
           .clk(clk),
           .i_selA(selA2Acc),
           .i_wrAcc(i_wrAccFromControl)
           );
    
    selectB
    selector_B (
               .o_2Op(selB2op),
               .i_fromSExt(o_2sels),
               .i_fromRAM(i_dataFromRam),
               .i_selB(i_selbFromControl)
               );
               
    operation
    op (
                   .o_2selA(op2SelA),
                   .i_selB(selB2op),
                   .i_acc(acc2Op),
                   .i_op(i_opFromcontrol)
                   );
    assign o_Acc2Ram = acc2Op;
endmodule
