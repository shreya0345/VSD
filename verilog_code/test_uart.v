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

// Instantiate topLevel module
topLevel top (
    .Output(tx)  // Connect topLevel's Output port to tx
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

module topLevel(output [1:0] Output);

    wire[1:0] PC;

    sum s1 (
        .PC(PC)  // Connect sum's PC output to PC wire
    );

    assign Output = PC;

endmodule


module sum(output [1:0] PC);

    assign PC = 2'b11;

endmodule

