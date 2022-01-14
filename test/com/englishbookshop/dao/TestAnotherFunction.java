package com.englishbookshop.dao;

public class TestAnotherFunction {
	public static void main(String[] args) {
		String str= "<div><div class=\"hello\">Neu Anh Khong Con Em<hr></div></div>";
		
		StringBuilder strBuilder = new StringBuilder(str);
		
		while(true) {
			int start = strBuilder.indexOf("<");
			int end = strBuilder.indexOf(">");
			
			System.out.println(start + "-" + end);
			if (start == -1) {
				break;
			}
			System.out.println(strBuilder.substring(start, end+1));
			strBuilder.delete(start, end + 1);
		}
	}
}
