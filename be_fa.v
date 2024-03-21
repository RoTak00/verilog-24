module be_fa(Co, S, A, B, Ci);
    output Co, S;

    input A, B, Ci;

    assign {Co, S} = A + B + Ci;

endmodule

module be_fa_tb();
    reg A, B, Ci;

    wire Co, S;

    initial begin;

        $dumpfile("be_fa");
        $dumpvars;

        A = 0; B = 0; Ci = 0;

    #5  Ci = 1;
    #5  B  = 1;
    #5  Ci = 0;
    #5  A  = 1;
    #5  Ci = 1;
    #5  B =  0;
    #5  Ci = 0;

        $finish;
    end;

    be_fa be_fa_1(Co, S, A, B, Ci);

endmodule