module car_parking_rtl(
    input wire clk,         // Clock signal
    input wire reset,       // Reset signal
    input wire car_in,      // Car enters the parking lot
    input wire car_out,     // Car leaves the parking lot
    output reg [3:0] counter, // 4-bit counter for tracking cars (can handle up to 15 cars)
    output reg full,        // Signal if parking lot is full
    output reg empty        // Signal if parking lot is empty
);

parameter MAX_CARS = 4'd10; // Define the maximum number of cars (e.g., 10 cars)

always @(posedge clk or posedge reset) begin
    if (reset) begin
        // Reset the counter and signals
        counter <= 4'd0;
        full <= 1'b0;
        empty <= 1'b1;
    end
    else begin
        // Handle car entry
        if (car_in && !full) begin
            counter <= counter + 1'b1;
        end
        
        // Handle car exit
        if (car_out && !empty) begin
            counter <= counter - 1'b1;
        end

        // Check if the parking lot is full
        if (counter == MAX_CARS) begin
            full <= 1'b1;
        end
        else begin
            full <= 1'b0;
        end

        // Check if the parking lot is empty
        if (counter == 4'd0) begin
            empty <= 1'b1;
        end
        else begin
            empty <= 1'b0;
        end
    end
end

endmodule


