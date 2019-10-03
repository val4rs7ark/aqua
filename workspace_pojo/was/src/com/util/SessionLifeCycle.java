package com.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;

import com.was.erp.WasDao;

public class SessionLifeCycle implements HttpSessionListener {
	public static SessionLifeCycle sessionLifeCycle = null;
	public List<Map<String,Object>> sessionList = new ArrayList<>();
	private Logger logger = Logger.getLogger(SessionLifeCycle.class);
	Map<String,Object> sMap = new HashMap<>();
	WasDao wasDao = null;
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		String sid = se.getSession().getId();
		sMap.put("sid", sid);
		sessionList.add(sMap);
		logger.info("세션이 생성되었을 때 무조건 id를 담는다 sessionList.size ==>"+sessionList.size());
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		logger.info("세션죽음");
		String sid = se.getSession().getId();
		if(wasDao==null) wasDao = new WasDao();
		wasDao.sessionOut(sid);
	}
}
