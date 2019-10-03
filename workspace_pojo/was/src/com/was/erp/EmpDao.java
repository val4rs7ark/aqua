package com.was.erp;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.util.MybatisCommonFactory;

public class EmpDao {
	Logger logger = Logger.getLogger(EmpDao.class);
	SqlSessionFactory sqlSessionFactory;
	SqlSession sqlSession;
	public EmpDao() {
		sqlSessionFactory = MybatisCommonFactory.getSqlSeesionFactory();
	}
	
	public void empSignUp(Map<String, Object> pMap) {
		pMap.put("msg", "0");
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.selectOne("empSignUp", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
}
