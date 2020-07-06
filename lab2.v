	`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2020 09:06:05 PM
// Design Name: 
// Module Name: lab2
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


module lab2(
     input clk,
     input reset1,
    input kb_clk1,
    input kb_data1,
    output [7:0] display_o 
    );
       wire negclk1; 
  neg_clk p1   (clk,kb_clk1, negclk1);   
  spi  p2  (negclk1,clk,reset1,kb_data1,display_o);
       
        



 
endmodule


     

