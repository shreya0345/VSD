module uart_transmitter (
    input clk,          // System Clock
    input rst_n,        // Reset (active low)
    input start_tx,     // Start transmission
    input [7:0] tx_data,// Data to transmit
    output reg tx_busy, // Transmission busy flag
    output reg tx_done, // Transmission done flag
    output reg tx       // Transmitted data line
);

// UART parameters
parameter BAUD_RATE = 9600;
parameter CLK_FREQ = 50000000; // Assuming a 50MHz clock

// Internal registers
reg [3:0] count;
reg [9:0] bit_count;
reg [7:0] data_reg;

// State machine states
parameter IDLE = 2'b00;
parameter START_BIT = 2'b01;
parameter DATA_BITS = 2'b10;
parameter STOP_BIT = 2'b11;

// UART baud rate generator
reg [15:0] baud_counter;
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        baud_counter <= 16'd0;
    end else begin
        if (baud_counter == (CLK_FREQ / (BAUD_RATE * 16)) - 1) begin
            baud_counter <= 16'd0;
        end else begin
            baud_counter <= baud_counter + 1;
        end
    end
end

// State machine for UART transmission
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        count <= IDLE;
        tx <= 1'b1;
        tx_busy <= 1'b0;
        tx_done <= 1'b0;
    end else begin
        case (count)
            IDLE: begin
                if (start_tx) begin
                    count <= START_BIT;
                    data_reg <= tx_data;
                end
            end
            START_BIT: begin
                if (baud_counter == (CLK_FREQ / (BAUD_RATE * 16)) - 1) begin
                    count <= DATA_BITS;
                    bit_count <= 10'd0;
                    tx <= 1'b0; // Start bit
                end
            end
            DATA_BITS: begin
                if (baud_counter == (CLK_FREQ / (BAUD_RATE * 16)) - 1) begin
                    if (bit_count < 8) begin
                        tx <= data_reg[bit_count];
                        bit_count <= bit_count + 1;
                    end else begin
                        count <= STOP_BIT;
                    end
                end
            end
            STOP_BIT: begin
                if (baud_counter == (CLK_FREQ / (BAUD_RATE * 16)) - 1) begin
                    tx <= 1'b1; // Stop bit
                    tx_done <= 1'b1;
                    tx_busy <= 1'b0;
                    count <= IDLE;
                end
            end
            default: begin
                count <= IDLE;
            end
        endcase
    end
end

endmodule
