/*
read from file instruction.c and
concatenate the strings string 1 and string 2
then check if it's a palindrome or not
*/

%{
#include <stdio.h>
#include <string.h>
# define length 50
char total_word[length] = "";
%}

%%

[a-zA-Z] {
    strcat(total_word, yytext);
}

%%

int main(){
    yyin = fopen("MIDSEM LAB Q2 input.c", "r");
    yylex();

    printf("CONCATENATED STRING: %s\n", total_word);
    char rev_word[length] = "";
    int j = 0;

    for (int i = strlen(total_word) - 1; i >= 0; i--){
        rev_word[j] = total_word[i];
        j += 1;
    }

    if (strcmp(rev_word, total_word) == 0){
        printf("PALINDROME");
    }
    else{
        printf("NOT PALINDROME");
    }
    return 0;
}