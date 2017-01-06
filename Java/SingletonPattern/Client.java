package com.wenyan.Singleton;

public class Client {

	public static void main(String[] args) {
		SingletonLazy s1 = SingletonLazy.getInstance();
		System.out.println("懒汉模式");
		SingletonHunger s2 = SingletonHunger.getInstance();
		System.out.println("饿汉模式");
	}
}
