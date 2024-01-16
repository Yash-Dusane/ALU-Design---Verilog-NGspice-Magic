module DECODER(E,S,A,B,Y,C);

    input [1:0] S;
    input [3:0] A,B;
    input E;

    output [3:0] Y;
    output C;

    wire d0,d1,d2,d3;
    wire [4:0] Y1,Y2;
    wire [2:0] Y3;
    wire [3:0] Y4;

    and D0(d0,~S[0],~S[1],E);
    and D1(d1,S[0],~S[1],E);
    and D2(d2,~S[0],S[1],E);
    and D3(d3,S[0],S[1],E);
    or D4(d01,d0,d1);

    b4ADDERSUB F0(d01,A,B,Y1,S[0]);
    b4COMPARATOR F2(d2,A,B,Y3[0],Y3[1],Y3[2]);
    b4AND F3(d3,A,B,Y4);

    or T0(Y[0],Y1[0],Y3[0],Y4[0]);
    or T1(Y[1],Y1[1],Y3[1],Y4[1]);
    or T2(Y[2],Y1[2],Y3[2],Y4[2]);
    or T3(Y[3],Y1[3],Y4[3]);
    assign C = Y1[4];
    
endmodule