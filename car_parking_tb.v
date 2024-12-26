module car_parking_tb;

reg clk;
reg reset;
reg car_in;
reg car_out;
wire [3:0] counter;
wire full;
wire empty;

// Instantiate the parking lot counter module
car_parking uut (
    .clk(clk),
    .reset(reset),
    .car_in(car_in),
    .car_out(car_out),
    .counter(counter),
    .full(full),
    .empty(empty)
);

// Clock generation
always #5 clk = ~clk;

initial begin
    // Initialize the inputs
    clk = 0;
    reset = 1;
    car_in = 0;
    car_out = 0;

    // Apply reset
    #10 reset = 0;

    // Test car entry
    #10 car_in = 1; #10 car_in = 0; // 1 car entered

    // Test car exit
    #10 car_out = 1; #10 car_out = 0; // 1 car left
    #10 car_in = 1; #10 car_in = 0; // 2 cars entered


    // Fill the parking lot
    repeat (9) begin
        #10 car_in = 1; #10 car_in = 0;
    end

    // Check for full lot
    #20;

    // Empty the parking lot
    repeat (5) begin
        #10 car_out = 1; #10 car_out = 0;
    end

 repeat (5) begin
        #10 car_in = 1; #10 car_in = 0;
    end

repeat (10) begin
        #10 car_out = 1; #10 car_out = 0;
    end


    #20 $finish;
end

endmodule

