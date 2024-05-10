/* SAMPLE LEX-YACC PROGRAM */

%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
void yyerror(char *);
%}

/*
S -> id | L
L -> S
*/

%token ID

%%

S : ID {printf("S -> id\n");}
  | L {printf("S -> L\n");}
  ;
L : S {printf("L -> S\n");}
  ;

%%

void yyerror(char *s){
    printf(stderr, "error: %s\n", s);
    exit(1);
}

int main(){
    printf("Input: ");
    yyparse();
    return 0;
}