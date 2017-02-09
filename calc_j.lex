
%%

%byaccj

%{
  private Parser yyparser;

  public Yylex(java.io.Reader r, Parser yyparser) {
    this(r);
    this.yyparser = yyparser;
  }
%}

nums = '-' ? [0-9]+
ident = [a-zA-Z]+ [a-zA-Z0-9]*
   

%%

/* operators */
"add"  { return Parser.ADD; }
"sub"  { return Parser.SUB; }
"mul"  { return Parser.MUL; }
"div"  { return Parser.DIV; }
"not"  { return Parser.NOT;}
"eq"   {return Parser.EQ;}
"lt"   {return Parser.LT;}
"and"  {return Parser.AND;}
"or"   {return Parser.OR;}

/* parenthesis */
"("  { return Parser.LPAR; }
")"  { return Parser.RPAR; }

/*crochets*/
"["  {  System.out.println("[");return Parser.LCRO; }
"]"  {  System.out.println("]");return Parser.RCRO; }

";"  {return Parser.POINTV;}

"VAR"   { return Parser.VAR; }
"CONST" { return Parser.CONST; }
"SET"   { return Parser.SET; }
"IF"    { return Parser.IF; }
"WHILE" { return Parser.WHILE; }
"bool"  { return Parser.BOOL; }
"true"  { return Parser.TRUE; }
"false" { return Parser.FALSE; }
"int"   { return Parser.INT; }

/* entier */
{nums}  { yyparser.yylval = new ParserVal(Integer.valueOf(yytext()));
         return Parser.NUM; }

{ident} { yyparser.yylval = new ParserVal(yytext());
         return Parser.IDENT;}
/* whitespace */
[ \t]+ { }

\b     { System.err.println("Sorry, backspace doesn't work"); }

/* error fallback */
[^]    { System.err.println("Error: unexpected character '"+yytext()+"'"); return -1; }
