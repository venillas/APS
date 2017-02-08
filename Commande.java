public class Commande{
    Declaration d;
    Statement s;
    Commande suite;

    public Commande(Declaration d, Statement s, Commande suite){
	this.d = d;
	this.s = s;
	this.suite = suite;
    }
}

