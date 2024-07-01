`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 11:07:05
// Design Name: 
// Module Name: PROM8x4
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
// To design a 8x4 Programmable Read only memory
// It has 3 address lines(8=2^3)
// In ROM data can only be read, it can't be driven by user.
//     enable      functionality
//      0            no data is read
//      1             data will be read

module PROM8x4(
    input [3:0] address,
    input clock,
    input enable,
    output reg [3:0] data_out
    );
    wire [3:0] memory[15:0]; // 2D array representation
                           //  16 words of memory each of 4 bits.
    always@(posedge clock)
    begin
    if(enable)
    begin
   // data_out<=memory[address];
    case (address)
    4'd0: data_out=4'b0010;//2
    4'd1: data_out=4'b0100;//4
    4'd2: data_out=4'b0110;//6
   4'd3 :  data_out=4'b1000;//8
    4'd4: data_out=4'b1010;//10
    4'd5: data_out=4'b1100;//12
    4'd6: data_out=4'b1110;//14
    4'd7: data_out=4'b0000;//0
    4'd8: data_out=4'b0001;//1
    4'd9: data_out=4'b0011;//3
    4'd10: data_out=4'b0101;//5
    4'd11: data_out=4'b0111;//7
    4'd12: data_out=4'b1001;//9
    4'd13: data_out=4'b1011;//11
    4'd14: data_out=4'b1101;//13
    4'd15: data_out=4'b1111;//15
    endcase
    end
      else
      data_out<=4'bxxxx;  
      end
        
endmodule
