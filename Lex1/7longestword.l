/*done*/
%{

#include <stdio.h>
#include <string.h>

char longest_string[100] = "";         // Store the longest string
int longest_length = 0;          // Store the length of the longest string
%}

%%
[a-zA-Z]+        {
   	         	if (yyleng > longest_length) {
        		longest_length = yyleng;
        		strcpy(longest_string, yytext); // Copy the matched yytext to longest_string

			/*longest_string= yytext;*/
    		 	}

		 }



.                { /* Ignore all other characters */ }


%%

int yywrap() {
    return 1; 
}

int main() {
	yyin=fopen("file1.txt","r");
	yyin=fopen("file2.txt","r");
	yylex();



    // Print the longest string and its length
    printf("Longest String: %s\n", longest_string);
    printf("Length: %d\n", longest_length);

    return 0;
}
