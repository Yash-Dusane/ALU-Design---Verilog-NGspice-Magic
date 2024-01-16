module b4COMPARATOR(E,Ain,Bin,GT,EQ,LT);

input E;
input [3:0] Ain, Bin;
output GT,EQ,LT;

wire [3:0] A, B;
and E11(A[0],Ain[0],E);
and E12(A[1],Ain[1],E);
and E13(A[2],Ain[2],E);
and E14(A[3],Ain[3],E);
and E21(B[0],Bin[0],E);
and E22(B[1],Bin[1],E);
and E23(B[2],Bin[2],E);
and E24(B[3],Bin[3],E);

wire e0,e1,e2,e3;
xnor E0(e0,A[0],B[0]);
xnor E1(e1,A[1],B[1]);
xnor E2(e2,A[2],B[2]);
xnor E3(e3,A[3],B[3]);
and EQG(EQ,e0,e1,e2,e3,E);

wire g0,g1,g2,g3;
and G3(g3,A[3],~B[3]);
and G2(g2,A[2],~B[2],e3);
and G1(g1,A[1],~B[1],e3,e2);
and G0(g0,A[0],~B[0],e3,e2,e1);
or GTG(GT,g0,g1,g2,g3);

wire l0,l1,l2,l3;
and L3(l3,~A[3],B[3]);
and L2(l2,~A[2],B[2],e3);
and L1(l1,~A[1],B[1],e3,e2);
and L0(l0,~A[0],B[0],e3,e2,e1);
or LTG(LT,l0,l1,l2,l3);

endmodule