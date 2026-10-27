module muxtest;
reg [15:0] a; reg [3:0] s; wire f;

mux16to1 M (.in(a), .sel(s), .out(f));

initial
    begin
        $dumpfile("mux16to1.vcd");
        $dumpvars(0, muxtest);
        $monitor("time=%0t, a=%h, s=%h, f=%b", $time, a, s, f);

        a = 16'h3F0A; s = 4'h0;
        #5 s = 4'h1;
        #5 s = 4'h2;
        #5 s = 4'h3;
        #5 s = 4'h4;
        #5 s = 4'h5;
        #5 s = 4'h6;
        #5 s = 4'h7;
        #5 s = 4'h8;
        #5 s = 4'h9;
        #5 s = 4'hA;
        #5 s = 4'hB;
        #5 s = 4'hC;
        #5 s = 4'hD;
        #5 s = 4'hE;
        #5 s = 4'hF;
        #5 $finish;
    end
endmodule
