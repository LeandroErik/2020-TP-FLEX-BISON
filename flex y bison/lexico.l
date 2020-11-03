%{
#include <stdio.h>
#include "y.tab.h"
#include <string.h>
int yylex();
void yyerror(char* s);

/* GENERADO AUTOMÁTICAMENTE POR BISON */
%}
letra [a-zA-Z]
digito [0-9]
identificador {letra}({letra}|{digito})*
constEntera {digito}({digito})*
%%

{constEntera} {return CONSTANTE;}
":=" {return ASIGNACION;}
"+" {return SUMA;}
{identificador} {return ID;}
"(" {return PARENIZQUIERDO;}
")" {return PARENDERECHO;}
[ \t\n]			{;}
.				{yyerror("caracter no reconocido ");}
%%

