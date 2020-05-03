////////////////////////////////////////////////////////////////////////////////////////////
// Design Name: 4-bit Arithmetic Logic Shift Unit 
// Engineer: kiran
// Reference: Computer Architecture by Morris Mano 3rd Edition (Chapter 4 : page 116 - 118)
////////////////////////////////////////////////////////////////////////////////////////////
//        Operation Select                Operation                   Function
//    S3    S2    S1    S0    Ci
//    --------------------------          ----------                  ---------
//     0     0    0      0     0          F = A + B                   Add
//     0     0    0      0     1          F = A + B + 1               Add with Carry
//     0     0    0      1     0          F = A + B'                  Subtract with borrow
//     0     0    0      1     1          F = A + B' + 1              Subtract
//     0     0    1      0     0          F = A                       Transfer A
//     0     0    1      0     1          F = A + 1                   Increment A
//     0     0    1      1     0          F = A - 1                   Decrement A
//     0     0    1      1     1          F = A                       Transfer A
//     0     1    0      0     x          F = A ^ B                   AND 
//     0     1    0      1     x          F = A v B                   OR
//     0     1    1      0     x          F = A * B                   XOR(* is used for xor gate representaion)
//     0     1    1      1     x          F = A'                      Complement
//     1     0    x      x     x          F = shr A                   Shift right A into F     
//     1     1    x      x     x          F = shl A                   Shift left  A into F
////////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module ALU(Sel,A,B,Ci,Ir,IL,F,Co);
    input  wire [3:0] Sel;
    input  wire [3:0] A;
    input  wire [3:0] B;
    input  wire Ci;
    input  wire Ir;
    input  wire IL;
    output wire [3:0] F;
    output wire Co;
    
    wire [3:1] C;
    wire [3:0] Ds;
    wire [3:0] Es;
    
    // Arithmetic Unit
    AE ae0 (.A(A),.B(B),.Ci(Ci),  .Sel(Sel[1:0]),.D(Ds),.Co(Co));
    
    //Logic Unit
    LE le0 (.A(A),.B(B),.Sel(Sel[1:0]),.E(Es));

    //Mux to choose shiting operation or AE or LE
    mux m0 (.sel(Sel[3:2]), .x0(Ds[0]), .x1(Es[0]), .x2(Ir),   .x3(A[1]), .z(F[0]));
    mux m1 (.sel(Sel[3:2]), .x0(Ds[1]), .x1(Es[1]), .x2(A[0]), .x3(A[2]), .z(F[1]));
    mux m2 (.sel(Sel[3:2]), .x0(Ds[2]), .x1(Es[2]), .x2(A[1]), .x3(A[3]), .z(F[2]));
    mux m3 (.sel(Sel[3:2]), .x0(Ds[3]), .x1(Es[3]), .x2(A[2]), .x3(IL),   .z(F[3]));
    
endmodule
