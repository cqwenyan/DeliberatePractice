package com.wenyan.proxyPattern;

public class RealSubject extends Subject{
	
	@Override
	public void Request(){
		System.out.println("真实请求");
	}
}
