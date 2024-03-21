module hello_word;

initial begin
    $display ("Hello World");
    #10 $finish;
end

endmodule