/*

Write a LEX program to print the number of words, characters and lines in a given input.

*/

%{
#include <stdio.h>
int words = 0;
int chars = 0;
int lines = 1;
%}

%%

[a-zA-Z]+ {
    words++;
    chars += yyleng;
}

[\n] {lines++;}

[.] {chars++;}

%%

int main(){
    yyin = fopen("LAB2 Q2 input.txt", "r");
    yylex();
    printf("NO. OF WORDS: %d \n", words);
    printf("NO. OF CHARACTERS: %d \n", chars);
    printf("NO. OF LINES: %d \n", lines);
    return 0;
}