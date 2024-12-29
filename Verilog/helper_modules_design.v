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