/*

Modify the above LEX program so that a word and its characters 
are counted only if its length is greater than or equal to 6.

*/

%{
#include <stdio.h>
int words = 0;
int chars = 0;
int lines = 1;
%}

%%

[a-zA-Z]+ {
    if (yyleng >= 6){
        words++;
        chars += yyleng;
    }
}

[\n] {lines++;}

[.] {chars++;}

%%

int main(){
    yyin = fopen("LAB2 Q3 input.txt", "r");
    yylex();
    printf("GIVEN THAT, ONLY WORDS WITH LENGTH > 6 ARE INCLUDED: \n");
    printf("NO. OF WORDS: %d \n", words);
    printf("NO. OF CHARACTERS: %d \n", chars);
    printf("NO. OF LINES: %d \n", lines);
    return 0;
}