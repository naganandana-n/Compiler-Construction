/*

Write a LEX program to save the contents of an input file excluding comment lines to another file.

*/

%{
#include <stdio.h>
%}

%%

\/\/(.*) {/*IGNORE SINGLE LINE COMMENTS*/;}
\/\*(.*\n)*(.*)\*\/ {/*IGNORE MULTI LINE COMMENTS*/;}

%%

int main(){
    yyin = fopen("LAB3 Q3 input.c", "r");
    yyout = fopen("LAB3 Q3 output.c", "w");
    yylex();
    return 0;
}