`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2018 17:08:56
// Design Name: 
// Module Name: combus_ic
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


module combus_ic (
    output reg cpu_en,
    output reg[15:0] acc_value,
    output reg[15:0] cycles_count,
    output reg data_op_rdy,
    input clk,
    input rst,
    input rx_done,
    input tx_rdy,
    input op_done,
    input [7:0] cpu_rslt,
    input [7:0] rx_signal
    );
    
    
    localparam [1:0]
            IDLE = 2'b00,
            BUSSY = 2'b01,
            PRINT = 2'b10;
     reg [3:0] counter;       
    // signal declaration
    reg [1:0] state, state_saved;    //ESTADOS
    
    always @(posedge clk)
    begin
        if (rst)
        begin
            state <= IDLE;
        end
        else
            state <= state_saved;
    end
    
    always @*
    begin
        state_saved <= state;
        case (state)
            IDLE:
                begin
                    data_op_rdy = 1'b0;
                    if (rx_done)
                    begin
                        cpu_en = 1'b1;
                        state_saved = BUSSY;
                    end
                end
                
            BUSSY:
                begin
                    data_op_rdy = 1'b0;
                    if (op_done)
                    begin
                        state_saved = PRINT; 
                     end                   
                end
                
            PRINT:
                begin
                    data_op_rdy = 1'b1;
                    if (tx_rdy)
                    begin
                        acc_value <= cpu_rslt;
                        cycles_count <= counter;
                        state_saved = IDLE;
                        cpu_en = 1'b0;
                    end   
                end
                
            default:
                begin
                    data_op_rdy = 1'b0;
                    cpu_en = 1'b0;
                    state_saved = IDLE;
                end
       endcase
    end
    
    always @(posedge clk)
    begin
        if(cpu_en)
            counter <= counter + 1'b1;
        else
            counter <=4'b0000;
    end
endmodule
