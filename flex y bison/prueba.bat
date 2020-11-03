flex lexico.l
bison -yd sintactico.y
gcc y.tab.c lex.yy.c -o salida
