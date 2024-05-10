%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int yyerror(const char *s);
%}

%token HEADER INT MAIN LB RB LCB RCB
%start prm

%%

prm : HEADER INT MAIN LB RB LCB RCB {printf("Parsing Successful\n");}

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