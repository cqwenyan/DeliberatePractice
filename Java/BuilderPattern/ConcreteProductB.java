package com.wenyan.builderPattern;

public class ConcreteProductB extends AbstractProduct{

	@Override
	protected void part1() {
		System.out.println("B:1");
	}

	@Override
	protected void part2() {
		System.out.println("B:2");
	}

	@Override
	protected void part3() {
		System.out.println("B:3");
	}
}
