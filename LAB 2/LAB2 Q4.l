/*

Write a LEX program to print if the input is an odd number or an even number 
along with its length. Also, the program should check the correctness of the input 
(i.e. if the input is one even number and one odd number).

NOTE:
printf("LENGTH OF NUMBER: %lu \n", yyleng);
 - when you use yyleng, you cant use %d, you HAVE TO USE %lu [SOMETIMES ONLY, NOT ALWAYS]

*/

%{
#include <stdio.h>
%}

%%

[0-9]+ {
    int num = atoi(yytext);
    if (num % 2 == 0){
        printf("EVEN NUMBER \n");
    }
    else{
        printf("ODD NUMBER \n");
    }
    printf("LENGTH OF THE NUMBER: %lu", yyleng);
}

%%

int main(){
    yylex();
    return 0;
}