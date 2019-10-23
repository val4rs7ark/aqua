package com.was.erp;

import java.util.List;
import java.util.Map;


public class Model {
	private int ConfirmCookie = 0;
	private int ConfirmSession = 0; 
	private String viewName =null;
	private String viewPath =null;
	private String viewExtension =null;
	private String listName = null;
	private String method = "forward";
	private List<Map<String,Object>> addAttribute =null;
	
	public void setViewPath(String viewPath) {
		this.viewPath = viewPath;
	}
	public void setViewExtension(String viewExtension) {
		this.viewExtension = viewExtension;
	}
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	public List<Map<String, Object>> getAddAttribute() {
		return addAttribute;
	}
	public void setAddAttribute(List<Map<String, Object>> addAttribute) {
		this.addAttribute = addAttribute;
	}
	public String getFullView() {
		return viewPath+"/"+viewName+"."+viewExtension;
	}
	/******************************************************************************
	 * 세션처리를 해야하는 업무인지 체크하는 용도로 만들었다.
	 * @return 반환값이 0이면 세션처리업무 x 1이면 세션처리업무 O
	 * 
	 *
	 ******************************************************************************/
	public int getConfirmSession() {
		return ConfirmSession;
	}
	public void setConfirmSession(int confirmSession) {
		ConfirmSession = confirmSession;
	}
	public int getConfirmCookie() {
		return ConfirmCookie;
	}
	public void setConfirmCookie(int confirmCookie) {
		ConfirmCookie = confirmCookie;
	}
	public String getListName() {
		return listName;
	}
	public void setListName(String listName) {
		this.listName = listName;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
}
