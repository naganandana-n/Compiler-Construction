/*
[d] Modify your LEX program to incorporate the following changes
As per the current set up, the programmer is supposed to use only 
lower-case alphabets in variable names in their C program. 
Modify your lex program so as to let the programmer have uppercase letters A to Z together 
with digits 0 to 9 and underscore character in variable names. 
Ensure that a variable name always begin with a character.
Terminate your program with an error message if in case the programmer uses keywords if, 
while, do, and for as variable names. Note that its permitted to have variable names 
beginning with keywords (ifvar, donut etc.) (hint: rely on conflict resolution rules).
Add provision to declare variables of type float, double and char.
*/

%option yylineno
%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}

%%

"#include<stdio.h>" {return HEADER;}
"int" {return INT;}
"float" {return FLOAT;}
"double" {return DOUBLE;}
"char" {return CHAR;}
"if" {printf("Usage of keyword if as variable name is prohibited.\n");}
"main" {return MAIN;}
"(" {return LB;}
")" {return RB;}
"{" {return LCB;}
"}" {return RCB;}
"," {return COMMA;}
";" {return SC;}
"=" {return EQ;}
[\+\-\*\/] {return OP;}
[a-z]+ {return VAR;} 
[\n\t ]+
. {printf("Unmatched character %s at line no. %d", yytext, yylineno);}

%%

int yywrap(void){
    return 1;
}

