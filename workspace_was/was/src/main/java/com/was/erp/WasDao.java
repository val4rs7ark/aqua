package com.was.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WasDao {
	private static final Logger logger = LoggerFactory.getLogger(WasDao.class);
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void wasLogin(Map<String, Object> pMap) {
		pMap.put("msg", "");
		pMap.put("outtime", "");
		sqlSessionTemplate.selectOne("wasLogin", pMap);
	}
	public void firstLogin(Map<String, Object> pMap) {
		//여기에서 세션아이디를 업데이트처리한다.
		logger.info("wasDao.firstLogin에 들어왔다!");
		logger.info("insert session_no :"+pMap.get("session_no").toString());
		sqlSessionTemplate.update("firstLogin", pMap);
	}
	public Map<String,Object> checkLogin(Map<String, Object> pMap) {
		String session_no = null;
		String dumy = null;
		logger.info("wasDao.checkLogin에 들어왔다!");
		session_no = sqlSessionTemplate.selectOne("checkLogin", pMap);
		dumy = sqlSessionTemplate.selectOne("dumyIndex", pMap.get("empno").toString());
		String day = dumy.substring(4, 6);
		Map<String,Object> result = new HashMap<>();
		result.put("session_no", session_no);
		result.put("day", day);
	return result;
	}
	public void sessionOut(String sid) {
		//여기에서 세션아이디를 업데이트처리한다.
		logger.info("wasDao.sessionOut에 들어왔다!");
		sqlSessionTemplate.update("sessionOut", sid);
	}
	public String dumyIndex(String empno) {
		String result = "";
		//여기에서 세션아이디를 업데이트처리한다.
		logger.info("wasDao.dumyIndex에 들어왔다!");
		result = sqlSessionTemplate.selectOne("dumyIndex", empno);
	return result;
	}
	public List<Map<String, Object>> wasEmpStatus(String empno) {
		List<Map<String, Object>> empStatus = null;
		empStatus = sqlSessionTemplate.selectList("wasEmpStatus", empno);
		return empStatus;
	}
}
