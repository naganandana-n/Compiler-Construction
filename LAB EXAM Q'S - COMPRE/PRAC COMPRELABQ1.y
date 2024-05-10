/* 
I WROTE THIS CODE IN A HURRY WHILE PREPARING.

IT DIDN'T GIVE OUTPUT CORRECTLY, BUT THE IDEA IS THERE, YOU JUST NEED TO
WORK OUT THE BUGS.

IK THE IDEA IS CORRECT, CAUSE I GOT FULL IN LAB COMPRE (SO DON'T DOUBT IT)
*/

%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int yyerror(const char *s);
%}

%token LB RB LCB RCB VAR IF ELSE OP
%start statement

%%

statement : if_statement {printf("success\n");}
|
;
if_statement : IF LB expression RB block_statement
| IF LB expression RB block_statement ELSE block_statement
;
expression : variable relational_op variable
;
variable : VAR
;
relational_op : OP
;
block_statement : LCB statement_list RCB
;
statement_list : statement
| statement statement_list
;

%%

int yyerror(const char *s){
    extern int yylineno;
    printf("Error %s at line no. %d", s, yylineno);
    return 0;
}

int main(){
    yyparse();
    return 0;
}
