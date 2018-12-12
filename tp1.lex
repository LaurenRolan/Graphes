%option outfile="lexer.cxx"
%{
#include <iostream>c
%}
%option noyywrap nounput batch debug

%%
[*/+-] 				{return yytext[0];}
[ \t\r] 			{}
[0-9]+				{
						yylval=atof(yytext);
						return NB;
					}
([0-9]*\.[0-9]+)			{
						yylval=atof(yytext);
						return NB;
}
(E|e)[-+]?[0-9]+ {
						yylval=atof(yytext);
						return NB;
					}
(([0-9]*\.[0-9]+)|([0-9]+))?((E|e)[-+*/]?[0-9]+) {
						yylval=std::complex<double>(atof(yytext));
						return NB;
					}
(([0-9]*\.[0-9]+)|([0-9]+))?((E|e)[-+*/]?[0-9]+)i {
						yylval=std::complex<double>(0, atof(yytext));
						return NB;
					}
\n		{return EOL;}
i 					{
						yylval=std::complex<double>(0, 1);
						return NB;
					}
%%
