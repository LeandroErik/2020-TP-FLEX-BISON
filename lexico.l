%{

#include "y.tab.h" /*Integro el .header que genera el parser(bison) porque tiene declrados los tokens*/
#include <string.h>
int yylex();
void yyerror(char* s);

%}
%%
"leer"			{return LEER;}/*retorna los tokens que le pide el parser,estos token deben coincidir con los declarados en bison bison*/
"escribir"		{return ESCRIBIR;}
"inicio"		{return INICIO;}
"fin"			{return FIN;}
":="			{return ASIGNACION;}
\(			{return PARENIZQ;}
\)			{return PARENDER;}
,			{return COMA;}
;			{return PC;}
\+			{return MAS;}
-			{return MENOS;}
[0-9]+			{yylval.num = atoi(yytext); return CONS;}
[a-zA-Z][a-zA-Z0-9]*	{yylval.txt = strdup(yytext); return ID;}
[ \t\n]			{;}
.				{yyerror("caracter no reconocido ");}

%%

int yywrap(void){
    return 1;
}
