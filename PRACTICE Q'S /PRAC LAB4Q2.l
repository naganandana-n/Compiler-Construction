/*
2) Modify your program to take care of associativity of the operators
   using directives in YACC. + and – are left associative. Also modify
the grammar so the calculator application runs until the user quits
   using <CTRL + D>.
*/

%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
void yyerror(char *);
extern int yylval;
%}

%%

[0-9]+ {yylval = atoi(yytext); return INTEGER;}
"+" {return PLUS;}
"-" {return MINUS;}
"\n" {return NL;}
[\t ]
. {printf("Invalid Character");}

%%

int yywrap(void){
    return 1;
}