/*

Write a LEX program to recognize the following 
Operators: +, -, *, /, |, 
Numbers
newline
Any other character apart from the above should be recognized as mystery character
For each of the above mentioned matches (classes of lexeme) in your input, 
the program should print the following: PLUS, MINUS, MUL, DIV, ABS, NUMBER, NEW LINE, MYSTERY CHAR 
respectively. Your program should also strip of whitespaces.

*/

%{
#include <stdio.h>
%}

%%

[+] {printf("PLUS \n");}
[-] {printf("MINUS \n");}
[*] {printf("MUL \n");}
[/] {printf("DIV \n");}
[|] {printf("ABS \n");}
[0-9]+ {printf("NUMBER \n");}
[\n] {printf("NEWLINE \n");}
[ |\t] {/* whitespaces or tabs */;}
. {printf("MYSTERY CHAR \n");}

%%

int main(){
    yylex();
    return 0;
}