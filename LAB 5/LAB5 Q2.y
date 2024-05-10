%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int yyerror(const char *s);
%}

%token HEADER INT MAIN LB RB LCB BODY RCB SC COMMA VAR
%start prm

%%

prm : HEADER INT MAIN LB RB LCB BODY RCB {printf("Parsing Successful\n");}
;
BODY : DECL_STMTS
;
DECL_STMTS : DECL_STMT DECL_STMTS
| DECL_STMT
;
DECL_STMT : INT VAR_LIST SC
;
VAR_LIST : VAR COMMA VAR_LIST
| VAR
;

%%

int yyerror(const char *s){
    extern int yylineno;
    printf("Parsing failed due to error %s at line no. %d", s, yylineno);
    return 0;
}

int main(){
    yyparse();
    return 0;
}