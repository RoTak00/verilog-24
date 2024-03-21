module st_fa(Co, S, A, B, Ci);

    output Co, S;

    input A, B, Ci;

    wire w1, w2, w3;


    // COLOANA 1
    xor(S, A, B, Ci);

    and(w1, A, B);

    or(w2, A, B);

    // COLOANA 2
    and(w3, Ci, w2);

    // COLOANA 3 

    or(Co, w1, w3);

endmodule 

module st_fa4(Co, S, A, B, Ci);

    output Co;
    output[3:0] S;

    input Ci;
    input[3:0] A, B;

    wire[2:0] w;


    st_fa lsb(w[0], S[0], A[0], B[0], Ci);

    st_fa bit1(w[1], S[1], A[1], B[1], w[0]);

    st_fa bit2(w[2], S[2], A[2], B[2], w[1]);

    st_fa msb(Co, S[3], A[3], B[3], w[2]);

endmodule

module st_fa4_tb();

    reg Ci;
    reg[3:0] a, b;

    wire[3:0] S;
    wire Co;

    integer i;

    initial begin


        $dumpfile("st_fa4");
        $dumpvars;


        a = 0; b = 0; Ci = 0;

        for(i = 0; i < 16; i++) begin 
            #10 a = $random;
            b = $random;
            Ci = $random;

        end 

        #10 $finish;

    end;

    st_fa4 st_fa4_1(Co, S, a, b, Ci);

endmodule