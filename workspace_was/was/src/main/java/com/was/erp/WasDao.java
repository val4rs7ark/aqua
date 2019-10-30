package com.was.erp;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
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
	
	private static SqlSessionFactory sqlSessionFactory = null;
	
	public void wasLogin(Map<String, Object> pMap) {
		pMap.put("msg", "");
		pMap.put("outtime", "");
		
		if(pMap.get("postHandle")!=null) { 
			if(sqlSessionFactory==null) { 
				try { 
					String resource = "/mapper/mybatis-config.xml"; 
					Reader reader = Resources.getResourceAsReader(resource); 
					sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader,"development");
				} catch (IOException e) { 
					e.printStackTrace(); 
				} 
			}
			sqlSessionTemplate = new SqlSessionTemplate(sqlSessionFactory); 
		}
		 
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
	public List<Map<String, Object>> wasEmpStatus(Map<String, Object> pMap) {
		logger.info("wasDao.wasEmpStatus에 들어왔다!");
		logger.info("pMap::::::::::::::::"+pMap);
		List<Map<String, Object>> result = null;
			result = sqlSessionTemplate.selectList("wasEmpStatus", pMap);	
		return result;
	}
	public List<Map<String, Object>> wasEmpStatusNoteList(Map<String, Object> pMap) {
		logger.info("wasDao.wasEmpStatusNoteList에 들어왔다!");
		logger.info("pMap::::::::::::::::"+pMap);
		List<Map<String, Object>> result = null;
			result = sqlSessionTemplate.selectList("wasEmpStatusNoteList", pMap);
		return result;
	}
	public List<Map<String, Object>> wasEmpStatusNoteDetail(Map<String, Object> pMap) {
		logger.info("wasDao.wasEmpStatusNoteDetail에 들어왔다!");
		logger.info("pMap::::::::::::::::"+pMap);
		List<Map<String, Object>> result = null;
			result = sqlSessionTemplate.selectList("wasEmpStatusNoteDetail", pMap);
		logger.info("DB탐 noteDetail :::::::"+result);
		return result;
	}
	public int wasEmpStatusNoteInsert(Map<String, Object> pMap) {
		int result = 0;
			result = sqlSessionTemplate.update("wasEmpStatusNoteInsert", pMap);
			logger.info("result 성공:1 실패:0-->"+result);
		return result;
	}
	public List<Map<String, Object>> wasEmpAttendance(Map<String, Object> pMap) {
		pMap.put("msg", " ");
		sqlSessionTemplate.selectOne("wasEmpAttendance", pMap);
		List<Map<String,Object>> rList = new ArrayList<>();
		rList.add(pMap);
		return rList;
	}
	public int wasEmpStatusNoteDelete(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.update("wasEmpStatusNoteDelete", pMap);
		logger.info("result 성공:1 실패:0-->"+result);
	return result;
	}
	public List<Map<String,Object>> wasMainChart(Map<String, Object> pMap) {
		List<Map<String,Object>> resultList = sqlSessionTemplate.selectList("wasMainChart",pMap);
		return resultList;
	}
	//급여화면 직근 3개월 급여 구하는 코드
	public String wasAvgofSal(Map<String, Object> pMap) {
		String avgofSal = "";
		pMap.put("avgofSal","");
		try {
			sqlSessionTemplate.selectOne("wasAvgofSal", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		avgofSal = pMap.get("avgofSal").toString();
		return avgofSal;
	}
	//생일 구하는 코드
	public List<Map<String, Object>> wasEmp_birth() {
		List<Map<String,Object>> resultList = null;
		try {
			resultList = sqlSessionTemplate.selectList("Emp_birth");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultList;
	}
	// 오늘날짜 구하는 코드
	public String wasTo_day() {
		String result_st = "";
		try {
			result_st = sqlSessionTemplate.selectOne("wasTo_day");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result_st;
	}
	//스케줄 가져오는 코드
	public List<Map<String, Object>> wasMain_schedule(Map<String,Object> pMap) {
		List<Map<String,Object>> resultList = null;
		try {
			resultList = sqlSessionTemplate.selectList("Main_schedule",pMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultList;
	}
	//스케줄 메모 추가
	public void wasMain_schedule_Memo(Map<String, Object> pMap) {
		try {
			sqlSessionTemplate.insert("wasMain_schedule_Memo",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Map<String, Object>> wasSearch_mem(Map<String, Object> pMap) {
		List<Map<String,Object>> resultList = null;
		try {
			resultList = sqlSessionTemplate.selectList("wasSearch_mem",pMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultList;
	}
}
