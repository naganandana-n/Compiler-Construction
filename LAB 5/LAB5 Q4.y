%{
    #include<stdio.h>
    int yylex(void);
    int yyerror(const char *s);
%}
%token HEADER INT MAIN LB RB LCB RCB SC COMMA VAR EQ OP FLOAT DOUBLE CHAR
%start prm
%%
prm: HEADER INT MAIN LB RB LCB BODY RCB { printf("Parsing Successful\n");
}
    ;
BODY: DECL_STMTS PROG_STMTS
    ;
DECL_STMTS: DECL_STMT DECL_STMTS
| DECL_STMT
    ;
DECL_STMT: INT VAR_LIST SC
    | FLOAT VAR_LIST SC
    | DOUBLE VAR_LIST SC
    | CHAR VAR_LIST SC
    ;
VAR_LIST: VAR COMMA VAR_LIST
    | VAR
    ;
PROG_STMTS: PROG_STMT PROG_STMTS
| PROG_STMT
    ;
PROG_STMT: VAR EQ A_EXPN SC
    ;
A_EXPN: A_EXPN OP A_EXPN
    | LB A_EXPN RB
    | VAR
    ;
%%
int main() { yyparse(); return 0; }
int yyerror(const char *msg) {
    extern int yylineno;
    printf("Parsing Failed due to %s in line no %d\n",msg,yylineno);
    return 0;
}