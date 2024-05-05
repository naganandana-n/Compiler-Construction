/* 

1. Understand the working of LEX and YACC using a simple calculator application. 
Your calculator should provide arithmetic operators + and - that can add or subtract 
integers respectively (once). Start off with a grammar (not perfect).

Program -> E \n

E -> E + E | E - E | int

The problems with the above grammar – ambiguity. 
Associativity is not considered. 
Understand the conflicts in bottom up parsing and YACC’s default action when there is a conflict.

*/

%{
#include <stdlib.h>
void yyerror(char *)
#include "y.tab.h"
%}

%%

[0-9]+ {
    yylval = atoi(yytext);
    return INTEGER;
}

"+" return PLUS;
"-" return MINUS;
"\n" return NL;
[\t] ; /* SKIP WHITESPACE */
. printf("INVALID CHARACTER");

%%

int yywrap(void){
    return 1;
}