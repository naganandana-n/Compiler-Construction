/*

LEX PROGRAM TO IDENTIFY CAPITAL WORDS FROM string

here capital word is THIS. all caps.
*/

%{
#include<stdio.h>
%}

%%

[A-Z]+[ \t\n] {printf("%s\n", yytext);}
. ;

%%

int main(){
    yylex();
    return 0;
}