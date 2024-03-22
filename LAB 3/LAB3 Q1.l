/*

Write a LEX program to get a binary input and print whether the given input is a power of two or not.

*/

%{
#include <stdio.h>
%}

%%

[0]*[1][0]* {
    printf("POWER OF 2 \n");
}

[0-1]* {printf("NOT POWER OF 2 \n");}

%%

int main(){
    yylex();
    return 0;
}