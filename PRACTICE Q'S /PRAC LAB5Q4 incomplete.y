%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int yyerror(const char *s);
%}

%token HEADER INT MAIN LB RB LCB RCB SC COMMA VAR EQ OP FLOAT DOUBLE CHAR
%start prm 

%%

prm : HEADER INT MAIN LB RB LCB BODY RCB {printf("Parsing Successful");}
;
BODY : DECL_STMTS


%%

int yyerror(const char *s){
    extern int yylineno;
    printf("Parsing failed due to error %s at line no. %d\n", s, yylineno);
    return 0;
}

int main(){
    yyparse();
    return 0;
}