
module mux2to1(
    input a,b,sel,
    output y
);
assign y=sel? b : a;
endmodule

module mux16to1(
input[15:0] l,
input[3:0] s,
output Y
);
wire[7:0] w1;
wire[3:0] w2;
wire[1:0] w3;

// total muxes needed to make 16 to1 mux from 2 to 1 muxes are total 15 muxes
mux2to1 m0(l[0],l[1],s[0],w1[0]);
mux2to1 m1(l[2],l[3],s[0],w1[1]);
mux2to1 m2(l[4],l[5],s[0],w1[2]);
mux2to1 m3(l[6],l[7],s[0],w1[3]);
mux2to1 m4(l[8],l[9],s[0],w1[4]);
mux2to1 m5(l[10],l[11],s[0],w1[5]);
mux2to1 m6(l[12],l[13],s[0],w1[6]);
mux2to1 m7(l[14],l[15],s[0],w1[7]);

// stage 2: 4 MUXES
mux2to1 m8(w1[0],w1[1],s[1],w2[0]);
mux2to1 m9(w1[2],w1[3],s[1],w2[1]);
mux2to1 m10(w1[4],w1[5],s[1],w2[2]);
mux2to1 m11(w1[6],w1[7],s[1],w2[3]);

// stage 3: 2 MUXES
mux2to1 m12(w2[0],w2[1],s[2],w3[0]);
mux2to1 m13(w2[2],w2[3],s[2],w3[1]);

// final stage 4: 1 MUX
mux2to1 m14(w3[0],w3[1],s[3],Y);

endmodule

