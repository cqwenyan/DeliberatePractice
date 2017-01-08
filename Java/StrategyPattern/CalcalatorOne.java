package com.wenyan.strategyPattern;

public class CalcalatorOne implements IRateCalculator {
	private double rate = 0.5;

	@Override
	public double calculate(double amount) {
		return amount * rate;
	}
}
