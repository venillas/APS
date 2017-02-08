abstract class Declaration{

}

class Var extends Declaration{
    String ident;
    TypeE type;

    public Var(String i, TypeE t){
	this.ident = i;
	this.type = t;
    }

}

 class Const extends Declaration{
    String ident;
    Expression expr;
    TypeE type;

    public Const(String i, Expression e, TypeE t){
	this.ident = i;
	this.expr=e;
	this.type = t;
    }
    
}
