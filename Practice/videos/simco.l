/* program to recog whether a given statement */

%{
#include  <stdio.h>
int flag=0;
%}

%%
and|or|because|but|if|then|nevertheless  { flag = 1; }
. ;

%%

int main(){
  printf("enter the secn");
  yylex();
  if(flag==0){
    printf("simple");
  }else{
    printf("compound");
  }

return 0;
 
}
 int yywrap(){
    return 1;
  }