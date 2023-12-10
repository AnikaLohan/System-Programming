/*
Progam 9 : 	Write a YACC program to find the validity of a given expression( for operator + - * and / ). A program in YACC which recognizes a valid variable which starts with letter followed by a digit. The letter should be in lowercase only.
*/
%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int yyerror(char *);

%}

%token letter digit newline operator minus ob cb
// for left associativity 
%left '+' '-'                                          
%left '*' '/'
%%
 

S : E { printf("Valid Identifiers 1\n");printf("Final result : valid Expression \n");exit(0);};
    | S operator S newline {printf("Final result :  valid Expression \n");exit(0);}
    | S minus S newline {printf("Final result : valid Expression \n"); exit(0);}
    | minus S newline {printf("Final result : valid Expression \n"); exit(0);}
    | S operator ob minus S cb {printf("Final result : valid Expression \n"); exit(0);}
    | S operator ob S cb {printf("Final result : valid Expression \n"); exit(0);}
    | ob S ob {printf("Final result : valid Expression \n"); exit(0);}
    ;

E : letter T {printf("variable letter\n");};
T: letter T {printf("letter term\n");}| digit {printf("digit\n");};
%%

int yyerror(char *msg){
  printf("Invalid Expression or identifier\n");
  exit(0);
}

int main (){
   printf("Enter the expression: ");
   yyparse();
}