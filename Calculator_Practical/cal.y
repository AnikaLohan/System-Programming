%{
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
void yyerror(const char *);
%}


%token SIN COS TAN 


%left '+' '-'
%left '*' '/'
%left '%'
%left LOG
%right '^'

%%

s   : s exp '\n'            { printf("\nThe output is: %f\n", $2); }
    | s
    |
    ;
exp : NUM                { $$ = $1; }
    | exp '+' exp        { $$ = $1 + $3; }
    | exp '-' exp        { $$ = $1 - $3; }
    | exp '*' exp        { $$ = $1 * $3; }
    | exp '^' exp        { $$ = pow($1, $3); }
    | exp '/' exp        { if ($3 == 0) { printf("Division By Zero error"); } else $$ = $1 / $3; }
    ;

%%


int main()
{       yyparse(); 
	return 0;
}