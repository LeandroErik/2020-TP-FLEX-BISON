%{
/*Tenmos a los prototipos de funciones en bison*/
void yyerror(char *s); /*Invoco a la rutina de error*/
int yylex(); /*Invoco a Lex*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

%}

%union { /*sABMEOS QUE POR DEFECTO LOS VALORES SON DE TIPO ENTERO ,PERO SI NECESITAMOS MAS TIPOSDE DATOS USAMOS LA CLAUSULA %Union*/
    int num;
    char* txt;
    
    float real;
}
/*Indico la precedencia ,si en el caso que declare primero tal token ,este tiene mayor precedencia que el de abajo
en el caso de la asociatividad ,debo poner %left % right % nonassoc para indicar no asociatividad
*/

/*Por convencion los token suelen ir en mayusculas y los simbolos no terminales en minuscula*/
%token INICIO FIN LEER ESCRIBIR PARENIZQ PARENDER PC
%token <num> CONS
%token <txt> ID
%token <real> NUM
%right ASIGNACION
%left MAS MENOS COMA

%%
/*Ca defino la gramatica,con axioma "inicio" y su respectivas rutinas semanticas , en este caso solo hacemos que imprima algo*/

inicio  : 	token 
        |   inicio token
;

	
token   :	CONS       		{printf("\tCONSTANTE: %d\n", $1);}
        |   ID              {printf("\tID: %s\n", $1);}
        |   INICIO          {printf("\tINICIO\n");}
        |   FIN             {printf("\tFIN\n");}
        |   LEER            {printf("\tLEER\n");}
        |   ESCRIBIR        {printf("\tESCRIBIR\n");}
        |   PARENIZQ        {printf("\tPAR DERECHO\n");}
        |   PARENDER        {printf("\tPAR IZQUIERDO\n");}
        |   COMA            {printf("\tCOMA\n");}
        |   PC              {printf("\tPUNTO Y COMA\n");}
        |   ASIGNACION      {printf("\tASIGNACION\n");}
        |   MAS             {printf("\tSUMA\n");}
        |   MENOS           {printf("\tRESTA\n");}
;


%%

int main(){
    return yyparse();
}

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
} 
