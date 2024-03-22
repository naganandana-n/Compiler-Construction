%{
/*
1.Request input of an even and an odd number
2.indicate input characteristic : Even/Odd [digit_length]
3.check for input's correctness and print result
*/

#include <stdio.h>
#include <stdlib.h>

int number_1;
int number_2;
%}

number_sequence [0-9]*

%%

{number_sequence}[0|2|4|6|8] {
    printf("\nEven number length: %d", yyleng);
    return atoi(yytext);
}
{number_sequence}[1|3|5|7|9] {
    printf("\nOdd number length: %d", yyleng);
    return atoi(yytext);
}

%%

int main(){
    printf("\nEnter an even number and an odd number: ");
    number_1 = yylex();
    number_2 = yylex();
    int diff = number_1 - number_2;
    if (diff % 2 != 0)
        printf("\nCorrect input");
    else
        printf("\nIncorrect input");
    return 1;
}



