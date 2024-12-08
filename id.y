
/* C declarations */
						
%{
	#include <stdio.h>
	#include <math.h>
	#define YYSTYPE int
%}

/* Bison declarations */
		
%start declaration	/* define the start symble */	
		     
%token INT FLOAT CHAR ID   /* define token type for numbers */

%%	  	


/* Simple grammar rules */

/*program: 
	|program declaration
	;*/

declaration: TYPE ID1 ';'	{ 
					printf("\nValid Declaration\n");
					return 0;
				}
				;
TYPE : INT	{ }

     | FLOAT	{ }

     | CHAR	{  }
     ;

ID1  : ID1 ',' ID	{   }

     |ID		{ }
     ;
