package com.util;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;

import com.was.erp.Model;
//190918
public class ResultView {
	Logger logger = Logger.getLogger(ResultView.class);
	HttpServletRequest req = null;
	HttpServletResponse res = null;
	String mapping = null;
	Model model = null;
	public ResultView(HttpServletRequest req, HttpServletResponse res, String mapping, Model model) {
		this.req = req;
		this.res = res;
		this.mapping = mapping;
		this.model = model;
	}
	////////////////////////////세션 설정 메소드///////////////////////////
	public HttpSession getSession() {
		HttpSession session =null;
		if(model.getConfirmSession()==1) {
			if("wasLogin".equals(mapping)) {
				logger.info("session 생성 if문 안에 탐");
				List<Map<String,Object>> rList = model.getAddAttribute();
				session = req.getSession();
				session.setAttribute("s_emp_no", rList.get(0).get("empno"));
				session.setAttribute("s_emp_pw", rList.get(0).get("emp_pw"));
				session.setAttribute("s_emp_name", rList.get(0).get("emp_name"));
				session.setAttribute("s_outtime", rList.get(0).get("outtime"));
				logger.info("session  처리 후 세션안에 든 값 확인 ::::::"+session.getAttribute("s_emp_name"));
				logger.info("session  처리 후 세션안에 든 값 확인 ::::::"+session.getAttribute("s_emp_no"));
				logger.info("session  처리 후 세션안에 든 값 확인 ::::::"+session.getAttribute("s_emp_pw"));
				logger.info("session  처리 후 세션안에 든 값 확인 ::::::"+session.getAttribute("s_outtime"));
				}
		}
		return session;
	}
	////////////////////////////세션 설정 메소드///////////////////////////
	////////////////////////////쿠키 설정 메소드///////////////////////////
	public void addCookie() {
		if(model.getConfirmCookie()==1) {
		}
	}
	////////////////////////////쿠키 설정 메소드///////////////////////////
	////////////////////////////응답화면 method/////////////////////////
	public RequestDispatcher resultView() {
		RequestDispatcher view = null;
		if("wasEmpAttendance".equals(mapping)) {
			view = req.getRequestDispatcher(model.getFullView());
			try {
				view.forward(req, res);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else if("wasEmpStatusNoteInsert".equals(mapping)) {
			view = req.getRequestDispatcher(model.getFullView());
			try {
				view.forward(req, res);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else if("wasEmpStatusNoteDetail".equals(mapping)) {
			view = req.getRequestDispatcher(model.getFullView());
			try {
				view.forward(req, res);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else if("wasEmpStatus".equals(mapping)) {
				view = req.getRequestDispatcher(model.getFullView());
				try {
					view.forward(req, res);
				} catch (ServletException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		else if("wasLogin".equals(mapping)) {
			view = req.getRequestDispatcher(model.getFullView());
			try {
				view.forward(req, res);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else if("empSignUp".equals(mapping)) {
			try {
				res.sendRedirect(model.getFullView());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else if("productInsert".equals(mapping)) {
			try {
				res.sendRedirect(model.getFullView());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		else if("productList".equals(mapping)) {
			view = req.getRequestDispatcher(model.getFullView());
			try {
				view.forward(req, res);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return view;
	}
	////////////////////////////응답화면 method/////////////////////////
}
