package com.wenyan.strategyPattern;

public class CalculatorTwo implements IRateCalculator {
	private double rate = 0.9;

	@Override
	public double calculate(double amount) {
		return amount * rate;
	}

}
