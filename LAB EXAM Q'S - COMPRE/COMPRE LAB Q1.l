/* 
I WROTE THIS CODE IN A HURRY WHILE PREPARING.

IT DIDN'T GIVE OUTPUT CORRECTLY, BUT THE IDEA IS THERE, YOU JUST NEED TO
WORK OUT THE BUGS.

IK THE IDEA IS CORRECT, CAUSE I GOT FULL IN LAB COMPRE (SO DON'T DOUBT IT)
*/

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

