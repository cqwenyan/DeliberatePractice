package com.wenyan.adapter;

public class Adapter extends Target{
	private Adaptee adaptee;
	@Override
	public void Request(){
		adaptee.SepecificRequest();
	}
}
