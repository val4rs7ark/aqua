package com.util;
import java.io.File;
import java.util.Enumeration;
/*
 * 사용자가 입력한 값을 읽을 때 마다 반복되는 request.getParameter()를 대신해서
 * 사용할 수 있는 bind메소드 추가하기
 * 리턴 타입은 void로 하지만 파라미터를 Map타입으로 하여 필요한 개발자가 Map을 생성하고
 * 그 주소번지를 받아서 여기에 값을 담는다.
 */
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;


public class HashMapBinder {
	Logger logger = Logger.getLogger(HashMapBinder.class);
	HttpServletRequest req = null;
	String gap = null;
	//req객체를 서블릿에서 받아와야 하니깐....
	public HashMapBinder(HttpServletRequest req, String gap) {
		this.req = req;
		this.gap = gap;
	}
	public void selectBind(Map<String,Object> target) {
		if("0".equals(gap)) {
			bind(target);
		}else if("1".equals(gap)) {
			bindPost(target);
		}
	}
	//get방식으로 요청시 사용할 것.
	/****************************************************************
	 * 
	 * @param target Map<String,Object> 객체생성해서 넘길 것.
	 * 주의 :NullPointerException 맞기 싫으면....
	 ****************************************************************/
	public void bind(Map<String,Object> target) {
		//insert here
		//파라미터로 넘어온 target안에 다른정보가 담겨 있다면 제거
		target.clear();
		Enumeration er = req.getParameterNames();
		while(er.hasMoreElements()) {
			String name = (String)er.nextElement();//name,addr,pet		
			target.put(name,req.getParameter(name));//Tomcat server.xml에서 UTF-8설정함
			
		}
	}
	//post방식으로 요청시 사용할 것. - 한글처리 인코딩 타입은 UTF-8 로 하였음.
	public void bindPost(Map<String,Object> target) {
		//insert here
		//파라미터로 넘어온 target안에 다른정보가 담겨 있다면 제거
		target.clear();
		Enumeration er = req.getParameterNames();
		while(er.hasMoreElements()) {
			String name = (String)er.nextElement();//name,addr,pet
				target.put(name,HangulConversion.toUTF(req.getParameter(name)));
		}
	}
}
