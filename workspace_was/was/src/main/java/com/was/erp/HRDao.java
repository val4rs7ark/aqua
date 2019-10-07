package com.was.erp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HRDao {
	Logger logger = LoggerFactory.getLogger(HRController.class);
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate = null;
	
	public List<Map<String, Object>> HRSalery_insert() {
		logger.info("HRSalery_insert//////////////////Dao");
		List<Map<String, Object>> r_list = null;
		try {
			r_list = sqlSessionTemplate.selectList("HRSalery_insert");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r_list;
	}

}
