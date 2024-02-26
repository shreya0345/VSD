module uart_tb;

reg clk, reset, start;
reg [7:0] data;
wire tx_busy, tx_done, tx;

uart_tx uut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .data(data),
    .tx_busy(tx_busy),
    .tx_done(tx_done),
    .tx(tx)
);

initial begin
    clk = 0;
    reset = 1;
    start = 0;
    data = 8'h00;
    
    #10 reset = 0;
    
    #10 start = 1;
    data = 8'hFF;
    #100 start = 0;
    
    #100 $finish;
end

always #5 clk = ~clk;
initial begin
  $dumpfile("dumpfile.vcd");
  $dumpvars;
end
endmodule

module uart_tx (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [7:0] data,
    output reg tx_busy,
    output reg tx_done,
    output reg tx
);
// Define your module internals here
// You can use reset, clk, and start inside this module
// Example:
// always @(posedge clk or posedge reset) begin
//     if (reset) begin
//         // Reset behavior
//     end else begin
//         // Non-reset behavior
//     end
// end
endmodule
