/*In a given input file, replace all words that end with e or E with #. */

%{
#include <stdio.h>
%}

%%
[a-zA-Z]+e    { printf("#"); }
[a-zA-Z]+E   { printf("#"); }
.            { printf("%s", yytext); }


%%
int yywrap() {}



int main() {
    
yyin = fopen("input4.txt","r");

    yylex();
    return 0;
}
