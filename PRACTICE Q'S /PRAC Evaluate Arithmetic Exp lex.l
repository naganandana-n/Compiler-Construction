/* 
YACC PROG TO EVALUATE ARITHMETIC EXPR 
lex part:
*/

%{
#include<stdio.h>
#include"y.tab.h" /* DEFINES ALL TOKENS USED IN YACC */
int yylval; /* VARIABLE USED IN LEX AND YACC TO STORE TOKEN VALUE */
%}

%%

[)] {return yytext[0];}
[(] {return yytext[0];}
[0-9][0-9]* {yylval = atoi(yytext); return ID;}
[0-9][0-9]*/[!/@/#/$/%/^/&/=]* return 0; /* / IS A LOOK AHEAD SYMBOL */
[-+*/] {return yytext[0];}
\n {return 0;}
[!/@/#/$/%/^/&/=] {return 0;}
. {return yytext[0];}

%%


