package com.was.erp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.util.MybatisCommonFactory;

public class ProductDao {
	Logger logger = Logger.getLogger(ProductDao.class);
	SqlSessionFactory sqlSessionFactory;
	SqlSession sqlSession;
	public ProductDao() {
		sqlSessionFactory = MybatisCommonFactory.getSqlSeesionFactory();
	}
	public int productInsert(Map<String, Object> pMap) {
		int result = 0;
		try {
			sqlSession = sqlSessionFactory.openSession();
			result = sqlSession.update("productInsert", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		logger.info("productList:::::::::::sql문실행전:::::::::::::");
		List<Map<String,Object>> rList = new ArrayList<>();
		try {
			sqlSession = sqlSessionFactory.openSession();
			rList = sqlSession.selectList("productList", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		logger.info("productList:::::::::::sql문실행후:::::::::::::");
		return rList;
	}
	public void productShipOut(Map<String, Object> pMap) {
		pMap.put("msg", "");
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("productShipOut", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
	}
	public void productShipIn(Map<String, Object> pMap) {
		pMap.put("msg", "");
		try {
			sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("productShipIn", pMap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
	}
}
