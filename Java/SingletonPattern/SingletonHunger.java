package com.wenyan.Singleton;

public class SingletonHunger {
	private SingletonHunger(){}
	private static SingletonHunger instance = new SingletonHunger();
	public static SingletonHunger getInstance(){
		return instance;
	}
}
