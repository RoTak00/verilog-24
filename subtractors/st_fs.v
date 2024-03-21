module st_fs(Bo, D, A, B, Bi);

    output Bo, D;

    input A, B, Bi;

    wire w1, w2, w3;


    // COLOANA 1
    xor(D, A, B, Bi);

    xor(w1, A, B);

    and(w2, A, B);

    // COLOANA 2
    and(w3, Bi, w1);

    // COLOANA 3 

    or(Bo, w2, w3);

endmodule 

module st_fs_tb();

reg a, b, Bi;
wire Bo, D;

initial begin


$dumpfile("st_fs");
$dumpvars;

a = 0; b = 0; Bi = 0;

#5 Bi = 1;
#5 b = 1;
#5 Bi = 0;
#5 a = 1;
#5 b = 0;
#5 Bi = 1;
#5 b = 1;
#5 $finish;

end 

st_fs st_fs_1(Bo, D, a, b, Bi);


endmodule