/* LEX TEST BENCH */

%{
#include<stdio.h>
%}

%%

joke[rs] |
A{1,2}shis+ | 
(A[b-e])+ {printf("%s\n", yytext);}
. ;

%%

int main(){
    yylex();
    return 0;
}