module ALUtestbench;

    reg E;
    reg [1:0] S;
    reg [3:0] A,B;

    wire [3:0] Y;
    wire C;

DECODER Circuit(E,S,A,B,Y,C);

always #80 S[0] = ~S[0];
always #160 S[1] = ~S[1];

always #30 A[0] = ~A[0];
always #35 A[1] = ~A[1];
always #10 A[2] = ~A[2];
always #25 A[3] = ~A[3];
always #20 B[0] = ~B[0];
always #30 B[1] = ~B[1];
always #15 B[2] = ~B[2];
always #5 B[3] = ~B[3];

initial begin
    $dumpfile("ALU.vcd");
    $dumpvars(0, ALUtestbench);

    S = 0;
    A = 0;
    B = 1;
    E = 0;
    #10 E = 1;
    #70 E = 0;
    #10 E = 1;
    #70 E = 0;
    #10 E = 1;
    #70 E = 0;
    #10 E = 1;
    #70 E = 0;
    #10 $finish;
end


// TESTBENCH FOR PRINTING OUTPUT FOR A SPECIFIC INPUT :


// initial
//         begin
//             $monitor("\nTruth Table based on Structural Code of ALU Circuit : \n");

//             // Running some test cases :
//             A = 3;
//             B = 14;

//             #10 S = 0; E = 0;
//             $monitor("E = %b, S = %b, A = %b, B = %b, \n4bit Output = %b,  Carry Output = %b \n",E,S,A,B,Y,C);

//             #10 E = 1;      
//             $monitor("E = %b, S = %b, A = %b, B = %b, \n4bit Output = %b,  Carry Output = %b \nThus, 4 bit Adder Output = %b%b \n",E,S,A,B,Y,C,C,Y);
            
//             #10 S = 1;
//             $monitor("E = %b, S = %b, A = %b, B = %b, \n4bit Output = %b,  Carry Output = %b \nThus, 4bit Subtractor Output = %b%b \n",E,S,A,B,Y,C,C,Y);

//             #10 S = 2;
//             $monitor("E = %b, S = %b, A = %b, B = %b, \n4bit Output = %b,  Carry Output = %b \nThus, 4 bit Comparator Output : A>B = %b, A=B = %b, A<B = %b \n",E,S,A,B,Y,C,Y[0],Y[1],Y[2]);

//             #10 S = 3;
//             $monitor("E = %b, S = %b, A = %b, B = %b, \n4bit Output = %b,  Carry Output = %b \nThus, 4 bit AND Output = %b \n",E,S,A,B,Y,C,Y);

//             #10 $finish;
//         end


endmodule