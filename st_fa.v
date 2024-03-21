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

module st_fa_tb();

reg a, b, Ci;
wire Co, S;

initial begin


$dumpfile("st_fa");
$dumpvars;

a = 0; b = 0; Ci = 0;

#5 Ci = 1;
#5 b = 1;
#5 Ci = 0;
#5 a = 1;
#5 b = 0;
#5 Ci = 1;
#5 b = 1;
#5 $finish;

end 

st_fa st_fa_1(Co, S, a, b, Ci);


endmodule