%{
 #include <stdlib.h>
 #include "y.tab.h"
 void yyerror(char *);
%}
%%

[a-z] {
 yylval = *yytext - 'a';
 return VARIABLE;
 }

[0-9]+ {
 yylval = atoi(yytext);
 return INTEGER;
 }

[-+()=/*\n] { return *yytext; }

[ \t] ;

['$'] {exit(0);}

. yyerror("invalid character");

%%
int yywrap(void) {
 return 1;
}