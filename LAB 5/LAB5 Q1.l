/*
1) Write the LEX and YACC source to recognize the following:
[a] General Template:
The template for the C program is 
#include<stdio.h>
int main()
{
}
PRM → HEADER INT MAIN LB RB LCB RCB
*/

%option yylineno
%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
void yyerror(char *);
%}

%%

"#include<stdio.h>" {return HEADER;}
"int" {return INT;}
"main" {return MAIN;}
"(" {return LB;}
")" {return RB;}
"{" {return LCB;}
"}" {return RCB;}
[\n\t ]+
. {printf("Unmatched character %s at line no. %d", yytext, yylineno);}

%%

int yywrap(void){
    return 1;
}

