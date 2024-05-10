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
"\n" return NL;
[\t]
. printf("Invalid Character \n");

%%

int yywrap(void){
    return 1;
}