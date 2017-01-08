package com.wenyan.stateModel;

public class Client {

	public static void main(String[] args) {
		Context context = new Context();
		context.setState(new StateOne());
		context.setState(new StateTwo());
		context.setState(new StateThree());
	}

}
