`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2020 05:08:34 PM
// Design Name: 
// Module Name: neg_clk
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


module neg_clk (input posclk,input kbclk, output reg negclk);
reg current_value=1'b0;
    reg previous_value=1'b0;
   
    
    
    
    always@ (posedge posclk)
       begin
       current_value<=kbclk ;
         if (current_value==0 & current_value!=previous_value) 
            
            negclk <= 1'b1;
            
         else
            
             negclk <= 1'b0;
             
        previous_value<=current_value;
      end
      
endmodule 