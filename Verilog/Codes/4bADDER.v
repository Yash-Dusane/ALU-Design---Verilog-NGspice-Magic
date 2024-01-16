module b4ADDERSUB(E,Ain,Bin,Y,C0);

input [3:0] Ain, Bin;
input E,C0;
output [4:0] Y;

wire [3:0] A, B;
and E11(A[0],Ain[0],E);
and E12(A[1],Ain[1],E);
and E13(A[2],Ain[2],E);
and E14(A[3],Ain[3],E);
and E21(B[0],Bin[0],E);
and E22(B[1],Bin[1],E);
and E23(B[2],Bin[2],E);
and E24(B[3],Bin[3],E);
and E3(M,C0,E);

wire a0,b0,d0,n0,c1;
xor N0(n0,B[0],M);
xor A0(a0,A[0],n0);
xor S0(Y[0],a0,M);
and B0(b0,a0,M);
and D0(d0,A[0],n0);
or C1(c1,b0,d0);

wire a1,b1,d1,n1,c2;
xor N1(n1,B[1],M);
xor A1(a1,A[1],n1);
xor S1(Y[1],a1,c1);
and B1(b1,a1,c1);
and D1(d1,A[1],n1);
or C2(c2,b1,d1);

wire a2,b2,d2,n2,c3;
xor N2(n2,B[2],M);
xor A2(a2,A[2],n2);
xor S2(Y[2],a2,c2);
and B2(b2,a2,c2);
and D2(d2,A[2],n2);
or C3(c3,b2,d2);

wire a3,b3,d3,n3,c4;
xor N3(n3,B[3],M);
xor A3(a3,A[3],n3);
xor S3(Y[3],a3,c3);
and B3(b3,a3,c3);
and D3(d3,A[3],n3);
or C4(c4,b3,d3);
and C4e(Y[4],c4,~M);

endmodule
