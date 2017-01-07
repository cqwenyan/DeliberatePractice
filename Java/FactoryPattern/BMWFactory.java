package com.wenyan.factoryPattern;

public class BMWFactory implements CarFactory {

	@Override
	public BMW crateCar() {
		return new BMW();
	}

}
