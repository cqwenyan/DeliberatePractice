package com.wenyan.factoryPattern;

public class AudiFactory implements CarFactory {

	@Override
	public Audi crateCar() {
		return new Audi();
	}

}
