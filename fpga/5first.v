`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2023 11:12:10 AM
// Design Name: 
// Module Name: 5first
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


module oscilloscope(
    input clk,
    input rst,
    output hsync,
    output vsync,
    output [3:0] red,
    output [3:0] green,
    output [3:0] blue,
    output convstb,
    // input busy, // may not be needed
    output csb,
    output rdb,
    input [7:0] db);
    // your code here
    
    wire convstb;
    wire csb;
    wire rdb;

    reg [8:0] CONVcount;
    reg [8:0] CSBcount;
    reg [8:0] RDBcount; 
    assign convstb = (CONVcount < 3) ? 1'b0 : 1'b1;
    assign csb = (CSBcount < 1) ? 1'b0 : 1'b1;
    assign rdb = (RDBcount < 1) ? 1'b0 : 1'b1;
    always @(posedge clk or negedge rst) begin
        if (~rst) begin // if rst==0
            CONVcount <= 9'd0;
            CSBcount <= 9'd0;
            RDBcount <= 9'd0;
        end else begin
            if (CONVcount < 9'd449) begin
                CONVcount <= CONVcount + 9'd1; 
            end else begin  //End of BUSY pulse width
                CSBcount <= CSBcount + 9'd1;    //Start CS
                if(CSBcount > 1) begin          //
                    RDBcount <= RDBcount + 9'd1;
                    if(RDBcount>0) begin
                    //Read
                        if() begin
                            RDBcount <= RDBcount + 9'd1;
                        end
                    end
                    CSBcount <= CSBcount + 9'd1;
                    
                    RDBcount <= 9'd0;
                    CSBcount <= 9'd0;
                end
                
                
            end
        end
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    reg [1:0] Pcount;     // declare 2-bit register
    reg [9:0] Hcount;   // declare 10-bit register
    reg [9:0] Vcount;   // declare 10-bit register
    
    reg [9:0] x;   // declare 10-bit register
    reg [9:0] y;   // declare 10-bit register
    
    wire pixelClk;
    wire hsync;
    wire vsync;
   
    reg [3:0] red;
    reg [3:0] blue;
    reg [3:0] green;

    // Pulse width
    assign pixelClk = (Pcount < 2'd2) ? 1'b0 : 1'b1; // 50%
    assign hsync = (Hcount < 10'd96) ? 1'b0 : 1'b1; // uses if/else
    assign vsync = (Vcount < 10'd2) ? 1'b0 : 1'b1; // uses if/else

    //Pixel clock
    always @(posedge clk) begin   
        if (Pcount < 2'd3) begin
            Pcount <= Pcount + 4'd1;
        end else begin
            Pcount <= 2'd0; //reset
        end
    end
    
    //Hsync and vsync
    always @(posedge pixelClk or negedge rst) begin
        if (~rst) begin // if rst==0
            Hcount <=10'd0;   // set the flip flops all equal to zero
            Vcount <= 10'd0;  // set the flip flops all equal to zero
        end else begin
            if (Hcount < 10'd799) begin     //Sync Pulse
                Hcount <= Hcount + 10'd1;
                y <= Hcount - 144;
            end else begin
                Hcount <= 10'd0;
                Vcount <= Vcount + 10'd1;
                x <= Vcount - 31;
            if(Vcount >= 10'd520) begin     //Sync Pulse (new row)
                    Vcount <= 10'd0;
                end
            end
        end
    end

    // x = hsync counter (Hcount)
    // y = vsync counter (Vcount)
    always @(posedge pixelClk) begin
        if( (Vcount>=10'd31 && Vcount<=10'd510) && (Hcount>=10'd144 && Hcount<=10'd783))begin       // Only display time Vsync and Only display time Hsync
            if(58/*Whatever code*/)begin
            end
            else begin
            red = 4'b0000;
            green = 4'b0000;
            blue = 4'b0000;
            end
        end
    end
    
    
endmodule
