package com.wenyan.stateModel;

public class StateOne implements State {

	@Override
	public void handle() {
		System.out.println("StateOne");
	}
}
