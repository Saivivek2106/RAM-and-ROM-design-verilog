`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.06.2024 16:25:13
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


module memory_test;
reg [7:0]in;
 reg [5:0] addr;
 reg en;
reg rd;
reg clk;
reg rst;
wire [7:0] out;
singleport_RAM64x8_design DUT(.data_in(in),.address(addr),.enable(en),.reset(rst),.read(rd),.data_out(out),.clk(clk));
initial
begin
$dumpfile("dump.vcd");
$dumpvars(1,memory_test);
clk=1'b1;
forever #5 clk=~clk;  //clk signal generating with a period of 10ns
end
initial
begin
en=0;
rst=1;
in=8'h01;
addr=6'd0;
rd=0;
#10;
          rst=0;
          en=1;
          in=8'h01;
          addr=6'd0;
    
#10;
          in=8'h02;
          addr=6'd1;
 #10;
 rst=1;
 #10;
         in=8'h03;
         addr=6'd2;
 #10;
        rd=1;
        addr=6'd0;
        rd=1;
 #10;
      
        addr=6'd1;
  #10;
        addr=6'd2;
   #10;
        in=8'h04;
        addr=6'd1;
   #10;
   rd=0;
   addr=6'd2;
   #20;
   rd=1;
   addr=6'd2;
   end         
initial
begin
#250 $finish;
end

endmodule
