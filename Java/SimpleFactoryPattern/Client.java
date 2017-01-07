package com.wenyan.simpleFactoryPattern;

public class Client {

	public static void main(String[] args) {
		Factory factory = new Factory();
		Car bmw = factory.createCar("BMW");
		Car Audi = factory.createCar("Audi");
	}

}
