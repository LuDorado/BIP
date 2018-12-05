`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.11.2018 23:50:54
// Design Name: 
// Module Name: decoder
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


module decoder #(
    parameter BUS_SIZE = 16,
              OPS_SIZE = 5
    )
    (
    output reg o_wr_pc,
    output reg [1:0] o_sel_A,
    output reg o_sel_B,
    output reg o_wr_acc,
    output reg o_op,
    output reg o_wr_ram,
    output reg o_rd_ram,
    //output reg o_addr,
    input clk,
    input rst,
    input i_start,
    input [OPS_SIZE-1:0] i_op_code
    );
    
    localparam [OPS_SIZE-1:0]
                HALT  = 5'b00000,
                STORE = 5'b00001,
                LOAD  = 5'b00010,
                LOADI = 5'b00011,
                ADD   = 5'b00100,
                ADDI  = 5'b00101,
                SUB   = 5'b00110,
                SUBI  = 5'b00111;
    reg state, next_state;
    always @ (posedge clk)
    begin
        if (rst)
            state <= 1'b0;
        else
            state <= next_state;
    end
    
    always @*
    begin
        next_state =state;
                    case (next_state)
                    1'b0:
                    begin
                        if (i_start)
                        begin
                            next_state = 1'b1;
                            o_wr_pc = 1'b1;
                        end
                        else
                        begin
                        
                            next_state = 1'b0;
                            o_wr_pc = 1'b0;
                        end
                    end 
                    1'b1:  
                    begin
                        case (i_op_code)
                                    HALT:
                                    begin
                                        o_wr_pc = 1'b0;
                                        //o_sel_A = 2'b00;
                                        //o_sel_B = 1'b0;
                                        //o_wr_acc = 1'b0;
                                        //o_op = 1'b1;
                                        //o_wr_ram = 1'b0;
                                        //o_rd_ram = 1'b0;
                                    end
                                    
                                    STORE:
                                    begin
                                        o_wr_pc = 1'b1;
                                        o_sel_A = 2'b10;
                                        //o_sel_B = 1'b0;
                                        o_wr_acc = 1'b1;
                                        //o_op = 1'b0;
                                        o_wr_ram = 1'b1;
                                        o_rd_ram = 1'b0;
                                    end
                                    
                                    LOAD:
                                    begin
                                        o_wr_pc = 1'b1;
                                        o_sel_A = 2'b00;
                                        //o_sel_B = 1'b0;
                                        o_wr_acc = 1'b1;
                                        //o_op = 1'b0;
                                        o_wr_ram = 1'b0;
                                        o_rd_ram = 1'b1;
                                    end
                                    
                                    LOADI:
                                    begin
                                        o_wr_pc = 1'b1;
                                        o_sel_A = 2'b01;
                                        //o_sel_B = 1'b0;
                                        o_wr_acc = 1'b1;
                                        //o_op = 1'b0;
                                        o_wr_ram = 1'b0;
                                        o_rd_ram = 1'b0;
                                    end
                                    
                                    ADD:
                                    begin
                                        o_wr_pc = 1'b1;
                                        //o_sel_A = 2'b00;
                                        o_sel_B = 1'b1;
                                        //o_wr_acc = 1'b0;
                                        o_op = 1'b1;
                                        o_wr_ram = 1'b0;
                                        o_rd_ram = 1'b0;
                                    end
                                    
                                    ADDI:
                                    begin
                                        o_wr_pc = 1'b1;
                                        //o_sel_A = 2'b00;
                                        o_sel_B = 1'b1;
                                        //o_wr_acc = 1'b0;
                                        o_op = 1'b1;
                                        o_wr_ram = 1'b0;
                                        o_rd_ram = 1'b0;
                                    end
                                    
                                    SUB:
                                    begin
                                        o_wr_pc = 1'b1;
                                        //o_sel_A = 2'b00;
                                        o_sel_B = 1'b1;
                                        //o_wr_acc = 1'b0;
                                        o_op = 1'b0;
                                        o_wr_ram = 1'b0;
                                        o_rd_ram = 1'b0;
                                    end
                                    
                                    SUBI:
                                    begin
                                        o_wr_pc = 1'b1;
                                        //o_sel_A = 2'b00;
                                        o_sel_B = 1'b1;
                                        //o_wr_acc = 1'b0;
                                        o_op = 1'b0;
                                        o_wr_ram = 1'b0;
                                        o_rd_ram = 1'b0;
                                    end
                                    
                                    default:
                                    begin
                                        //o_wr_pc = 1'b0;
                                        //o_sel_A = 2'b00;
                                        //o_sel_B = 1'b0;
                                        //o_wr_acc = 1'b0;
                                        //o_op = 1'b0;
                                        //o_wr_ram = 1'b0;
                                        //o_rd_ram = 1'b0;
                                    end
                        endcase
                     end
                 endcase
     end
endmodule

