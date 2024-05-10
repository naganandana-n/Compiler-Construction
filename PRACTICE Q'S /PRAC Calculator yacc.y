/*
NOT USEFUL!! SKIP!!

LEX AND YACC CALCULATOR TUTORIAL
*/

%token NUM

%%

S : E 
;
E : E '+' T
| T
;
T : T '*' F
| F
;
F : '(' E ')'
| '-' F
| NUM
;

%%