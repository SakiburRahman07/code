/* a simple calculator program */

/* C Declarations */

%{   
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
	#include "infix.tab.h"
	extern YYSTYPE yylval;
%}

%option noyywrap

/* Name Definitions */

delim	[ \t]
whitesp	{delim}+
digit	[0-9]
number	{digit}*[.]?{digit}+

/* Regular Expressions and Actions */

%%

{number}	{ yylval = atoi(yytext); return NUMBER;}
[-+/*()]		{ return *yytext; }
"\n"	     { return *yytext; }
{whitesp}	{ return NEWLINE; }
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