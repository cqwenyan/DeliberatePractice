package com.wenyan.decoratorPattern;

public class HeaderDecorator extends Decorator{

	public HeaderDecorator(Invoice t) {
		super(t);
	}
	public void printInvoice(){
		System.out.println("This is header");
		super.printInvoice();
	}
}
