%{
#include <stdio.h>
/*

LEX Program to detect numbers and operators out of a given input.

LEX obtains the regular expressions of the symbols number and op from 
the declarations section and generates code into a function yylex() in 
the lex.yy.c file. This function checks the input stream for the first 
match to one of the patterns specified and executes code in the action 
part corresponding to the pattern.

*/
%}

number [0-9]+
op [-|+|*|/|^|=]

%%

{number} {printf("number ");}
{op} {printf("operator ");}

%%

int main(){
    yylex();
    return 1;
}