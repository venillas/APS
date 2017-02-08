
%{
  import java.io.*;
  import java.util.*;
  import java.lang.*;

%}

%token <ival> NUM            /* a number */
%token <sval> IDENT

%token ADD SUB MUL DIV AND OR LT EQ NOT /* operators */
%token LPAR RPAR             /* parethesis */
%token LCRO RCRO
%token POINTV
%token VAR CONST SET IF WHILE BOOL TRUE FALSE INT


%type <obj> stat
%type <obj> cmds
%type <obj> dec
%type <obj> expr
%type <obj> type

%%
      
cmds : LCRO RCRO "\n" /*empty string*/  { c= new Commande(null,null,null);}
|LCRO stat RCRO				{  System.out.println("IN");c= new Commande(null,(Statement)$2,null);}
|LCRO dec POINTV cmds RCRO		{ $$ = new Commande ((Declaration)$2,null,(Commande)$4);}
|LCRO stat POINTV cmds RCRO		{ $$ = new Commande (null,(Statement)$2,(Commande)$4);}
;

dec : VAR IDENT type           { $$= new Var($2,(TypeE)$3);}
| CONST IDENT expr type        { $$= new Const($2,(Expression)$3,(TypeE)$4);}
;

stat : SET IDENT expr          { $$= new Set($2,(Expression)$3);}
| IF expr cmds cmds            { $$= new If((Expression)$2,(Commande) $3,(Commande)$4);}
| WHILE expr cmds              { $$= new While((Expression)$2,(Commande)$3);}
;

type : BOOL                    { $$= new Bool();}
| INT                          { $$= new Int();}
;

expr : TRUE                    { $$= new True();}
| FALSE                        { $$= new False();}
| NUM                          { $$= new Num($1);}
| IDENT                        { $$= new Ident($1);}
| LPAR NOT expr RPAR           { $$= new Not((Expression)$3);}
| LPAR AND expr expr RPAR    {  $$= new And((Expression)$3,(Expression)$4);}
| LPAR OR expr expr RPAR    { $$= new Or((Expression)$3,(Expression)$4);}

| LPAR ADD expr expr RPAR    {   $$= new Add((Expression)$3,(Expression)$4);}
| LPAR MUL expr expr RPAR    {  $$= new Mul((Expression)$3,(Expression)$4);}
| LPAR SUB expr expr RPAR    { $$= new Sub((Expression)$3,(Expression)$4);}
| LPAR DIV expr expr RPAR    {  $$= new Div((Expression)$3,(Expression)$4);}
| LPAR LT expr expr RPAR    {  $$= new Lt((Expression)$3,(Expression)$4);}
| LPAR EQ expr expr RPAR    { $$= new Eq((Expression)$3,(Expression)$4); }    
;

%%
private Yylex lexer;

private int yylex () {
  Commande c ;
  int yyl_return = -1;
  try {
    yylval = new ParserVal(0);
    lexer.yylex();
  }
  catch (IOException e) {
    System.err.println("IO error :"+e);
  }
  
  return yyl_return;
}
public void yyerror (String error) {
  System.err.println ("Error: " + error);
}
public Parser(Reader r) {
  lexer = new Yylex(r, this);
}

static boolean interactive;

public static void main(String args[]) throws IOException {
  System.out.println("BYACC/Java with JFlex Demo");
  Parser yyparser;
  if ( args.length > 0 ) {
    // parse a file
    yyparser = new Parser(new FileReader(args[0]));
  }
  else {
    // interactive mode
    System.out.println("[Quit with CTRL-D]");
    System.out.print("Expression: ");
    interactive = true;
    yyparser = new Parser(new InputStreamReader(System.in));
  }
  yyparser.yyparse();
  if (interactive) {
    System.out.println();
    System.out.println("Have a nice day");
  }
}
