//////////////////////////////////////////////////////////////////////////////////
// Design Name: Test Bench for 4-bit Arithmetic Logic Shift Unit 
// Engineer: kiran
// Reference: Computer Architecture by Morris Mano 3rd Edition (Chapter 4 : page 116 - 118)
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module test_bench_ALU();
    //inouts for DUT
    reg [3:0] Sel;
    reg [3:0] A;
    reg [3:0] B;
    reg Ci;
    reg Ir = 1'b0; //divide by two
    reg IL = 1'b0; //multiply by two
    //outputs from DUT
    wire [3:0] F;
    wire Co;
    
    
    ALU DUT(.Sel(Sel),.A(A),.B(B),.Ci(Ci),.Ir(Ir),.IL(IL),.F(F),.Co(Co));


      initial
        begin
            $display($time, " << Simulation Results >>");
            $monitor($time, "A = %b, B = %b, Ci = %b, Sel = %b, Ir = %b, IL = %b, F = %b, Co = %b",A,B,Ci,Sel,Ir,IL,F,Co);
        end
        
    initial
        begin
        A   = 4'h5;
        B   = 4'h3;
        //Sel=0000
        Ci  = 1'b0;
        Sel = 4'h0;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=0001
        Ci  = 1'b0;
        Sel = 4'h1;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=0010
        Ci  = 1'b0;
        Sel = 4'h2;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=0011
        Ci  = 1'b0;
        Sel = 4'h3;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=0100
        Ci  = 1'b0;
        Sel = 4'h4;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=0101
        Ci  = 1'b0;
        Sel = 4'h5;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=0110
        Ci  = 1'b0;
        Sel = 4'h6;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=0111
        Ci  = 1'b0;
        Sel = 4'h7;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=1000
        Ci  = 1'b0;
        Sel = 4'h8;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=1001
        Ci  = 1'b0;
        Sel = 4'h9;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=1010
        Ci  = 1'b0;
        Sel = 4'hA;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=1011
        Ci  = 1'b0;
        Sel = 4'hB;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=1100
        Ci  = 1'b0;
        Sel = 4'hC;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=1101
        Ci  = 1'b0;
        Sel = 4'hD;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=1110
        Ci  = 1'b0;
        Sel = 4'hE;
        #2;
        Ci  = 1'b1;
        #2;
        //sel=1111
        Ci  = 1'b0;
        Sel = 4'hF;
        #2;
        Ci  = 1'b1;
        #2;
        $finish;
        
        end
endmodule
