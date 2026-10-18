
`timescale 1ns/1ps

module tb_logic_gates;

    reg A, B;

    wire Y_and, Y_or, Y_not_A, Y_not_B;
    wire Y_nand, Y_nor, Y_xor, Y_xnor;

    logic_gates dut (
        .A(A),
        .B(B),
        .Y_and(Y_and),
        .Y_or(Y_or),
        .Y_not_A(Y_not_A),
        .Y_not_B(Y_not_B),
        .Y_nand(Y_nand),
        .Y_nor(Y_nor),
        .Y_xor(Y_xor),
        .Y_xnor(Y_xnor)
    );

    initial begin
        $dumpfile("logic_gates.vcd");
        $dumpvars(0, tb_logic_gates);

        $display("A B | AND OR NOT_A NOT_B NAND NOR XOR XNOR");

        A = 0; B = 0; #10;
        $display("%b %b |  %b   %b    %b     %b     %b    %b   %b    %b",
                 A, B, Y_and, Y_or, Y_not_A, Y_not_B,
                 Y_nand, Y_nor, Y_xor, Y_xnor);

        A = 0; B = 1; #10;
        $display("%b %b |  %b   %b    %b     %b     %b    %b   %b    %b",
                 A, B, Y_and, Y_or, Y_not_A, Y_not_B,
                 Y_nand, Y_nor, Y_xor, Y_xnor);

        A = 1; B = 0; #10;
        $display("%b %b |  %b   %b    %b     %b     %b    %b   %b    %b",
                 A, B, Y_and, Y_or, Y_not_A, Y_not_B,
                 Y_nand, Y_nor, Y_xor, Y_xnor);

        A = 1; B = 1; #10;
        $display("%b %b |  %b   %b    %b     %b     %b    %b   %b    %b",
                 A, B, Y_and, Y_or, Y_not_A, Y_not_B,
                 Y_nand, Y_nor, Y_xor, Y_xnor);

        $finish;
    end

endmodule
