package com.util;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionContext;

import org.apache.log4j.Logger;

public class SessionUpdate implements HttpSessionAttributeListener {
	Logger logger = Logger.getLogger(SessionUpdate.class);
	
	@Override
    public void attributeAdded(HttpSessionBindingEvent sbe) {
        String name = sbe.getName();
        Object value = sbe.getValue();
	    logger.info("Attribute added : " + name + ": " + value);
	}

    @Override
    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        // TODO Auto-generated method stub
        String name = sbe.getName();
        Object value = sbe.getValue();
       
        logger.info("Attribute removed : " + name + ": " + value);
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        // TODO Auto-generated method stub
        String name = sbe.getName();
        Object value = sbe.getValue();
       
        logger.info("Attribute replaced : " + name + ": " + value);
    }

}
