%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int yyerror(const char *s);
%}

%token HEADER INT MAIN LB RB LCB RCB COMMA SC EQ OP VAR
%start prm 

%%

prm : HEADER INT MAIN LB RB LCB BODY RCB {printf("Parsing Successful\n");}
;
BODY : DECL_STMTS PROG_STMTS
;
DECL_STMTS : DECL_STMT DECL_STMTS
| DECL_STMT
;
PROG_STMTS : PROG_STMT PROG_STMTS
| PROG_STMT
;
DECL_STMT : INT VAR_LIST SC
;
VAR_LIST : VAR COMMA VAR_LIST
| VAR
;
PROG_STMT : VAR EQ A_EXPN SC
;
A_EXPN : A_EXPN OP A_EXPN
| LB A_EXPN RB
| VAR
;

%%

int yyerror(const char *s){
    extern int yylineno;
    printf("Parsing failed due to %s in line no. %d", s, yylineno);
    return 0;
}

int main(){
    yyparse();
    return 0;
}