%option yylineno
%{
#include<stdio.h>
#include<stdlib.h>
#include "y.tab.h"
int yyerror(char *);
%}

%%

"if" {return IF;}
"(" {return LB;}
")" {return RB;}
[a-z] {yylval = *yytext-'a'; return VAR;}
"{" {return LCB;}
"}" {return RCB;}
(==|<|>|<=|>=|!=) {return OP;}
"else" {return ELSE;}
[\n\t ]+ 
. {printf("Error %s at line no. %d", yytext, yylineno);}

%%

int yywrap(void){
    return 1;
}

