/*Request the user for two numbers - one even and the other odd. Check if the user has entered one even and one odd number and display appropriate messages.*/
/*done */

%%
[0-9]+      {
              int num = atoi(yytext);
    	      if (num % 2 == 0) {
        	printf("Even: %d\n", num);
    	    } else {
        	printf("Odd: %d\n", num);
            }
            }


-[0-9]+      {
              int num = atoi(yytext);
    	      if (num % 2 == 0) {
        	printf("Even: %d\n", num);
    	    } else {
        	printf("Odd: %d\n", num);
            }
            }



%%

int yywrap(void){}

int main(){
 yylex();
}