%{ 
#include <math.h>
#include "cal.tab.h" 
void yyerror(char *);
%} 


%option noyywrap

%% 
[0-9]+\.?|[0-9]*\.[0-9]+		                        {yylval.t =atof(yytext); return NUM;}
log								{return LOG;}
sin								{return SIN;}
cos								{return COS;}
tan								{return TAN;}

. 								{yyerror("Invalid Input");}

%%