
/* Lex program to Identify and Count Positive and Negative Numbers */
/*ask */
%{
#include <stdio.h>
#include <stdlib.h>
int positive_no = 0, negative_no = 0;
%}


%%
[-][0-9]+          { negative_no++; }
[0-9]+             { positive_no++; }

%%


int yywrap(){}

int main(int argc, char *argv[]){
    if(argc!=2){
        printf("usage %s\n",argv[0]);
        return 1;
    }

  yy_scan_string(argv[1]);
    yylex();
    printf("number of +ve= %d,"
           "number of -ve= %d", positive_no, negative_no);
    return 0;

}

