/*
3) Extend the calculator to incorporate some new functionality. New
   features include arithmetic operators * and / that can multiply and
   divide integers respectively. Parentheses may be used to over-ride
   operator precedence. Note * and / operators have higher precedence
   over + and – operators. Also note that * and / are left associative.
   Ensure this using directive in YACC.
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
"*" {return MUL;}
"/" {return DIV;}
"(" {return LP;}
")" {return RP;}
"\n" {return NL;}
[\t ]
. {printf("Invalid Character");}

%%

int yywrap(void){
    return 1;
}