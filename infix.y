/* tcalc.y - a four function calculator */

/* C Declarations */

%{
	#define YYSTYPE double /* yyparse() stack type */
	#include <malloc.h>
	#include <stdlib.h>
	#include <stdio.h>
	#include <math.h>
%}

/* BISON Declarations */

%token NEWLINE NUMBER

/* Grammar follows */

%%
input:	

	| input line
	;

line:	NEWLINE

	| exp NEWLINE { printf("\t%d\n",$1); }
	;

exp:      NUMBER		{ $$ = $1; 	}

        | exp '+' exp		{ $$ = $1 + $3; }

        | exp '-' exp	{ $$ = $1 - $3; }
	;

%%

/* Additional C code */

/* Error processor for yyparse */


