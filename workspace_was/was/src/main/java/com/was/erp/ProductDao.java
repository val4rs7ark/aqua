package com.was.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
	public void productInsert(Map<String, Object> pMap) {
		logger.info("productInsert 호출 성공");
		sqlSessionTemplate.selectOne("productInsert",pMap);

	}
	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		logger.info("productList 호출 성공");
		List<Map<String,Object>> rList
			= sqlSessionTemplate.selectList("productList",pMap);
		return rList;
	}
	public List<Map<String, Object>> productDetail(Map<String, Object> pMap) {
		logger.info("productDetail 호출 성공");
		List<Map<String,Object>> rList
			= sqlSessionTemplate.selectList("productDetail",pMap);
		return rList;
	}
}
