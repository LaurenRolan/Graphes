%option outfile="lexer.cxx"
%{
#include <iostream>
#include <complex>
%}
%option noyywrap nounput batch debug



%%
[*/+\-()|e] 				{return yytext[0];}
[ \t\r] 			{}
(([0-9]*\.[0-9]+)|([0-9]+))?((E|e)[-+]?[0-9]+)? {
						yylval=std::complex<double>(atof(yytext));
						return NB;
					}
(([0-9]*\.[0-9]+)|([0-9]+))((E|e)[-+]?[0-9]+)?i {
						yylval=std::complex<double>(0, atof(yytext));
						return NB;
					}
				
i 					{
						yylval=std::complex<double>(0, 1);
						return NB;
					}
\n		{return EOL;}
%%
