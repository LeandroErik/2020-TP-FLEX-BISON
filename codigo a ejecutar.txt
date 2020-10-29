flex lexico.l
bison -yd sintactico.y
gcc lex.yy.c y.tab.c -o programa
