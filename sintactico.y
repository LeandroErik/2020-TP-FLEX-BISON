%{

void yyerror(char *s);
int yylex();
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

%}

%union {
    int num;
    char* txt;
    
    float real;
}

%token INICIO FIN LEER ESCRIBIR PARENIZQ PARENDER PC
%token <num> CONS
%token <txt> ID
%token <real> NUM
%right ASIGNACION
%left MAS MENOS COMA

%%
TKN  : 	token
        |   TKN token
;

	
token   :	CONS       		{printf("constante: %d\n", $1);}
        |   ID              {printf("id: %s\n", $1);}
        |   INICIO          {printf("inicio\n");}
        |   FIN             {printf("fin\n");}
        |   LEER            {printf("leer\n");}
        |   ESCRIBIR        {printf("escribir\n");}
        |   PARENIZQ        {printf("par derecho\n");}
        |   PARENDER        {printf("par izquierdo\n");}
        |   COMA            {printf("coma\n");}
        |   PC              {printf("pc\n");}
        |   ASIGNACION      {printf("asignar\n");}
        |   MAS             {printf("sumar\n");}
        |   MENOS           {printf("restar\n");}
;


%%

int main(){
    return yyparse();
}

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
} 
