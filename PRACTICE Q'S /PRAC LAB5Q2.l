/*
[b] Declaration statements:
Allow declaration statements inside the program body. Integer variables
separated by comma can be declared inside the program body. A program can
have multiple declaration statements. Variables are sequences of
lower-case alphabets. Declarations statements are ended by a semicolon.
int a, b;
PRM → HEADER INT MAIN LB RB LCB BODY RCB
BODY → DECL_STMTS
DECL_STMTS → DECL_STMT DECL_STMTS | DECL_STMT DECL_STMT → INT VAR_LIST SC
VAR_LIST → VAR COMA VAR_LIST | VAR
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
"," {return COMMA;}
";" {return SC;}
[a-z]+ {return VAR;} 
[\n\t ]+
. {printf("Unmatched character %s at line no. %d", yytext, yylineno);}

%%

int yywrap(void){
    return 1;
}