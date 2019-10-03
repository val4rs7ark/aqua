package com.was.erp;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.util.UriMapping;

public class ControllerMapping {
	private static final Logger logger = Logger.getLogger(ControllerMapping.class);
	public static ActionServlet mapping(String mapping,Map<String, Object> pMap) {
		ActionServlet aServlet=null;
		if(mapping.indexOf("emp")>-1) {
			aServlet = new EmpController(pMap,mapping);
		}
		else if(mapping.indexOf("product")>-1) {
			aServlet = new ProductController(pMap,mapping);
		}
		else if(mapping.indexOf("was")>-1) {
			aServlet = new WasController(pMap,mapping);
		}
		return aServlet;
	}

}
