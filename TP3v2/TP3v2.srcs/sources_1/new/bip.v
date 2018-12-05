`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2018 16:59:52
// Design Name: 
// Module Name: bip
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


module bip#(
    parameter BUS_SIZE = 16)
    (
        input clk,
        input rst,
        input rx,
        output [BUS_SIZE-1:0] dbus
    );
    wire [7:0] signal;
   /* uart
    mod_uart (
        .dout(signal),
        .clk(clk),
        .rst(rst),
        .rx(rx)
        //input rd
        );
        
   combus_ic (
            .cpu_en(signal),
            .acc_value,
            .cycles_count,
            .data_op_rdy,
            input clk,
            input rst,
            input rx_done,
            input tx_rdy,
            input op_done,
            input [7:0] cpu_rslt,
            input [7:0] rx_signal
            );
   cpu
   mod_proc (
            .dbus(dbus),
            .clk(clk),
            .rst(rst),
            .start(signal)
            );*/
endmodule
