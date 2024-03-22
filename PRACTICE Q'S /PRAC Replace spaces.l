%{
/*
Write a lex program that replaces multiple spaces and tab to a single space. 
If there are multiple spaces at the beginning or end of a line, it should all be ignored.
*/

#include <stdio.h>
%}

%%

^[ \t]+ { }
[ \t]+ {printf("%c", ' ');}
[ \t]+$ {/* ignore space */}

%%
int main(){
    yylex();
    return 1;
}
