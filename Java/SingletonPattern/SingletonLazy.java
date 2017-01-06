package com.wenyan.Singleton;

public class SingletonLazy {//懒汉模式
	private static SingletonLazy instance;
	private SingletonLazy(){}
	
	public static SingletonLazy getInstance(){
		if(null==instance){
			instance = new SingletonLazy();
		}
		return instance;
	}
}
