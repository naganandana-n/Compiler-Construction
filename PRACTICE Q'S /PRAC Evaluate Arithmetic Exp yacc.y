/* 
YACC PROG TO EVALUATE ARITHMETIC EXPR 
yacc part:
*/

%{
#include<stdio.h>
%}

%token ID /* SPECIFY TOKENS USED FROM LEX */
%left '+''-' /* left USED TO SPECIFY LEFT ASSOCIATIVITY */
%left '*''/'

%%

S : E {printf("Result: %d\n", $1); exit(0);}
;

E : E '+' E {$$ = $1 + $3;}
| E '-' E {$$ = $1 - $3;}
| E '*' E {$$ = $1 * $3;}
| E '/' E {$$ = $1 / $3;}
| '(' E ')' {$$ = $2;}
| ID {$$ = $1;}
;

%%
yyerror(char *s){
    printf("Invalid expresssion");
    exit(0);
}

main(){
    printf("Enter expression: ");
    yyparse();
}