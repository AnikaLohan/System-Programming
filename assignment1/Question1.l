%{
    #include<stdio.h>
    #include<string.h>
    int lines = 0 , words = 0 , charac = 0, spaces = 0 , num = 0;
%}

%%
<<EOF>> {
    lines++;
    yyterminate();     
}


[ ] {
    fprintf(yyout , "%c" , ' ');
    spaces++;
    charac++;
} 
\n {
    lines++;
    fprintf(yyout , "%c" , '\n');
    fprintf(yyout , "%d%c" , lines+1 , ' ');
    charac++;
}
(while|if|else|return|break|continue|int|float|void|for) {
    words++;
    charac += yyleng;
    fprintf(yyout , "%s" , yytext);
    printf("keyword    : %s%c" , yytext , '\n');
}

[0-9]+(.[0-9]+)?(E[+-]?[0-9]+)? {
    num++;
    charac += yyleng;
    fprintf(yyout , "%s" , yytext);
    printf("num        : %s%c" , yytext , '\n');
}
[a-zA-Z][a-zA-Z0-9_]* {
    words++;
    charac += yyleng;
    fprintf(yyout , "%s" , yytext);
    printf("identifier : %s%c" , yytext , '\n');
}
[+-] {
    charac++;
    fprintf(yyout , "%c" , yytext);
    printf("addop      : %s%c" , yytext , '\n');
}
[*/] {
    charac++;
    fprintf(yyout , "%c" , yytext);
    printf("mulop      : %s%c" , yytext , '\n');
}
[<>]|">="|"<="|"=="|"!=" {
    charac += yyleng;
    fprintf(yyout , "%s" , yytext);
    printf("relop      : %s%c" , yytext , '\n');
}
&& {
    charac += 2;
    fprintf(yyout , "%s" , yytext);
    printf("and        : %s%c" , yytext , '\n');
}
\|\| {
    charac += 2;
    fprintf(yyout , "%s" , yytext);
    printf("or         : %s%c" , yytext , '\n');
}
! {
    fprintf(yyout , "%c" , yytext);
    charac++;
    printf("not        : %s%c" , yytext , '\n');
}
[()\[\]{}=;] {
    fprintf(yyout , "%s" , yytext);
    charac++;
    printf(yytext);
    printf("          : %s%c" , yytext , '\n');
}
. {
    charac++;
    fprintf(yyout , "%c" , yytext);
    printf("Error      : %s%c" , yytext , '\n');
}
%%
int yywrap(){
    return 1;
}
int main(){
    printf("Class      : Lexemes\n");
    yyin=fopen("input.txt","r");
    yyout = fopen("output.txt" , "w");
    fprintf(yyout , "%d%c" , 1 , ' ');
    yylex();
    printf("Words : %d%c" , words + num , '\n');
    printf("Numbers  : %d%c" , num , '\n');
    printf("Whitespaces  : %d%c" , spaces , '\n');
    printf("Lines  : %d%c" , lines , '\n');
    printf("Characters  : %d%c" , charac , '\n');
    return 0;
}
