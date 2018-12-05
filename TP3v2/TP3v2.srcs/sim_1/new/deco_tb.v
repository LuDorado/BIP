`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2018 21:16:36
// Design Name: 
// Module Name: deco_tb
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


module deco_tb;

    wire [15:0] dbus;
    reg clk;
    reg rst;
    reg start;
    
    cpu uut (
        .dbus(dbus),
        .clk(clk),
        .rst(rst),
        .start(start)
        );
        
        
        initial begin
            // Initialize Inputs
            start = 0;
            clk = 1;
            rst = 0;
            #30
            rst = 1;
            #20
            rst=0;
            #300
            start=1;
            #20
            start=0;
    
        end
            
           always begin //clock de la placa 100Mhz
                #10 clk=~clk;
            end      
endmodule
