package com.wenyan.builderPattern;

public class ConcreteBuilderA extends AbstractBuilder{
	private AbstractProduct productA = new ConcreteProductA();
	@Override
	public void buildPart() {
		this.productA.part1();
		this.productA.part2();
		this.productA.part3();
	}

	@Override
	public AbstractProduct buildProduct() {
		return this.productA;
	}

}
