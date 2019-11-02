package com.util;

import java.io.BufferedReader;
import java.sql.Clob;

public class ClobToString {
	 public static String clobToString(Clob clob) throws Exception {
	        StringBuffer s = new StringBuffer();
	        BufferedReader br = new BufferedReader(clob.getCharacterStream());
	        String ts = "";
	        while((ts = br.readLine()) != null) {
	               s.append(ts + "\n");
	        }
	        br.close();
	        return s.toString();
	 }
}
