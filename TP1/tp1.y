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
%left '(' ')'
%left '*' '/'
%left 'e'

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
	| '|' expr '|' {std::cout << "Module of " << std::abs($2);$$=std::abs($2);}
	| 'e' '(' expr ')' {$$=std::exp($3);}
	| '(' expr ')' {$$=$2;}
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
	std::cout << "Erreur: " << s << std::endl;
	return 0;
}