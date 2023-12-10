%option noyywrap
%{
#include <iostream>
#include <bits/stdc++.h>
using namespace std;

#include"y.tab.h"
%}
%%
[0-9]+ {yylval = stoi(yytext);return NUM;}
%%