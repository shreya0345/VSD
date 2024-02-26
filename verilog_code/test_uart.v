// UART Testbench Code without top-level module
`timescale 1ns / 1ps

module UART_tb;

// Inputs
reg clk;
reg reset;
reg rx;

// Outputs
wire tx;

// Instantiate the UART module
UART UART_inst (
    .clk(clk),
    .reset(reset),
    .rx(rx),
    .tx(tx)
);

// Clock generation
always #5 clk = ~clk;

// Initial stimulus
initial begin
    clk = 0;
    reset = 1;
    rx = 1;
    
    #20 reset = 0; // De-assert reset after 20 time units
    
    // Test data
    #100 rx = 0; // Simulate start bit
    
    // Simulate receiving byte
    repeat (8) begin
        #10 rx = $random % 2;
    end
    
    #100 rx = 1; // Simulate stop bit
    #100 $stop; // End simulation
end

endmodule
