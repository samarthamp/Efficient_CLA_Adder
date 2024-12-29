# VLSI_Project
## Name: M.P. Samartha, 2023102038
### Email: m.samartha@students.iiit.ac.in

This is complete repository for the S2024 - VLSI Design Course Project. 
The project was to design an efficient and fast CLA adder and write the required Spice files, Make the complete layout in Magic editor, Write the required Verilog files.
Then finally to implement it in the hardware, we burn the verilog files onto the FPGA Board.

\*./Magic: It contains all the ".mag", ".ext" and the spice files
necessary to test the post layout circuit. It contains such files for
each individual gate. Note that the final circuit with CLA and FFs are
written in the "integrated_CLA_layout" files, please use them for the
final Magic/Post layout analysis.

\*./NGSpice Includes subfolders - CLA, Flipflops, Gates. Thus the spice
files for all the gates are in ./NGSpice/Gates and the TSPC FF uses is
present in ./NGSpice/Flipflops, and the final spice file integrating
everything required in in "./NGSpice/CLA/complete_ckt.cir".

\*./Verilog Contains both the design and the Testbench files. Currently
A = 13, B = 7 and C0 =1 has been set in TB. Change accordingly as
needed. The "helper_modules_design.v" contains the Verilog for the basic
gates, which is included in "cla_design.v"

\*./Vivado Contains the top Verilog file, design files, TB and .xdc
constraints file. Clk, reset are set through pushbuttons, and inputs are
given through SWs and are displayed on LEDs too. The final outputs are
displayed on LEDs. Detailed explanation will be provided in the report.

Thank You
