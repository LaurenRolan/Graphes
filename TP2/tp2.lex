%option outfile="lexer.cxx"
%{
#include <iostream>
#include <complex>
#include <unordered_map>
#include <variant>
#include <string>
%}
%option noyywrap nounput batch debug
real ([0-9]*\.[0-9]+)|([0-9]+)((E|e)[-+]?[0-9]+)?
%%
display				{ return KEYWORD; }
[a-zA-Z_][a-zA-Z_0-9]*	{ yylval = yytext; return ID; }
[*/+\-()|e=] 				{return yytext[0];}
[ \t\r] 			{}
{real} {
						yylval=std::complex<double>(atof(yytext));
						return NB;
					}
{real}?i {
						yylval=std::complex<double>(0, atof(yytext));
						return NB;
					}
				
\n		{return EOL;}
%%
