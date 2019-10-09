package com.was.erp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

@Service
public class ProductDao {
	private static final Logger logger = LoggerFactory.getLogger(ProductLogic.class);
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void productShipIn(Map<String, Object> pMap) {
		pMap.put("msg", "");
		sqlSessionTemplate.selectOne("productShipIn", pMap);
	}
	public void productShipOut(Map<String, Object> pMap) {
		pMap.put("msg", "");
		sqlSessionTemplate.selectOne("productShipOut",pMap);
		
	}
	public int get_Total(Map<String, Object> pMap) {
		logger.info("get_total 호출 성공");
		int tot = 0;
		try {
			tot = sqlSessionTemplate.selectOne("get_Total",pMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tot;
	}
	public void productInsert(Map<String, Object> pMap) {
		logger.info("productInsert 호출 성공");
		sqlSessionTemplate.selectOne("productInsert",pMap);

	}
	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		 logger.info("productList 호출 성공"); 
		  List<Map<String,Object>> rList = null;
		  try {
			  rList = sqlSessionTemplate.selectList("productList",pMap); 
			  logger.info("rList size:"+rList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		  return rList; 
	}
	public List<Map<String, Object>> productDetail(Map<String, Object> pMap) {
		
		return null;
	}
	public int supplyInsert(Map<String,Object> pMap) throws DataAccessException{
		logger.info("supplyInsert 호출 성공");
		int result = 0;
		try {
			result = sqlSessionTemplate.insert("supplyInsert",pMap);
			logger.info("result:"+result);
		} catch (DataAccessException e) {
			throw e;
		}
		return result;
	}
	public void productDelete(String[] r_rowid) {
		logger.info("productDelete 호출 성공");
		List<String> list = new ArrayList<>();//integer형 list 변수 선언 
		for(int i=0;i<r_rowid.length;i++) {//[2],[3],[5]
			list.add(r_rowid[i]);
		}
		try {
			sqlSessionTemplate.delete("productDelete",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
