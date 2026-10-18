module logic_gates (
    input  wire A,
    input  wire B,

    output wire Y_and,
    output wire Y_or,
    output wire Y_not_A,
    output wire Y_not_B,
    output wire Y_nand,
    output wire Y_nor,
    output wire Y_xor,
    output wire Y_xnor
);

    assign Y_and   = A & B;
    assign Y_or    = A | B;
    assign Y_not_A = ~A;
    assign Y_not_B = ~B;
    assign Y_nand  = ~(A & B);
    assign Y_nor   = ~(A | B);
    assign Y_xor   = A ^ B;
    assign Y_xnor  = ~(A ^ B);

endmodule
