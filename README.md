This repository contains the Verilog code and testbench for a Car Parking System designed to count cars entering and exiting a parking lot. The system includes features to track the total number of cars, detect when the parking lot is full, and indicate when it is empty.

Features
Car Counter: Keeps track of the number of cars in the parking lot (up to 15 cars).
Full Detection: Indicates when the parking lot is full.
Empty Detection: Signals when the parking lot is empty.
Parameterized Maximum Capacity: Easily adjustable maximum car capacity.
File Structure
arduino
Copy code
car_parking_system/
├── car_parking_rtl.v       // RTL design for the car parking system
├── car_parking_tb.v        // Testbench for simulation
├── README.md               // Project documentation
RTL Design
The main RTL design, car_parking_rtl.v, includes:

A 4-bit counter to track the number of cars.
Inputs for clock, reset, car entry, and car exit.
Outputs to signal when the parking lot is full or empty.
Parameters
verilog
Copy code
parameter MAX_CARS = 4'd10; // Maximum capacity of the parking lot
Testbench
The testbench, car_parking_tb.v, validates the functionality of the system by:

Generating a clock signal.
Simulating car entries and exits.
Testing edge cases, such as the parking lot becoming full or empty.
Simulation Workflow
Initialization: The parking lot is reset and starts empty.
Car Entry: Cars are added one at a time until the lot is full.
Car Exit: Cars are removed one at a time until the lot is empty.
Edge Cases: Tests include scenarios such as attempting to add cars when full or removing cars when empty.
Simulation Results
Below are the expected outcomes for key scenarios:

Scenario	Expected Counter	Full Signal	Empty Signal
After reset	0	0	1
1 car enters	1	0	0
Parking lot becomes full	10	1	0
Parking lot becomes empty	0	0	1
How to Run
Clone the repository:

bash
Copy code
git clone https://github.com/sanjeev-vlsi-design/car_parking_system.git  
cd car_parking_system  
Open the files in a Verilog simulator (e.g., ModelSim, Xilinx Vivado, or Icarus Verilog).

Simulate the testbench file car_parking_tb.v to observe the behavior of the system.

Future Improvements
Add additional features like dynamic parking fees.
Extend counter width for larger parking lots.
Introduce priority parking spaces or advanced signaling.
