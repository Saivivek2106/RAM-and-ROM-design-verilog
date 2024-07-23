`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.06.2024 11:51:52
// Design Name: 
// Module Name: memory_test
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


module rom_test;
reg clk;
reg en;
reg [3:0] addr;
wire [3:0] out;
PROM8x4 DUT(.clock(clk),.enable(en),.address(addr),.data_out(out));
initial
begin
$dumpfile("dump.vcd");
$dumpvars(1,memory_test);
clk=1'b1;
forever #5 clk=~clk;
end
initial
begin
en=1'b0;
#10;
en=1'b1;
addr=4'b0000;
#10;
addr=4'b1010;
#10;
addr=4'b0101;
#10;
addr=4'b0010;
#10;
addr=4'b0100;
#10;
addr=4'b1000;
end
initial
begin
#200 $finish;
end
endmodule
