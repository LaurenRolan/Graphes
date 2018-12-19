CC       = g++
LEX      = flex
YACC     = bison
LEXFILE  = tp1.lex
YACCFILE = tp1.y
OUTPUT   = tp1
OBJ      = $(OUTPUT).tab.o
LIB      = -ll

$(OUTPUT): $(OBJ)
	$(CC) $(OBJ) -o $@ $(LIB)

$(OUTPUT).tab.o: lex.yy.c $(OUTPUT).tab.c
	$(CC) -c $(OUTPUT).tab.c

lex.yy.c: $(LEXFILE)
	$(LEX) $(LEXFILE)

$(OUTPUT).tab.c: $(YACCFILE)
	$(YACC) -d $(YACCFILE)

clean:
	rm $(OUTPUT) *.tab.*