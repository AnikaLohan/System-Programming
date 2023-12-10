/*  Count the number of words in an input file with two or more occurrences of the same letter. */
%option noyywrap
%{
#include <stdio.h>
#include <string.h>
int letterCount[26];  
int count = 0;
%}

%%

([a-zA-Z])*  {
    int i;
    int len = strlen(yytext);
    int hasTwoOrThreeOccurrences = 0;

   
    for (i = 0; i < 26; i++) {
        letterCount[i] = 0;
    }

  
    for (i = 0; i < len; i++) {
        char c = yytext[i]; 
         if ((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) {

            if (c >= 'A' && c <= 'Z') {
                c += 'a' - 'A';
            }
            letterCount[c - 'a']++;
            }
    }

 
    for (i = 0; i < 26; i++) {
        if (letterCount[i] == 2 || letterCount[i] == 3) {
            hasTwoOrThreeOccurrences = 1;
            break;
        }
    }

   
    if (hasTwoOrThreeOccurrences) {
        printf("Word with a letter occurring two or three times: %s\n", yytext);
        count++;
    }
}
[^a-zA-Z] {}
[-+*/=<>]*[0-9]*[a-zA-Z][0-9]*[-+*/=<>]*[a-zA-Z]* {}


%%

int main() {
  
    yylex();
    printf("\n number of word is: %d",count);
    return 0;
}



