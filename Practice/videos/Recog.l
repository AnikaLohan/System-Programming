/* Lex Program to recog and display keywords , numbers and words in a given statement*/

%{
#include <stdio.h>
%}

%%
if|else|printf { printf("%s is a keyword\n", yytext); }
[0-9]+          { printf("%s is a number\n", yytext); }
[a-zA-Z]+       { printf("%s is a word\n", yytext); }
.|\n            { ECHO; }
%%

int main(){
    printf("\n Enter the String :");
    yylex();
}

int yywrap(){
    return 1;
}
