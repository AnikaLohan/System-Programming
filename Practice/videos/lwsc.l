%{
#include <stdio.h>
int lc=0, sc=0, wc=0, cc=0;
%}

%%
[\n] {lc++, cc++;}
[ \t] {sc++, cc+=yyleng;}
[^\t\n]+ {wc++; cc+=yyleng;}
%%

int main(){
    printf("enter:");
    yylex();
    printf("words:%d", wc);
    printf("characters:%d", cc);
    printf("newlines:%d", lc);
    printf("spaces:%d", sc);

}


int yywrap(){
    return 1;
}