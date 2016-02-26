`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// 
// Module - data_memory.v
// Description - 8-Bit wide data memory. An example that shows how to prepare/initialize
// data memory
//
// INPUTS:-
// Address: 8-Bit address input port.
// WriteData: 8-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 8-Bit registered output port.
//
// FUNCTIONALITY:-
// Create a memory and initialize it by reading from a test data.  
// The 'WriteData' value is written into the address 
// in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 

    input [4:0] Address;   // Input Address 
    input [7:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite;         // Control signal for memory write 
    input MemRead;          // Control signal for memory read 

    output reg[7:0] ReadData; // Contents of memory location at Address

    reg [7:0] Memory[0:31];    // size needs to be adjusted based on the size of the test_data.txt
   
    always @(posedge Clk) begin      //Memory write
        if (MemWrite==1)
            Memory[Address] = WriteData;
    end

    always @(Address or MemRead) begin
        if (MemRead == 1)
            ReadData <= Memory[Address];    //Memory read
    else
        ReadData <= 8'h00;
    end 
    
    initial begin
	    $readmemh("test_data2.txt", Memory);
        // Notes: 
        // 1-make sure to adjust the "Memory" size based on your test input
        // 2-watch out for wild characters at the end of the last entry in your test file
        
    end
        
endmodule
