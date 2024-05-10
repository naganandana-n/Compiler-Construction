/*
4) Modify the grammar to allow single-character variables to be
   specified in assignment statements. The following illustrates sample
   input and calculator output:
   user: 3 * (4 + 5)
   calc: 27
   user: x = 3 * (4 + 5)
   user: y = 5
   user: x
   calc: 27
   user: y
   calc: 5
   user: x + 2*y
   calc: 37
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
[a-zA-Z] {
    if(*yytext >= 'a' && *yytext <='z'){
        yylval = *yytext - 'a';
    }
    else{
        yylval = *yytext - 'A' + 26;
    }
    return VAR;
}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
"/" {return DIV;}
"(" {return LP;}
")" {return RP;}
"=" {return EQ;}
"\n" {return NL;}
[\t ]
. {printf("Invalid Character");}

%%

int yywrap(void){
    return 1;
}
