package com.was.erp;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class testSplit {
	
	public static Date addMonth(Date date, int months) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, months);
        return cal.getTime();
    }


	public static void main(String[] args) {
		Date date = new Date();
        SimpleDateFormat sdformat = new SimpleDateFormat("yyyy/mm/dd");
        Date before3Mon = addMonth(date,-11);

        String today = sdformat.format(date);
        String before3Months = sdformat.format(before3Mon);
        
        System.out.println(today+"  , "+before3Months);


	}

}
