// Vivado Testbench for 4-bit Carry Lookahead Adder

module cla_tb;
    reg [3:0] A, B;
    reg C0, clk, reset;
    wire [3:0] S;
    wire Cout;

    CLA u_cla_4_bit (
        .A(A), .B(B), .C0(C0), .clk(clk), .reset(reset),
        .S(S), .Cout(Cout)
    );

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end
    
    initial begin
        // $dumpfile("cla_tb.vcd");
        // $dumpvars(0, cla_tb);
        A = 13; B = 7; C0 = 1;
        // $display("A = %b(%d), B = %b(%d), C0 = %b", A, A, B, B, C0);

        reset = 1; #10;
        reset = 0;
        #20;
        // $display("Sum = %b(%d), Cout = %b(%2d)", S, S, Cout, Cout*16);
        $finish;
    end
endmodule
