package com.wenyan.factoryPattern;

public class Client {

	public static void main(String[] args) {
		BMWFactory bmwFactory = new BMWFactory();
		BMW bmw = bmwFactory.crateCar();
		AudiFactory audiFactory = new AudiFactory();
		Audi audi = audiFactory.crateCar();
	}

}
