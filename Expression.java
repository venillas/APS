import java.util.*;

abstract class Expression{
    Class type;
    final public Class TypegetType(){
	return this.type;
    }
}


class True extends Expression{
    
    public True(){
    }

    public void setType(){
	this.type = boolean.class;
    }
}

class False extends Expression{

    public False(){
    }

    public void setType(){
	this.type=boolean.class;
    }
}

class Ident extends Expression{
    String name;

    public Ident(String s){
	this.name=s;
	this.type = String.class;
    }
}


class Num extends Expression{
    int value;

    public Num (int i){
	this.value = i;
    }
}

/*UNARY*/
class Not extends Expression{
    Expression exp;

    public Not (Expression e){
	this.exp = e;
    }
}
/*BINARY*/

class And extends Expression{
    Expression left;
    Expression right;

    public And (Expression e1, Expression e2){
	this.left = e1;
	this.right = e2;
    }
}

class Or extends Expression{
    Expression left;
    Expression right;

    public Or (Expression e1, Expression e2){
	this.left = e1;
	this.right = e2;
    }
}


class Add extends Expression{
    Expression left;
    Expression right;

    public Add (Expression e1, Expression e2){
	this.left = e1;
	this.right = e2;
    }
}


class Mul extends Expression{
    Expression left;
    Expression right;

    public Mul (Expression e1, Expression e2){
	this.left = e1;
	this.right = e2;
    }
}

class Sub extends Expression{
    Expression left;
    Expression right;

    public Sub (Expression e1, Expression e2){
	this.left = e1;
	this.right = e2;
    }
}

class Div extends Expression{
    Expression left;
    Expression right;

    public Div (Expression e1, Expression e2){
	this.left = e1;
	this.right = e2;
    }
}


class Lt extends Expression{
    Expression left;
    Expression right;

    public Lt (Expression e1, Expression e2){
	this.left = e1;
	this.right = e2;
    }
}

class Eq extends Expression{
    Expression left;
    Expression right;

    public Eq (Expression e1, Expression e2){
	this.left = e1;
	this.right = e2;
    }
}
