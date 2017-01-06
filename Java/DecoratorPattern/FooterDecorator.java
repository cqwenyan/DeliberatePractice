package com.wenyan.decoratorPattern;

public class FooterDecorator extends Decorator{
	public FooterDecorator(Invoice t){
		super(t);
	}
	public void printInvoice(){
		super.printInvoice();
		System.out.println("This is Footer");
	}
}
