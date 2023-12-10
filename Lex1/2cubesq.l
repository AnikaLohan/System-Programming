
/* Lex program to square the negative nos and cube the pos numbers */
/*done 1*/

%{
int positive_no = 0, negative_no = 0;
%}

/*Rules*/

%%
[+-]?[0-9]+ {
      int num = atoi(yytext);
    /*int num= yylval;*/
    if (num > 0) {
        printf("Cube: %d\n", num * num * num);
    } else if (num < 0) {
        printf("Square: %d\n", num * num);
    }
}


		
%%

/*** use code section ***/

int yywrap(){}
int main()											
{

yylex();

return 0;
}
