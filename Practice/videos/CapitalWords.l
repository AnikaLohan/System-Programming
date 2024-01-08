/*lex program to identify the capital words from given input string */

%{
#include <stdio.h>
%}

%%
[A-Z]+[ \t\n] { printf("%s\n",yytext);}
.               ;
%%

int main(){
    printf("Enter the input string:");
    yylex();
}
int yywrap(){
    return 0;
}