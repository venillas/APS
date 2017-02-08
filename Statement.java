abstract class Statement{

}

class Set extends Statement{
    String ident;
    Expression expr;

    public Set(String i, Expression e){
	this.ident = i;
	this.expr=e;
    }
}

class If extends Statement{
    Expression expr;
    Commande c1;
    Commande c2;

    public If(Expression e, Commande a, Commande b){
	this.expr = e;
	this.c1=a;
	this.c2=b;
    }
}


class While extends Statement{
    Expression expr;
    Commande c;

    public While(Expression e, Commande a){
	this.expr = e;
	this.c=a;
    }
}
			  
			  
