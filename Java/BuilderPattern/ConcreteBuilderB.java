package com.wenyan.builderPattern;

public class ConcreteBuilderB extends AbstractBuilder{
	private AbstractProduct productB = new ConcreteProductB();
	@Override
	public void buildPart() {
		this.productB.part3();
		this.productB.part2();
	}

	@Override
	public AbstractProduct buildProduct() {
		return this.productB;
	}

}
