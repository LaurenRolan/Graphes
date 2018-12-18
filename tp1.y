%{
	#include <iostream>
	#include <complex>
	int yylex(void);
	#define YYSTYPE std::complex<double>
	int yyerror(const char*);
%}

%error-verbose

%token NB
%token EOL
%left '+' '-'
%left '*' '/'

%%
input:
/* Ligne vide */
|input ligne
;
ligne: expr EOL {std::cout << $1;}
	| EOL {}
	;
expr: expr '+' expr {$$=$1 + $3;}
	| expr '-' expr {$$=$1 - $3;}
	| expr '*' expr {$$=$1 * $3;}
	| expr '/' expr {$$=$1 / $3;}
	| '|' expr '|' {$$=std::abs($2);}
	| 'e' '(' expr ')' {$$=std::abs($3);}
	| NB
	;
%%
#include "lexer.cxx"
int main()
{
	return yyparse();
}
int yyerror( const char *s )
{
	fprintf( stderr, "Erreur: %s\n", s);
	return 0;
}