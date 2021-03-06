`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2018 15:55:21
// Design Name: 
// Module Name: fifo_tx
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


module fifo_tx#(
    parameter N_BITS = 8 ,
              W = 4
   )
   (
       output wire empty, full,
       output wire [N_BITS-1:0] out_data,
       input wire clk ,rst ,    
       input wire  wr , rd,
       input wire [N_BITS-1:0] in_data
   );
   
   //signal declaration
   reg [N_BITS-1:0] array_reg[2**W-1:0];//register array
   reg [W-1:0] w_ptr_reg,w_ptr_next,w_ptr_succ;
   reg [W-1:0] r_ptr_reg,r_ptr_next,r_ptr_succ;
   reg full_reg,empty_reg,full_next,empty_next;
   wire wr_en;
   
   //body
     //register file write operation
   always@(posedge clk)
     if(wr_en)
     //begin
         array_reg[w_ptr_reg]<=in_data;
         //wr_en <=1'b0;
     //end
    //register file read operation
   assign out_data = array_reg[r_ptr_reg];
       //write enabled only when FIFO is not full
   assign wr_en = wr & ~full_reg;     
   
   //fifo control logic
   //register for read and write pointers
   always@(posedge clk)
       if(rst)
           begin
               w_ptr_reg <= 0;
               r_ptr_reg <= 0;
               full_reg <= 1'b0;
               empty_reg <= 1'b1;
               //wr_en <= 1'b0;
               //array_reg[w_ptr_reg]<=8'b0;
           end
       else
           begin
               w_ptr_reg <= w_ptr_next;
               r_ptr_reg <= r_ptr_next;
               full_reg <= full_next;
               empty_reg <= empty_next;
           end
   //next-state logic for read and write pointers
   always @*
   begin
       //successive pointer values
       //w_ptr_succ = w_ptr_reg + 1;
       //r_ptr_succ = r_ptr_reg + 1;
       //default:keep old values
       w_ptr_next = w_ptr_reg;
       r_ptr_next = r_ptr_reg;
       full_next = full_reg;
       empty_next = empty_reg;
       case({wr,rd})
           2'b01://read
               if(~empty_reg)//not empty
                   begin
                       r_ptr_next = r_ptr_succ;
                       full_next = 1'b0;
                       r_ptr_succ = r_ptr_reg + 1;
                       if(r_ptr_succ==w_ptr_reg)
                           empty_next=1'b1;
                       
                   end
           2'b10://write
               if(~full_reg)//not full
                   begin
                       w_ptr_next = w_ptr_succ;
                       empty_next=1'b0;
                       //wr_en = 1'b1;
                       //array_reg[w_ptr_reg]<=in_data;
                       if(w_ptr_succ == r_ptr_reg)
                           full_next=1'b1;
                       w_ptr_succ = w_ptr_reg + 1;
                   end
           2'b11://write and read
               begin
                   w_ptr_next = w_ptr_succ;
                   r_ptr_next = r_ptr_succ;
                   r_ptr_succ = r_ptr_reg + 1;
                   w_ptr_succ = w_ptr_reg + 1;
               end
       endcase
       r_ptr_succ = r_ptr_reg + 1;
       w_ptr_succ = w_ptr_reg + 1;
   end
   
   
  
      
   //output
   assign full = full_reg;
   assign empty = empty_reg;
       
endmodule
