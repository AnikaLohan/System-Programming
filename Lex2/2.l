/* 2.Convert the contents of a file into its Caeser Cipher equivalent.*/
/* Note that spaces between words remain spaces. The special characters also do not change*/

%{
#include <stdio.h>
#include <ctype.h>
int shift = 1; 
%}

%%

[a-zA-Z] {
    int i;
    for (i = 0; i < yyleng; i++) {
        if (islower(yytext[i])) {
            yytext[i] = (yytext[i] - 'a' + shift) % 26 + 'a';
        } else if (isupper(yytext[i])) {
            yytext[i] = (yytext[i] - 'A' + shift) % 26 + 'A';
        }
    }
    printf("%s", yytext);
}

. {
    printf("%s", yytext);
}

%%

int yywrap() {}

int main() {
    FILE *input;
    
    input = fopen("input2.txt", "r");
    if (input == NULL) {
        fprintf(stderr, "Unable to open file input2.txt\n");
        return 1;
    }
    
    yyin = input;
   

    yylex();

    fclose(input);
   

    return 0;
}



