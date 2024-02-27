`timescale 1ns/1ns

module uart_transmitter_tb;

// Parameters
parameter CLK_PERIOD = 10;

// Signals
reg clk;
reg rst_n;
reg start_tx;
reg [7:0] tx_data;
wire tx_busy;
wire tx_done;
reg tx;

// Instantiate DUT
uart_transmitter dut (
    .clk(clk),
    .rst_n(rst_n),
    .start_tx(start_tx),
    .tx_data(tx_data),
    .tx_busy(tx_busy),
    .tx_done(tx_done),
    .tx(tx)
);

// Clock generation
always #(CLK_PERIOD/2) clk = ~clk;

// Initial stimulus
initial begin
    clk = 0;
    rst_n = 0;
    start_tx = 0;
    tx_data = 8'b0;
    #100 rst_n = 1;
    #100 start_tx = 1;
    #100 start_tx = 0;
    #100;
    $finish;
end

// Monitor
always @(posedge clk) begin
    if (tx_busy) begin
        $display("Transmitting: %b", tx);
    end
    if (tx_done) begin
        $display("Transmission Complete");
    end
end

endmodule
