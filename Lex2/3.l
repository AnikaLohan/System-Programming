/* 3.	Given a sequence of paranthesis (), {}, {}, check if the sequence is balanced/valid. */
/*program to balance braces and parenthesis matcing */

%option noyywrap
%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char stack[1000];
int top = -1;    //empty stack
int is_balanced = 1; 

void push(char c) {
    stack[++top] = c;
}

char pop() {
    if (top >= 0) { return stack[top--];}
    else { return '\0'; }
}
%}

%%
[(]    { push(*yytext); }
[{]     { push(*yytext); }
[\[]     { push(*yytext); }
[)]     { if (pop() != '(') 
              {
                is_balanced = 0;
                break;
              }
        }
[}]     { if (pop() != '{') 
            {
                is_balanced = 0;
                break;
            }
        }
[\]]    { if (pop() != '[') 
            {
                is_balanced = 0;
                break;
            }
        }
.       ; //Ignore any other thing

%%

int main() {

    yylex();
    
    if (top == -1 && is_balanced) {
        printf("Accepted: Parenthesis and brackets are balanced.\n");
    } 
    else 
    {
        printf("Rejected:Input is not balanced.\n");
    }
    return 0;
}
