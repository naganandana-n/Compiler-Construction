/*
[c] OPERATORS & PROGRAM STATEMENTS:
Allow declaration statements to be followed by program statements inside
the program body. Program statements are ended by a semicolon. Program
statements can be arithmetic expressions involving +-/* operators.
a = b + c; / a = (b*c)
PRM → HEADER INT MAIN LB RB LCB BODY RCB
BODY → DECL_STMTS PROG_STMTS
DECL_STMTS → DECL_STMT DECL_STMTS | DECL_STMT 
PROG_STMTS → PROG_STMT PROG_STMTS | PROG_STMT 
DECL_STMT → INT VAR_LIST SC
VAR_LIST → VAR COMA VAR_LIST | VAR
PROG_STMT → VAR EQ A_EXPN SC
A_EXPN → A_EXPN OP A_EXPN | LB A_EXPN RB | VAR
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
"=" {return EQ;}
[\+\-\*\/] {return OP;}
[a-z]+ {return VAR;} 
[\n\t ]+
. {printf("Unmatched character %s at line no. %d", yytext, yylineno);}

%%

int yywrap(void){
    return 1;
}