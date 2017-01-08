package com.wenyan.facadePatterns;

public class Facade {
	public void function() {
		ModuleA a = new ModuleA();
		a.functionA();
		ModuleB b = new ModuleB();
		b.functionB();
		ModuleC c = new ModuleC();
		c.functionC();
	}
}
