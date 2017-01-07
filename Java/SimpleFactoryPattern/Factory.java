package com.wenyan.simpleFactoryPattern;

public class Factory {
	public Car createCar(String type){
		switch(type){
		case "Audi":
			return new Audi();
		case "BMW":
			return new BMW();
		default:
			break;
		}
		return null;
	}
}
