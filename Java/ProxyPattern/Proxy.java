package com.wenyan.proxyPattern;

public class Proxy extends Subject{
	RealSubject realSubject;
	@Override
	public void Request() {
		if( null == realSubject){
			realSubject = new RealSubject();
		}
		realSubject.Request();
	}
}
