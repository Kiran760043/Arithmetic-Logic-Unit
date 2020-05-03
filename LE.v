//////////////////////////////////////////////////////////////////////////////////
// Design Name: 4-bit Logic Circuit
// Engineer: kiran
// Reference: Computer Architecture by Morris Mano 3rd Edition (Chapter 4 : page 111 - 113)
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module LE(A,B,Sel,E);
    input  wire [3:0] A;
    input  wire [3:0] B;
    input  wire [1:0] Sel;
    output wire [3:0] E;
    
    wire [3:0] zero,one,two,three;
    
    assign zero  = A & B;   // A and B
    assign one   = A | B;   // A or B
    assign two   = A ^ B;   // A xor B
    assign three = ~A;      // not A
    
    mux m0 (.sel(Sel), .x0(zero[0]), .x1(one[0]), .x2(two[0]), .x3(three[0]), .z(E[0]));
    mux m1 (.sel(Sel), .x0(zero[1]), .x1(one[1]), .x2(two[1]), .x3(three[1]), .z(E[1]));
    mux m2 (.sel(Sel), .x0(zero[2]), .x1(one[2]), .x2(two[2]), .x3(three[2]), .z(E[2]));
    mux m3 (.sel(Sel), .x0(zero[3]), .x1(one[3]), .x2(two[3]), .x3(three[3]), .z(E[3]));
    
endmodule
