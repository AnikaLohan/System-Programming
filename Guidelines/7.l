%{
    #include <stdio.h>
    #include <string.h>
    
%}

%%
[A-Za-z ]* {
        
        int row=yyleng;    
        printf("\n");   
        while(row>=0)  
	    {
            int col=0; 
            while(col<row) 
            {
                printf("%c",yytext[col]); 
                col++; 
            } 
            printf("\n");
            row--;
	   }
}
%%

int yywrap(){}
int main(){
    yylex();
    return 0;
}