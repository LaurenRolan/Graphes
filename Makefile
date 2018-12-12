CC       = g++
LEX      = flex
YACC     = bison
LEXFILE  = tp1.lex
YACCFILE = tp1.y
OBJ      = y.tab.o
OUTPUT   = tp1
LIB      = -ll

$(OUTPUT): $(OBJ)
	$(CC) $(OBJ) -o $@ $(LIB)

y.tab.o: lex.yy.c y.tab.c
	$(CC) -c y.tab.c

lex.yy.c: $(LEXFILE)
	$(LEX) $(LEXFILE)

y.tab.c: $(YACCFILE)
	$(YACC) -d $(YACCFILE)
