package com.wenyan.strategyPattern;

public class Test {

	public static void main(String[] args) {
		double number = 100.0;
		double result;
		IRateCalculator iRateCalculator;
		iRateCalculator = new CalcalatorOne();
		result = iRateCalculator.calculate(number);
		System.out.println("CalcalatorOne:" + result);

		iRateCalculator = new CalculatorTwo();
		result = iRateCalculator.calculate(number);
		System.out.println("CalcalatorTwo:" + result);

		iRateCalculator = new CalculatorThree();
		result = iRateCalculator.calculate(number);
		System.out.println("CalcalatorThree:" + result);
	}

}
