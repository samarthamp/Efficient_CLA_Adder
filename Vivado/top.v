// Top file for Vivado

`timescale 1ns/1ps
`include "cla.v"

module CLA(
    input [3:0] A, B, 
    input C0,
    input clk,
    input reset,
    output [3:0] S,
    output Cout);

    cla_4_bit u_cla_4_bit (
        .A(A), .B(B), .C0(C0), .clk(clk), .reset(reset),
        .S(S), .Cout(Cout)
    );
endmodule
