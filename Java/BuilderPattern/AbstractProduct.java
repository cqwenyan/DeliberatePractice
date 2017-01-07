package com.wenyan.builderPattern;

public abstract class AbstractProduct {
	protected abstract void part1();
	protected abstract void part2();
	protected abstract void part3();
	
	public final AbstractProduct defaultProduct(){
		part1();
		part2();
		part3();
		return this;
	}
}
