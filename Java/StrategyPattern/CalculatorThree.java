package com.wenyan.strategyPattern;

public class CalculatorThree implements IRateCalculator {
	private double rate = 1.5;

	@Override
	public double calculate(double amount) {
		return rate * amount;
	}

}
