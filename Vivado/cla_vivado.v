// Vivado Design file for 4-bit Carry Lookahead Adder

module cla_4_bit(
    input [3:0] A, B, 
    input C0,
    input clk,
    input reset,
    output [3:0] S,
    output Cout
);

wire [3:0] A_after, B_after, S_before;
wire Cout_before, C0_after;
wire [3:0] P_bar, G_bar;
wire P_out_bar, G_out_bar;

D_flipflop ff_A0 (.d(A[0]), .clk(clk), .reset(reset), .q(A_after[0]));
D_flipflop ff_A1 (.d(A[1]), .clk(clk), .reset(reset), .q(A_after[1]));
D_flipflop ff_A2 (.d(A[2]), .clk(clk), .reset(reset), .q(A_after[2]));
D_flipflop ff_A3 (.d(A[3]), .clk(clk), .reset(reset), .q(A_after[3]));

D_flipflop ff_B0 (.d(B[0]), .clk(clk), .reset(reset), .q(B_after[0]));
D_flipflop ff_B1 (.d(B[1]), .clk(clk), .reset(reset), .q(B_after[1]));
D_flipflop ff_B2 (.d(B[2]), .clk(clk), .reset(reset), .q(B_after[2]));
D_flipflop ff_B3 (.d(B[3]), .clk(clk), .reset(reset), .q(B_after[3]));

D_flipflop ff_C0 (.d(C0), .clk(clk), .reset(reset), .q(C0_after));

D_flipflop ff_S0 (.d(S_before[0]), .clk(clk), .reset(reset), .q(S[0]));
D_flipflop ff_S1 (.d(S_before[1]), .clk(clk), .reset(reset), .q(S[1]));
D_flipflop ff_S2 (.d(S_before[2]), .clk(clk), .reset(reset), .q(S[2]));
D_flipflop ff_S3 (.d(S_before[3]), .clk(clk), .reset(reset), .q(S[3]));

D_flipflop ff_Cout (.d(Cout_before), .clk(clk), .reset(reset), .q(Cout));

cla_4_bit_logic u_cla_4_bit_logic (
    .A(A_after), .B(B_after), .C0(C0_after),
    .S(S_before), .Cout(Cout_before),
    .P_bar(P_bar), .G_bar(G_bar),
    .P_out_bar(P_out_bar), .G_out_bar(G_out_bar)
);

endmodule

module cla_4_bit_logic(
    input [3:0] A, B,
    input C0,
    output [3:0] S,
    output Cout,
    output [3:0] P_bar, G_bar,
    output P_out_bar, G_out_bar
);

wire node01, node11, node21, node31;
wire node02, node12, node22, node32;
wire node03, node13, node23, node33;
wire node14, node24, node34;
wire node15, node25, node35, node36;

not_gate u_not1 (.in(C0), .out(C0_bar));

xor_gate u_xor4 (.a(A[0]), .b(B[0]), .out(node01));
xor_gate u_xor3 (.a(A[1]), .b(B[1]), .out(node11));
xor_gate u_xor2 (.a(A[2]), .b(B[2]), .out(node21));
xor_gate u_xor1 (.a(A[3]), .b(B[3]), .out(node31));

nor_gate u_nor4 (.a(A[0]), .b(B[0]), .out(P_bar[0]));
nor_gate u_nor3 (.a(A[1]), .b(B[1]), .out(P_bar[1]));
nor_gate u_nor2 (.a(A[2]), .b(B[2]), .out(P_bar[2]));
nor_gate u_nor1 (.a(A[3]), .b(B[3]), .out(P_bar[3]));

nand_gate u_nand4 (.a(A[0]), .b(B[0]), .out(G_bar[0]));
nand_gate u_nand3 (.a(A[1]), .b(B[1]), .out(G_bar[1]));
nand_gate u_nand2 (.a(A[2]), .b(B[2]), .out(G_bar[2]));
nand_gate u_nand1 (.a(A[3]), .b(B[3]), .out(G_bar[3]));

or_gate u_or4 (.a(C0_bar), .b(P_bar[0]), .out(node02));
or_gate u_or3 (.a(G_bar[0]), .b(P_bar[1]), .out(node12));
or_gate u_or2 (.a(G_bar[1]), .b(P_bar[2]), .out(node22));
or_gate u_or1 (.a(G_bar[2]), .b(P_bar[3]), .out(node32));

nand_gate u_nand8 (.a(node02), .b(G_bar[0]), .out(node03));
nand_gate u_nand7 (.a(node12), .b(G_bar[1]), .out(node13));
nand_gate u_nand6 (.a(node22), .b(G_bar[2]), .out(node23));
nand_gate u_nand5 (.a(node32), .b(G_bar[3]), .out(node33));

nor_gate u_nor7 (.a(P_bar[1]), .b(P_bar[0]), .out(node14));
nor_gate u_nor6 (.a(P_bar[2]), .b(P_bar[1]), .out(node24));
nor_gate u_nor5 (.a(P_bar[3]), .b(P_bar[2]), .out(node34));

and_gate u_and3 (.a(node14), .b(C0), .out(node15));
and_gate u_and2 (.a(node24), .b(node03), .out(node25));
and_gate u_and1 (.a(node34), .b(node13), .out(node35));

or_gate u_or6 (.a(node13), .b(node15), .out(node16));
or_gate u_or5 (.a(node23), .b(node25), .out(node26));

nor_gate u_nor8 (.a(node33), .b(node35), .out(G_out_bar));
nand_gate u_nand9 (.a(node34), .b(node14), .out(P_out_bar));
or_gate u_or7 (.a(C0_bar), .b(P_out_bar), .out(node36));

nand_gate u_nand10 (.a(node36), .b(G_out_bar), .out(Cout));

xor_gate u_xor8 (.a(C0), .b(node01), .out(S[0]));
xor_gate u_xor7 (.a(node03), .b(node11), .out(S[1]));
xor_gate u_xor6 (.a(node16), .b(node21), .out(S[2]));
xor_gate u_xor5 (.a(node26), .b(node31), .out(S[3]));

endmodule

module D_flipflop(input d, input clk, input reset, output reg q);
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module not_gate(input in, output out);
    assign out = ~in;
endmodule

module xor_gate(input a, b, output out);
    assign out = a ^ b;
endmodule

module nor_gate(input a, b, output out);
    assign out = ~(a | b);
endmodule

module nand_gate(input a, b, output out);
    assign out = ~(a & b);
endmodule

module or_gate(input a, b, output out);
    assign out = a | b;
endmodule

module and_gate(input a, b, output out);
    assign out = a & b;
endmodule

