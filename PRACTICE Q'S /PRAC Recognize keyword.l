/* 

LEX PROGRAM TO RECOGNIZE AND DISPLAY KEYWORDS, NUMBERS AND WORDS

*/

%{
#include<stdio.h>
%}

%%

if | /* IT IS IMPORTANT TO USE THIS FORMAT, OTHERWISE IT DOESN'T WORK */
else | 
printf {printf("\n%s is a keyword", yytext);}
[0-9]+ {printf("\n%s is a number", yytext);}
[a-zA-Z]+ {printf("\n%s is a word", yytext);}
. | \n {;} /* . MATCHES ANYTHING ELSE, APART FROM NEW LINE */

%%

int main(){
    printf("\nEnter a string: ");
    yylex();
}

int yywrap(){
    return 1;
}