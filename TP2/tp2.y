%{
	#include <iostream>
	#include <complex>
	#include <unordered_map>
	#include <variant>
	using namespace std;
	int yylex(void);
	#define YYSTYPE variant<string, complex<double>>
	unordered_map<string, complex<double>> tableau;
	int yyerror(const char*);
%}

%error-verbose

%token NB
%token ID
%token EOL
%token KEYWORD

%left '+' '-'
%left '(' ')'
%left '*' '/'
%left 'e'
%right '='

%%
input:
/* Ligne vide */
|input ligne
;
ligne: stmtlist
	;
stmtlist: stmt EOL stmtlist
	| EOL
	;
stmt:     expr
	| ID '=' expr { tableau[get<string>($1)] = get<complex<double>>($3);}
	| KEYWORD ID {cout << tableau[get<string>($2)];}
	;
expr: expr '+' expr {$$=get<complex<double>>($1) + get<complex<double>>($3);}
	| expr '-' expr {$$=get<complex<double>>($1) - get<complex<double>>($3);}
	| expr '*' expr {$$=get<complex<double>>($1) * get<complex<double>>($3);}
	| expr '/' expr {$$=get<complex<double>>($1) / get<complex<double>>($3);}
	| '|' expr '|'  {$$=abs(get<complex<double>>($2));}
	| 'e' '(' expr ')' {$$=exp(get<complex<double>>($3));}
	| '(' expr ')' {$$=get<complex<double>>($2);}
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
	cout << "Erreur: " << s << endl;
	return 0;
}
