/* SAMPLE LEX-YACC PROGRAM */

%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
void yyerror(char *);
%}

%%

[a-zA-Z]+ {return ID;}

%%

int yywrap(void){
    return 1;
}