package com.wenyan.decoratorPattern;

public class Decorator extends Invoice{
	protected Invoice ticket;
	public Decorator(Invoice t){
		ticket = t;
	}
	public void printInvoice(){
		if(null!=ticket){
			ticket.printInvoice();
		}
	}
}
