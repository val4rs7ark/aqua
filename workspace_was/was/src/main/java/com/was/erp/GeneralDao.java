package com.was.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
@Service
public class GeneralDao {
	Logger logger = LoggerFactory.getLogger(GeneralController.class);	
	@Autowired(required=false)
	SqlSessionTemplate sqlSessionTemplate = null;
	
	public List<Map<String, Object>> invenList(Map<String,Object> pMap) {
		List<Map<String,Object>> invenList = null;
		invenList = sqlSessionTemplate.selectList("invenList",pMap);
		return invenList;
	}

	public void invenAdd(Map<String, Object> pMap) {
		sqlSessionTemplate.insert("invenAdd",pMap);
	}

	public int getInvenTotal(Map<String, Object> pMap) {
		int getInvenTotal= sqlSessionTemplate.selectOne("getInvenTotal",pMap);
		logger.info("getInvenTotal 호출 성공");
		return getInvenTotal;
	}
	

	public void invenAdd_daegi(Map<String, Object> pMap) {
		logger.info("invenAdd_daegi 호출 성공");
		sqlSessionTemplate.update("invenAdd_daegi",pMap);
		
	}
	//invengroup 리스트 조회
	public List<Map<String, Object>> invengroupList() {
		logger.info("invengroupList 호출 성공");
		List<Map<String,Object>> invengroupList = null;
		invengroupList = sqlSessionTemplate.selectList("invengroupList");
		return invengroupList;
	}
	//invengroup 총 row 구하기.
	public int getInvenGroupTotal() {
		int getInvenGroupTotal= sqlSessionTemplate.selectOne("getInvenGroupTotal");
		logger.info("getInvenGroupTotal 호출 성공");
		return getInvenGroupTotal;
	}

	public int getInven_no() {
		logger.info("getInven_no 호출 성공");
		int getInven_no = sqlSessionTemplate.selectOne("getInven_no");
		logger.info("getInven_no="+getInven_no);
		return getInven_no;		
	}

	public void invenAdd2(Map<String, Object> pMap) {
		logger.info("invenAdd2 호출 성공");
		sqlSessionTemplate.insert("invenAdd2",pMap);
	}

	public void invenDel(List<String> list) {
		logger.info("GeneralDao invenDel 호출 성공");
		sqlSessionTemplate.delete("invenDel",list);
	}

	public void pummokadd(Map<String, Object> pMap) {
		logger.info("GeneralDao pummokadd 호출 성공");
		sqlSessionTemplate.insert("pummokadd", pMap);
	}

	public void invenUpdate(Map<String, Object> pMap) {
		sqlSessionTemplate.update("invenUpdate", pMap);
	}

	public String jungbokAlert(String pid_code) {
		String result = "";
		result = sqlSessionTemplate.selectOne("jungbokAlert", pid_code);
		logger.info("result="+result);
		return result;
	}

}






























