%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

/* GENERADO AUTOMÁTICAMENTE POR BISON */
%}
LETRA [a-zA-Z]
DIGITO [0-9]
IDENTIFICADOR {LETRA}({LETRA}|{DIGITO})*
constEntera {DIGITO}({DIGITO})*
%%
":=" 		{return ASIGNACION;}
{constEntera} 	{return CONSTANTE;}
{IDENTIFICADOR} {return ID;}
";"		{return PYCOMA;}
"(" 		{return PARENIZQUIERDO;}
")" 		{return PARENDERECHO;}
"+" 		{return SUMA;}
"-"		{return RESTA;}

%%


