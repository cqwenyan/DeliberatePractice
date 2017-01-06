package com.wenyan.decoratorPattern;

public class Client {

	public static void main(String[] args) {
		Invoice t=new Invoice();
		Invoice ticket;
		ticket = new FooterDecorator(new HeaderDecorator(t));
		ticket.printInvoice();
		System.out.println("Hello");
		ticket = new FooterDecorator(new HeaderDecorator(new Decorator(null)));
		ticket.printInvoice();
	}

}
