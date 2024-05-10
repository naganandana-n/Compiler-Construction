/*
write a lex program to:
1. take file input from command line
2. identfier, string, keywords, delimiter, identify and print
*/

%{
#include <stdio.h>
%}

%option noyywrap

%%

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Identifier: %s\n", yytext);
}

\".*\" {
    printf("String: %s\n", yytext);
}

int|float|char|double|void|if|else|while|for|do|return|break|continue {
    printf("Keyword: %s\n", yytext);
}

[ \t\n] {
    // Ignore whitespace and newline characters
}

[{}()\[\];,] {
    printf("Delimiter: %s\n", yytext);
}

. {
    printf("Unidentified: %s\n", yytext);
}

%%

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE *input_file = fopen(argv[1], "r");
    if (!input_file) {
        printf("Error: Unable to open file %s\n", argv[1]);
        return 1;
    }

    yyin = input_file;
    yylex();

    fclose(input_file);
    return 0;
}
