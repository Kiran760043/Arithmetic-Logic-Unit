//////////////////////////////////////////////////////////////////////////////////
// Design Name: 4-bit Arithmetic Circuit
// Engineer: kiran
// Reference: Computer Architecture by Morris Mano 3rd Edition (Chapter 4 : page 106 - 108)
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module AE(A,B,Ci,Sel,D,Co);
    input  wire [3:0] A;
    input  wire [3:0] B;
    input  wire Ci;
    input  wire [1:0] Sel;
    output wire [3:0] D;
    output wire Co;
    
    wire [3:1] c;
    wire [3:0] m;
    wire [3:0] bn;
    
    wire one;
    reg zero = 1'b0;
    
    assign one = ~zero;
    
    assign bn  = ~B;
    
    mux m0 (.sel(Sel), .x0(B[0]), .x1(bn[0]), .x2(zero), .x3(one), .z(m[0]));
    full_adder f0 (.A(A[0]), .B(m[0]), .Ci(Ci), .S(D[0]), .Co(c[1]));
    
    mux m1 (.sel(Sel), .x0(B[1]), .x1(bn[1]), .x2(zero), .x3(one), .z(m[1]));
    full_adder f1 (.A(A[1]), .B(m[1]), .Ci(c[1]), .S(D[1]), .Co(c[2]));
    
    mux m2 (.sel(Sel), .x0(B[2]), .x1(bn[2]), .x2(zero), .x3(one), .z(m[2]));
    full_adder f2 (.A(A[2]), .B(m[2]), .Ci(c[2]), .S(D[2]), .Co(c[3]));
    
    mux m3 (.sel(Sel), .x0(B[3]), .x1(bn[3]), .x2(zero), .x3(one), .z(m[3]));
    full_adder f3 (.A(A[3]), .B(m[3]), .Ci(c[3]), .S(D[3]), .Co(Co));
     
endmodule
