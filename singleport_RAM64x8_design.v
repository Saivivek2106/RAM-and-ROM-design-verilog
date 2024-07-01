`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2024 15:31:43
// Design Name: 
// Module Name: singleport_RAM64x8_design
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
//To design 64x8 single port Random Access memory
//64-2^6 ,6 adress bits; 64 address lines
/* reset  Enable     read          Function
     1       x          x         output- 4'b0000         
     0       0          x         none(output - 4'bzzzz)
     0       1          0         write the selected word
     0       1          1          Read the selected word */
module singleport_RAM64x8_design(
    input [7:0] data_in,
    input [5:0] address,
    input read,
    input enable,
    input clk,
    input reset,
    output  [7:0] data_out
    );
    reg [5:0] address_reg ;// address registar
    reg [7:0]memory[63:0]; // 2 dimentional array declaration.A memory of 64 words 
                           //declared with 8 bits per word
      always@(posedge clk)
      if(reset) begin
      data_out=8'h00;
      end
     else if(enable )
      begin
      if(read)
      address_reg<=address;
      else
      memory[address]<=data_in;
      end
      assign data_out= memory[address_reg];
endmodule
