package com.was.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.util.MybatisCommonFactory;

public class WasDao {
	Logger logger = Logger.getLogger(WasDao.class);
	SqlSessionFactory sqlSessionFactory;
	SqlSession sqlSession;
	public WasDao() {
		sqlSessionFactory = MybatisCommonFactory.getSqlSeesionFactory();
	}
	public void wasLogin(Map<String, Object> pMap) {
		logger.info("empno : "+pMap.get("empno"));
		logger.info("emp_pw : "+pMap.get("emp_pw"));
		logger.info("msg : "+pMap.get("msg"));
		logger.info("outtime : "+pMap.get("outtime"));
		logger.info("SQL문::::::::::::시작전:::::::");
		pMap.put("msg", "0");
		pMap.put("outtime", "0");
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.selectOne("wasLogin", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		logger.info("outtime:"+pMap.get("outtime"));
		logger.info("msg : "+pMap.get("msg"));
		logger.info("SQL문::::::::::::끝:::::::");
	}
	public void firstLogin(Map<String, Object> pMap) {
		//여기에서 세션아이디를 업데이트처리한다.
		logger.info("wasDao.firstLogin에 들어왔다!");
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("firstLogin", pMap);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
	}
	public Map<String,Object> checkLogin(Map<String, Object> pMap) {
		String session_no = null;
		String dumy = null;
		//여기에서 세션아이디를 업데이트처리한다.
		logger.info("wasDao.checkLogin에 들어왔다!");
		try {
			sqlSession = sqlSessionFactory.openSession();
			session_no = sqlSession.selectOne("checkLogin", pMap);
			String empno = pMap.get("empno").toString();
			dumy = sqlSession.selectOne("dumyIndex", empno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		String day = dumy.substring(4, 6);
		Map<String,Object> result = new HashMap<>();
		result.put("session_no", session_no);
		result.put("day", day);
		return result;
	}
	public void sessionOut(String sid) {
		//여기에서 세션아이디를 업데이트처리한다.
				logger.info("wasDao.sessionOut에 들어왔다!");
				try {
					sqlSession = sqlSessionFactory.openSession();
					sqlSession.update("sessionOut", sid);
					sqlSession.commit();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					sqlSession.close();
				}
		
	}
	public String dumyIndex(String empno) {
		String result = null;
		//여기에서 세션아이디를 업데이트처리한다.
		logger.info("wasDao.dumyIndex에 들어왔다!");
		try {
			sqlSession = sqlSessionFactory.openSession();
			result = sqlSession.selectOne("dumyIndex", empno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	public List<Map<String, Object>> wasEmpStatus(Map<String, Object> pMap) {
		logger.info("wasDao.wasEmpStatus에 들어왔다!");
		logger.info("pMap::::::::::::::::"+pMap);
		List<Map<String, Object>> result = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			result = sqlSession.selectList("wasEmpStatus", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	public List<Map<String, Object>> wasEmpStatusNoteList(Map<String, Object> pMap) {
		logger.info("wasDao.wasEmpStatusNoteList에 들어왔다!");
		logger.info("pMap::::::::::::::::"+pMap);
		List<Map<String, Object>> result = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			result = sqlSession.selectList("wasEmpStatusNoteList", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	public int wasEmpStatusNoteInsert(Map<String, Object> pMap) {
		logger.info("wasDao.wasEmpStatusNoteInsert에 들어왔다!");
		logger.info("pMap::::::::::::::::"+pMap);
		int result = 0;
		try {
			sqlSession = sqlSessionFactory.openSession();
			result = sqlSession.update("wasEmpStatusNoteInsert", pMap);
			logger.info("result 성공:1 실패:0-->"+result);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	public List<Map<String, Object>> wasEmpStatusNoteDetail(Map<String, Object> pMap) {
		logger.info("wasDao.wasEmpStatusNoteDetail에 들어왔다!");
		logger.info("pMap::::::::::::::::"+pMap);
		List<Map<String, Object>> result = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			result = sqlSession.selectList("wasEmpStatusNoteDetail", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		logger.info("DB탐 noteDetail :::::::"+result);
		return result;
	}
}
