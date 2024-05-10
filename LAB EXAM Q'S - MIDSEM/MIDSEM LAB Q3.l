/*
Get two numbers as input.
Reverse the second number and check if it's equal to the first number
Handle incorrect input and display appropriate message
*/

%{
#include <stdio.h>
#define length 50
char num1[length] = "";
char num2[length] = "";
int num1done = 0;
%}

%%

[0-9]+ {
    if (num1done == 0){
        strcat(num1, yytext);
        num1done = 1;
    }
    else{
        strcat(num2, yytext);
    }
}

%%

int main(){
    yyin = fopen("MIDSEM LAB Q3 input.c", "r");
    yylex();

    char rev_num2[length] = "";
    int j = 0;
    for (int i = strlen(num2) - 1; i >= 0 ;i--){
        rev_num2[j] = num2[i];
        j += 1;
    }

    if (strcmp(num1, rev_num2) == 0){
        printf("REVERSE OF 2ND NUMBER IS EQUAL TO FIRST NUMBER: %s, %s \n", num1, num2);
    }
    else{
        printf("REVERSE OF 2ND NUMBER IS NOT EQUAL TO FIRST NUMBER: %s, %s \n", num1, num2);
    }
    return 0;
}