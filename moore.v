`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2020 05:12:47 PM
// Design Name: 
// Module Name: Moore_Machine
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




module spi(
    

	input  kb_negedge,
	input sys_clk,
	input  reset,
	input  kb_data,
	output  reg [7:0]  display_o
    );

    
   
	reg [7:0] buffer;
	reg [3:0] state;
	parameter
	Idle = 0,Read1 = 1,Read2 = 2,Read3 = 3,Read4 = 4,Read5 = 5,Read6 = 6,Read7 = 7,Read8 = 8,Check_P = 9,Read_Finished= 10;
    
  
  
  //Reading the serial data
  
	always @ ( posedge sys_clk )
	begin
	case(state)
	Idle : 
	      buffer <= 8'b00000000;
    Read1 :  
    begin  
            buffer[0] <= kb_data;

	end 
    Read2 :  
    begin  
            buffer[1] <= kb_data;

	end 
    Read3 :  
    begin  
            buffer[2] <= kb_data;

	end 
    Read4 :  
    begin  
            buffer[3] <= kb_data;

    end  
    Read5 :  
    begin  
            buffer[4] <= kb_data;

	end 
    Read6 :  
    begin  
            buffer[5] <= kb_data;

    end 
    Read7 :  
    begin  
            buffer[6] <= kb_data;

    end 
    Read8 :  
    begin  
            buffer[7] <= kb_data;

    end 
    Check_P :  //waiting for parity bit
    begin 	   end 	   
	Read_Finished : //waiting for stop bit
	             begin
				  display_o <= buffer;
				  end 
	default : display_o <= 8'b00000000;
				  
	 endcase
	 end
	always @ (posedge sys_clk)
	begin
	
	if (reset == 1) begin
	state <= Idle;
	end
	
	else if(kb_negedge == 1 ) begin
	
	case(state)
	Idle : begin
	       if (kb_data == 0) 
	       state <= Read1;
	       else 
	       state <= Idle;
	       end

    Read1 :  begin
           state <= Read2;
             end
    Read2 :  begin
           state <= Read3;
             end   
    Read3 :  begin
           state <= Read4;
             end
    Read4 :  begin
           state <= Read5;
             end      
    Read5 :  begin
           state <= Read6;
             end
    Read6 :  begin
           state <= Read7;
             end   
    Read7 :  begin
           state <= Read8;
             end
    Read8 :  begin
           state <= Check_P;
             end 
    Check_P :  begin
           if (kb_data == 0) 
           state <= Read_Finished;
           else
           state <= Idle;
          
             end 
    Read_Finished : begin
             if (kb_data == 1)
			   state <= Idle;
			   end
	default :begin
	         state 	<= Idle;  end 
    endcase
    end
	end
	

	 
endmodule
	
	
		   
		   
	
	
	
	
	
	

