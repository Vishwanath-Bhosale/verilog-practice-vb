
`timescale 1ns/1ps

module muxtest;

    reg [15:0] d;
    reg [3:0] s;
    wire y;
    integer i;
    integer e;

    mux16to1 dut (
        .l(d),
        .s(s),
        .Y(y)
    );

    initial begin
        $dumpfile("muxtest.vcd");
        $dumpvars(0, muxtest);

        e = 0;
        d = 16'hA5C3;

        for (i = 0; i < 16; i = i + 1) begin
            s = i;
            #10;

            if (y !== d[s]) begin
                $display("FAIL: s=%d y=%b expected=%b",
                         s, y, d[s]);
                e = e + 1;
            end
            else begin
                $display("PASS: s=%d y=%b", s, y);
            end
        end

        if (e == 0)
            $display("ALL TESTS PASSED");
        else
            $display("ERRORS = %d", e);

        $finish;
    end

endmodule
