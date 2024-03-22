/*

Write a LEX program to insert line numbers to a file. 
For this copy your favourite C program “input.c” to your 
folder which would be the input to your LEX program.

*/

%{
#include <stdio.h>
int line = 1;
%}

%%

.*\n {
    printf("%d %s", line++, yytext);
}

%%

int main(){
    yyin = fopen("LAB3 Q2 input.c", "r");
    yylex();
    return 0;
}