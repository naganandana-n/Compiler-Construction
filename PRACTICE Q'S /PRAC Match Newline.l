%{
/*

Write a Lex program to match everything except newline and match newline.

ECHO is a special action that simply echoes (prints) the matched text 
to the standard output. It's often used as a default action when no other 
action is specified for a particular pattern.

*/
#include <stdio.h>
%}

%%
. ECHO;
\n ECHO;

%%

int main(){
    yylex();
    return 1;
}