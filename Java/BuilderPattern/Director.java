package com.wenyan.builderPattern;

public class Director {
	private AbstractBuilder builderA = new ConcreteBuilderA(); 
	private AbstractBuilder builderB = new ConcreteBuilderB();
	
	public AbstractProduct getProductA(){
		this.builderA.buildPart();
		return this.builderA.buildProduct();
	}
	public AbstractProduct getProductB(){
		this.builderB.buildPart();
		return this.builderB.buildProduct();
	}
}
