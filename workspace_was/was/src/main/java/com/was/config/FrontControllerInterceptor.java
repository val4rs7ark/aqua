package com.was.config;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.was.erp.WasLogic;

@Component
public class FrontControllerInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(FrontControllerInterceptor.class);
	
	@Autowired
	WasLogic wasLogic = null;
	
	@Override
	public void postHandle (HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) 
			throws Exception { 
		super.postHandle(request, response, handler, modelAndView);
		logger.info("----------------------Interceptor: postHandle---------------------");
		Map<String,Object> model = modelAndView.getModel();
		String check = null;
		if(model.get("emp_name")!=null)check = model.get("emp_name").toString();
		boolean isOk = false;
		if("존재하지 않는 사원코드입니다..".equals(check) || "비밀번호를 다시 확인하세요".equals(check) 
	             || "기존 아이디로 새로운 접속이 감지되었습니다.".equals(check)) {
			modelAndView.addObject("emp_name",check);
		}else {
			HttpSession httpSession = request.getSession();
			String session_no = httpSession.getId();
			Enumeration er = request.getAttributeNames();
			while(er.hasMoreElements()) {
				logger.info("request -->>"+er.nextElement().toString());
			}
			String empno = (String)request.getAttribute("empno");
			String emp_pw = (String)request.getAttribute("emp_pw");
			Map<String,Object> pMap = new HashMap<>();
			if(empno != null && emp_pw != null) {
			pMap.put("session_no", session_no);
			pMap.put("empno", empno);
			pMap.put("emp_pw", emp_pw);
			wasLogic.wasLogin(pMap);
			String result = pMap.get("emp_name").toString();
				if("존재하지 않는 사원코드입니다..".equals(result) || "비밀번호를 다시 확인하세요".equals(result) 
					    || "기존 아이디로 새로운 접속이 감지되었습니다.".equals(result)) {
					modelAndView.addObject("emp_name",result);
						isOk = false;
				}else{
					 	isOk =true;
				}
			}else {
				String s_empno = (String)httpSession.getAttribute("s_emp_no");
				String s_emp_pw = (String)httpSession.getAttribute("s_emp_pw");
				logger.info("s_empno -->"+s_empno+" , s_emp_pw -->"+s_emp_pw+" , session_no -->"+session_no);
				if(s_empno != null && s_emp_pw != null) {
					pMap.put("session_no", session_no);
					pMap.put("empno", s_empno);
					pMap.put("emp_pw", s_emp_pw);
					pMap.put("postHandle", "");
					wasLogic = new WasLogic();
					wasLogic.wasLogin(pMap);
					String result = pMap.get("emp_name").toString();
						if("존재하지 않는 사원코드입니다..".equals(result) || "비밀번호를 다시 확인하세요".equals(result) 
							    || "기존 아이디로 새로운 접속이 감지되었습니다.".equals(result)) {
							modelAndView.addObject("emp_name",result);
								isOk = false;
						}else{
							 	isOk =true;
						}
				}else {
					isOk = false;
				}
			}
			
			logger.info("isOk -->"+isOk);
			httpSession = null;
		}
		if(isOk) {
		}else {
			modelAndView.setViewName("forward:index.jsp");
		}
	}
	
}
