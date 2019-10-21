package com.was.erp;

public class testSplit {

	public static void main(String[] args) {
		String s = "2019-10-04/21:10";
		String[] ss= s.split("-");
		for(int i=0;i<ss.length;i++) {
			System.out.println(ss[i]);
		}
		System.out.println(ss[1]);
	}

}
