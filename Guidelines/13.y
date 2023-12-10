%{
#include<stdio.h>
#include<stdlib.h>
#include<strings.h>
void yyerror(char *);
 int yylex(void);
%}
%token alpha beta newline
%%
line : term beta newline {printf("Expression is Valid\n");};
term: alpha term | ;
%%

void yyerror(char *msg)
{
printf("Invalid Expression\n");
}

int main ()
{
printf("Enter the expresssion for a then b, a should be atlest 10 (a^nb where n>=10e): ");
yyparse();
} 