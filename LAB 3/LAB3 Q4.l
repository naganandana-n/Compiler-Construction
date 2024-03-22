/*

Write a LEX program that would take a BITS student's roll number as input 
and prints the details of the student based on that. You are expected to write 
regular expressions that would synthesize information like, year of joining, 
specialization, PS/Thesis, Registration index, Campus (U) etc. from the given roll number. 
If the given input does not abide by the Roll number format, print some error message.

*/

%{
#include <stdio.h>
#include <string.h>
void specialization();
void thesis();
void campus();
%}

%%

["2"][0-9][0-9][0-9]["A"] {
    printf("YEAR OF JOINING: %0.4s \n", yytext);
}

["A"|1-4|"7"|"9"] {specialization();}

["P"|"T"]["S"] {thesis();}

[0-9]+ {
    if (yyleng == 4){
        printf("REGISTRATION INDEX: %s \n", yytext);
    }
    else{
        printf("INCORRECT REGISTRATION NUMBER \n");
    }
}

["U"|"P"|"H"|"G"] {campus();}

%%

void campus(){
    if (strcmp(yytext, "U") == 0)
        printf("CAMPUS: UNITED ARAB EMIRATES \n");
    else if (strcmp(yytext, "P") == 0)
        printf("CAMPUS: PILANI \n");
    else if (strcmp(yytext, "H") == 0)
        printf("CAMPUS: HYDERABAD \n");
    else    
        printf("CAMPUS: GOA \n");
}

void thesis(){
    if (strcmp(yytext, "PS") == 0)
        printf("PRACTICE SCHOOL \n");
    else
        printf("THESIS \n");
}

void specialization(){
    if (strcmp(yytext, "A") == 0){
        printf("ECE \n");
    }
    else{
    int x = atoi(yytext);
    switch(x){
        case 1: {printf("CHEMICAL \n"); break;}
        case 2: {printf("CIVIL \n"); break;}
        case 3: {printf("EEE \n"); break;}
        case 4: {printf("MECHANICAL \n"); break;}
        case 7: {printf("CS \n"); break;}
        case 9: {printf("BIOTECH \n"); break;}
    }
    }
}

int main(){
    yylex();
    return 0;
}