`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2018 21:10:48
// Design Name: 
// Module Name: uart
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


module uart(
    output dout,
    input clk,
    input rst,
    input rx
    //input rd
    );
    
    wire tick;
    wire rx_done_tick,rx_empty_tick, alu_ready2rd, alu2uart, ic_tx_empty_tick, tx_done_tick;
    wire [7:0] d_rx2fifo, d_rx2alu, val_A, val_B, d_alu2ic, d_alu2fifo, d_ic2tx;
    wire [5:0] val_OC;
    /*reg [7:0] data;
   always @(posedge clk)
       data <= d_alu2fifo;*/
    //
    brg
    BaudRateGenerator(
                        .s_tick(tick),
                        .clk(clk),
                        .rst(rst)
                    );
                    
    rx
    Receptor (
                .d_rx2ic(d_rx2fifo),//), dout
                .rx_done(rx_done_tick),
                .clk(clk),
                .rst(rst),
                .s_tick(tick),
                .rx(rx)
             );
   fifo 
    RxInterface (
                .empty (rx_empty_tick),
                .out_data (d_rx2alu),
                .clk (clk) ,
                .rst (rst) ,    
                .wr (rx_done_tick), 
                .rd (alu_ready2rd),
                .in_data (d_rx2fifo)   
           );

endmodule
