/* Lex program to print number or operator */
/*done*/


%%


[0-9]+ {printf("positive number = %s\n",
				yytext);} 

[\\\+\-*/] {printf("operator = %s\n",yytext);} 

%%



int yywrap(void){}
int main()											
{

yylex();

return 0;
}
