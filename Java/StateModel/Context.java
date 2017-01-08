package com.wenyan.stateModel;

public class Context {
	private State state;
	public void setState(State s){
		state = s;
		state.handle();
	}
}
