package com.wenyan.builderPattern;

abstract class AbstractBuilder {
	public abstract void buildPart();
	public abstract AbstractProduct buildProduct(); 
}
