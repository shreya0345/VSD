// UART Main Code without top-level module
module UART (
    input wire clk,
    input wire reset,
    input wire rx,
    output wire tx
);

parameter BAUD_RATE = 9600; // Default baud rate

// Internal registers
reg [7:0] data_reg;
reg [3:0] bit_count;
reg tx_reg;
reg rx_reg;
reg [15:0] baud_counter;

// Constants for baud rate generation
localparam CLK_FREQUENCY = 50000000; // Assuming 50MHz clock
localparam BIT_PERIOD = CLK_FREQUENCY / BAUD_RATE;
localparam HALF_BIT_PERIOD = BIT_PERIOD / 2;

// UART states
parameter IDLE = 2'd0;
parameter START_BIT = 2'd1;
parameter DATA_BITS = 2'd2;
parameter STOP_BIT = 2'd3;

// UART state register
reg [1:0] state;

// Transmitting process
always @(posedge clk) begin
    if (reset) begin
        tx_reg <= 1; // Start with high state
    end else begin
        case(state)
            IDLE: begin
                tx_reg <= 1;
                if (!rx) begin
                    state <= START_BIT;
                    bit_count <= 0;
                    baud_counter <= HALF_BIT_PERIOD;
                end
            end
            
            START_BIT: begin
                tx_reg <= 0;
                baud_counter <= baud_counter - 1;
                if (baud_counter == 0) begin
                    state <= DATA_BITS;
                    baud_counter <= BIT_PERIOD;
                end
            end
            
            DATA_BITS: begin
                tx_reg <= data_reg[bit_count];
                baud_counter <= baud_counter - 1;
                if (baud_counter == 0) begin
                    bit_count <= bit_count + 1;
                    if (bit_count == 7) begin
                        state <= STOP_BIT;
                    end
                    baud_counter <= BIT_PERIOD;
                end
            end
            
            STOP_BIT: begin
                tx_reg <= 1;
                baud_counter <= baud_counter - 1;
                if (baud_counter == 0) begin
                    state <= IDLE;
                end
            end
        endcase
    end
end

// Receiving process
always @(posedge clk) begin
    if (reset) begin
        rx_reg <= 1; // Start with high state
    end else begin
        rx_reg <= rx;
        if (state == IDLE && !rx && tx_reg) begin
            state <= START_BIT;
            bit_count <= 0;
            baud_counter <= HALF_BIT_PERIOD;
        end
    end
end

// Data register assignment
always @(posedge clk) begin
    if (reset) begin
        data_reg <= 8'h00;
    end else begin
        if (state == DATA_BITS && baud_counter == HALF_BIT_PERIOD) begin
            data_reg <= {rx_reg, data_reg[7:1]};
        end
    end
end

assign tx = tx_reg;

endmodule
