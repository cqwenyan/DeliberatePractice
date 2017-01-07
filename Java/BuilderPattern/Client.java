package com.wenyan.builderPattern;

public class Client {

	public static void main(String[] args) {
		System.out.println("Default product");
		AbstractProduct defualtProductA = new ConcreteProductA().defaultProduct();
		System.out.println("---------");
		Director director = new Director();
		director.getProductA();
		director.getProductB();
		
	}

}
