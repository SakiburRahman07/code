%{
 enum yytokentype {
 NUMBER = 258,
 ADD = 259,
 SUB = 260,
 MUL = 261,
 DIV = 262,
 ABS = 263,
 PLUS = 264
};
 int yylval;
%}
%%
"a" {yylval = yytext[0]-96; return ADD; }
"-" { return SUB; }
"+" { return PLUS; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n 
[ \t] { /* ignore whitespace */ }
. { printf("Mystery character %c\n", *yytext); }
%%

int yywrap()
{
return 0;
}

main(int argc, char **argv)
{
 int tok;
 while(tok = yylex()) {
 printf("%d %d", tok,yylval);
 if(tok == NUMBER) printf(" = %d\n", yylval);
 else printf("\n");
 }
}