/* tcalc.y - a four function calculator */
%{
	#define YYSTYPE double /* yyparse() stack type */
	#include <malloc.h>
	#include <stdlib.h>
	#include <stdio.h>
	#include <math.h>
%}
%token NEWLINE NUMBER PLUS MINUS SLASH ASTERISK LPAREN RPAREN
%%
input:	/* empty string */
	| input line
	;
line:	NEWLINE
	| exp NEWLINE	{ printf("\t%.10g\n",$1); }
	;
exp:      NUMBER		{ $$ = $1;         }
        | exp exp PLUS		{ $$ = $1 + $2;    }
        | exp exp MINUS		{ $$ = $1 - $2;    }
        | exp exp ASTERISK	{ $$ = $1 * $2;    }
        | exp exp SLASH		{ $$ = $1 / $2;    }
	;

%%

int yyerror(char *s) /* called by yyparse on error */
{
	printf("%s\n",s);
	return(0);
}

/* The controlling function */

int main(void)
{
	yyparse();
	exit(0);
}