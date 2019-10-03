package com.util;

public class UriMapping {
	
	public static String getMapping(String uri){
		String commands[] = uri.split("/");
		int cut = commands[2].indexOf(".");
		String command = commands[2];
		String mapping = command.substring(0,cut);
		return mapping;
	}

}
