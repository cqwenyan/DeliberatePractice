package com.wenyan.builderPattern;

public class ConcreteProductA extends AbstractProduct{

	@Override
	protected void part1() {
		System.out.println("A:1");
	}

	@Override
	protected void part2() {
		System.out.println("A:2");
	}

	@Override
	protected void part3() {
		System.out.println("A:3");
	}
}
