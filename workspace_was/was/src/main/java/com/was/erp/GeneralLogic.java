package com.was.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
@Service
public class GeneralLogic {
	Logger logger = LoggerFactory.getLogger(GeneralController.class);	
	@Autowired(required=false)
	GeneralDao generalDao = null;
	public List<Map<String, Object>> invenList(Map<String,Object> pMap, int getInvenTotal) {
		logger.info("invenList: String 호출");
		List<Map<String,Object>> invenList = null;
		invenList = generalDao.invenList(pMap);
		return invenList;
	}
	public void invenAdd(Map<String,Object> pMap) {
		generalDao.invenAdd(pMap);
	}
	public int getInvenTotal(Map<String, Object> pMap) {
		int getInvenTotal = generalDao.getInvenTotal(pMap);
		return getInvenTotal;
	}
	
	public int getInvenGroupTotal() {
		int getInvenGroupTotal = generalDao.getInvenGroupTotal();
		return getInvenGroupTotal;
	}
	public void invenAdd_daegi(Map<String, Object> pMap) {
		logger.info("invenAdd_daegi 호출 성공");
		generalDao.invenAdd_daegi(pMap);
		
	}
	
	public List<Map<String,Object>> invengroupList() {
		logger.info("invengroupList 호출 성공");
		List<Map<String,Object>> invengroupList = null;
		invengroupList=generalDao.invengroupList();
		return invengroupList;
	}
	public int getInven_no() {
		logger.info("getInven_no 호출 성공");
		int getInven_no = generalDao.getInven_no();
		return getInven_no;
	}
	public void invenAdd2(Map<String, Object> pMap) {
		logger.info("invenAdd2 호출 성공");
		generalDao.invenAdd2(pMap);
		
	}
	public void invenDel(List<String> list) {
		logger.info("GeneralLogic invenDel 호출 성공");
		generalDao.invenDel(list);
		
	}
	public void pummokadd(Map<String, Object> pMap) {
		generalDao.pummokadd(pMap);
	}
	public void invenUpdate(Map<String, Object> pMap) {
		generalDao.invenUpdate(pMap);
		
	}
	public String jungbokAlert(String pid_code) {
		String result = generalDao.jungbokAlert(pid_code);
		return result;
	}
	public void confirm(int order_no) {
		generalDao.confirm(order_no);
		
	}

}
