
/* 1. Count the number of lines, words, and characters in an input file. lex program */
%{
#include <stdio.h>
int line_count = 0;
int word_count = 0;
int char_count = 0;
%}

%%
\n     { line_count++; char_count += yyleng;}
[a-zA-Z]+  { word_count++; char_count += yyleng; }
.      { char_count++; }
%%


  
int yywrap(){};
int main(){

yyin = fopen("input.txt","r");

 
 yylex();

    printf("Lines: %d\n", line_count);
    printf("Words: %d\n", word_count);
    printf("Characters: %d\n", char_count);


    return 0;
}

   

/*/
/*


*/