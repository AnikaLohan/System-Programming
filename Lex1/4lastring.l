/*begin with "a" strings to be printed*/
/*done*/
%{
#include <stdio.h>
#include <stdlib.h>
int count=0;
%}


%%
 
(a|A)+                   {count++;  printf("%s\n", yytext);}
(a|A)+[a-zA-Z]*          {count++;  printf("%s\n", yytext);}
[b-zB-Z]*                {}
[b-zB-Z]*[a|A][b-zB-Z]*  {}
.                        {}


%%

int yywrap(){};
int main(){

yyin = fopen("astringfile.txt","r");
 
yylex();
printf("%s\n",yytext);
}



