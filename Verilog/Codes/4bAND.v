module b4AND(E,Ain,Bin,Y);

input [3:0] Ain, Bin;
input E;
output [3:0] Y;

wire [3:0] A, B;
and E11(A[0],Ain[0],E);
and E12(A[1],Ain[1],E);
and E13(A[2],Ain[2],E);
and E14(A[3],Ain[3],E);
and E21(B[0],Bin[0],E);
and E22(B[1],Bin[1],E);
and E23(B[2],Bin[2],E);
and E24(B[3],Bin[3],E);

and A1(Y[0],A[0],B[0]);
and A2(Y[1],A[1],B[1]);
and A3(Y[2],A[2],B[2]);
and A4(Y[3],A[3],B[3]);

endmodule
