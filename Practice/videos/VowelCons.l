/*Lex prihgram to count the number of vowels and consonants from the given input string*/
%{
#include <stdio.h>  
int v=0, c=0;
%}

%%
[ \t\n]+ ;
[aeiouAEIO] {v++;}
[^aeiouAEIO ]  {c++;}

%%

int main(){
    printf("Enter the input string:\n");
    yylex();
    printf("Number of vowels %d \n",v);
    printf("Number of cons %d \n",c);

}

int yywrap(){
    return 1;
}