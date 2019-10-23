package com.was.erp;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class simul {

	public static void main(String[] args) {
		Map<String,Object> pMap = new HashMap<>();
		DecimalFormat df = new DecimalFormat("00");
		Calendar currCal = Calendar.getInstance();
		String df_month = "02";
		String df_year = df.format(currCal.get(Calendar.YEAR));
		String df_lastyear = null;
		String df_lastmonth = null;
		System.out.println("df_year :"+df_year+" , df_month :"+df_month);
		pMap.put("mcMonth", df_month);
		pMap.put("mcYear", df_year);
		int imonth = Integer.parseInt(df_month);
		int j = 1;
		for(int i=0;i<5;i++) {
		//1월보다 낮다면 이전년도로 바꿔야 하기에 분기
		if(imonth-(i+1)<1) {
			df_lastyear = df.format(currCal.get(Calendar.YEAR)-1);
			//이전달이 1월보다 더 전이고 그 차이가 0보다 클 때
			if((0-(imonth-(i+1)))>0) {
				df_lastmonth = 12-(0-(imonth-(i+1)))+"";
				System.out.println("df_lastyear :"+df_lastyear+" , df_lastmonth :"+df_lastmonth);
			//이전달이 1월보다 전이고 그차이가 0일 때 == 12월	
			}else {
				df_lastmonth = "12";
				System.out.println("df_lastyear :"+df_lastyear+" , df_lastmonth :"+df_lastmonth);
			}
		}else {
			df_lastyear = df.format(currCal.get(Calendar.YEAR));
			df_lastmonth = df.format(imonth-(i+1));
			System.out.println("df_lastyear :"+df_lastyear+" , df_lastmonth :"+df_lastmonth);
		}
		pMap.put("mcMonth"+j, df_lastmonth);
		pMap.put("mcYear"+j, df_lastyear);
		j++;
		}
		///////////////////////////////
		Object[] keys = pMap.keySet().toArray();
		for(Object key : keys) {
			System.out.println("key :"+key.toString()+" , value :"+pMap.get(key.toString()));
		}
	}

}
