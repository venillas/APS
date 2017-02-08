
LEX_J  = ~/Documents/APS/jflex-1.6.1/jflex-1.6.1/bin/jflex 
YACC_J = /usr/bin/yacc
JAVAC = javac

LEX_C = flex
YACC_C = yacc -d
GCC = gcc

LEX_ML = ocamllex
YACC_ML = ocamlyacc
OCAMLC = ocamlc

java: calc_j.lex calc_j.y
	$(LEX_J) calc_j.lex
	$(YACC_J) calc_j.y
	$(JAVAC) Parser.java

c: calc_c.lex calc_c.y
	$(YACC_C) -d calc_c.y
	$(LEX_C) calc_c.lex
	$(GCC) -c lex.yy.c
	$(GCC) -c y.tab.c
	$(GCC) lex.yy.o y.tab.o -ll -lm

ml: calc_ml.mll calc_ml.mly
	$(LEX_ML) -o calc_lex.ml calc_ml.mll
	$(YACC_ML) -b calc_yacc calc_ml.mly
	$(OCAMLC) -c calc_yacc.mli
	$(OCAMLC) -c calc_lex.ml
	$(OCAMLC) -c calc_yacc.ml
	$(OCAMLC) calc_lex.cmo calc_yacc.cmo calc_ml.ml
mrproper: clean
	@rm -rf Parser.class Parser.java ParserVal.java ParserVal.class Yylex.class Yylex.java
