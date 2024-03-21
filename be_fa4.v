module be_fa4(Co, S, A, B, Ci);
    output Co;
    output[3:0] S;

    input[3:0] A, B; 
    input Ci;

    assign {Co, S} = A + B + Ci;

endmodule

module be_fa4_tb();
    reg Ci;
    reg[3:0] A, B;

    wire[3:0] S;
    wire Co;

    integer i;

    initial begin;

        $dumpfile("be_fa4");
        $dumpvars;

        A = 0; B = 0; Ci = 0;

        for(i = 0; i < 16; i++) begin 
            #10 A = $random;
            B = $random;
            Ci = $random;

        end 

        #10 $finish;

    end;

    be_fa4 be_fa4_1(Co, S, A, B, Ci);

endmodule