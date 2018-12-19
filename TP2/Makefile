CC       = g++-7
LEX      = flex
YACC     = bison
LEXFILE  = tp2.lex
YACCFILE = tp2.y
OUTPUT   = tp2
OBJ      = $(OUTPUT).tab.o
CXXFLAGS += -std=c++17
LIB      = -ll

$(OUTPUT): $(OBJ)
	$(CC) $(OBJ) -o $@ $(LIB)

$(OUTPUT).tab.o: lex.yy.c $(OUTPUT).tab.c
	$(CC) -c $(OUTPUT).tab.c $(CXXFLAGS)

lex.yy.c: $(LEXFILE)
	$(LEX) $(LEXFILE)

$(OUTPUT).tab.c: $(YACCFILE)
	$(YACC) -d $(YACCFILE)

clean:
	rm $(OUTPUT) *.tab.*
