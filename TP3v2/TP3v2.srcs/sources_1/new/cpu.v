`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2018 19:48:17
// Design Name: 
// Module Name: cpu
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


module cpu #(
    parameter BUS_SIZE = 16,
              OPS_SIZE = 5,
              ADD_SIZE = 11
    )
    (
    output [BUS_SIZE-1:0] dbus,
    input clk,
    input rst,
    input start
    );
    
    wire [1:0] selA;
    wire selB, wrAcc, op_sel, wrRam, rdRam;
    wire [BUS_SIZE-1:0] data_bus, SExt2sels, acc2ram,ram2sels;
    wire [ADD_SIZE-1:0] addr_bus;
    
    control
    controlUnit (
            .sel_A(selA),
            .sel_B(selB),
            .wr_Acc(wrAcc),
            .op(op_sel),
            .wr_Ram(wrRam),
            .rd_Ram(rdRam),
            .rom_addr(addr_bus),
            .clk(clk),
            .rst(rst),
            .start(start),
            .opCode(data_bus[BUS_SIZE-1:ADD_SIZE])
            );

    rom
    programMemo (
            .o_data(data_bus[BUS_SIZE-1:0]),
            .clk(clk),
            .i_addr(addr_bus[OPS_SIZE-2:0])
         );
    
    datapath
    datapathUnit (
                 .o_Acc2Ram(acc2ram),
                 .clk(clk),
                 .i_dataFromRom(data_bus[ADD_SIZE-1:0]),
                 .i_dataFromRam(ram2sels),
                 .i_selaFromControl(selA),
                 .i_selbFromControl(selB),
                 .i_wrAccFromControl(wrAcc),
                 .i_opFromcontrol(op_sel) 
             );
   ram
   dataMemo (
             .o_data(ram2sels),
             .i_clk(clk),
             .i_rd(rdRam),
             .i_wr(wrRam),
             .i_addr(data_bus[ADD_SIZE-1:0]),
             .i_datafromAcc(acc2ram)
             );
             
   assign dbus = acc2ram;
   
endmodule
