%{
/*Tenemos a los prototipos de funciones en bison*/
#include <stdio.h>
int yylex(); /*Invoco a Lex*/
void yyerror(char *s); /*Invoco a la rutina de error*/
%}

%union { /*SABMEOS QUE POR DEFECTO LOS VALORES SON DE TIPO ENTERO ,PERO SI NECESITAMOS MAS TIPOSDE DATOS USAMOS LA CLAUSULA %Union ,esto se ve reflejado en yylval ->varibable global*/
    char* cadena;  
}

%token ASIGNACION PYCOMA CONSTANTE SUMA RESTA PARENIZQUIERDO PARENDERECHO NL
%token <cadena> ID
%%
sentencias: sentencias sentencia
|sentencia
;
sentencia: ID ASIGNACION expresion PYCOMA
;
expresion: primaria
|expresion operadorAditivo primaria
;
primaria: ID
|CONSTANTE
|PARENIZQUIERDO expresion PARENDERECHO
;
operadorAditivo: SUMA
| RESTA
;
%%
int main(){
yyparse();


}
void yyerror(char *s){
printf ("%s\n",s);

}
int yywrap(void){
    return 1;
}

