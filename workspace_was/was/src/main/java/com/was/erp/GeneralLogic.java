package com.was.erp;

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
	public List<Map<String, Object>> invenList() {
		List<Map<String,Object>> invenList = null;
		invenList = generalDao.invenList();
		return invenList;
	}
	public void invenAdd(Map<String,Object> pMap) {
		generalDao.invenAdd(pMap);
	}
	public int getInvenTotal() {
		int totalrow = generalDao.getInvenTotal();
		return totalrow;
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

}
