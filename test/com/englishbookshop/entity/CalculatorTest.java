package com.englishbookshop.entity;

import static org.junit.Assert.*;

import org.junit.Test;

public class CalculatorTest {

	@Test
	public void testSum() {
		Calculator calculator = new Calculator();
		int a = 1234;
		int b = 1234;
		int result = calculator.sum(a, b);
		
		assertEquals(result, 2468);
	}

}
