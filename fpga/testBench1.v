`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2023 01:19:52 PM
// Design Name: 
// Module Name: testBench1
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

module testBench1();
    reg rst,clk;
    wire hsync;
    wire vsync;
    wire [3:0] red;
    wire [3:0] blue;
    wire [3:0] green;

    oscilloscope gc0(clk,rst,hsync,vsync,red,green,blue,convstb,csb,rdb,db);

    always begin
        #5 clk = ~clk; // trigger the clock every 10 ticks
    end

    initial begin
        rst = 1'b0; // reset the system
        clk = 1'b0; // set the initial value of the clock
        #15
        rst = 1'b1; // start the state clk
        #4000000000; // let it run for 400 million time ticks

    end

    always @(posedge clk) begin
        $display("clk=%b convstb=%b csb=%b rdb=%b",clk,convstb,csb,rdb,$time);
    end
endmodule
