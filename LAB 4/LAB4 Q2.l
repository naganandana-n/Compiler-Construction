/*

2. Modify your program to take care of associativity of the operators using directives in YACC. 
+ and – are left associative. Also modify the grammar so the calculator application runs 
until the user quits using <CTRL + D>.

*/

%{
    #include <stdlib.h>
    void yyerror(char *);
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
[ \t] ; /* SKIP WHITESPACE */
. printf("INVALID CHARACTER");

%%

int yywrap(void){
    return 1;
}