package com.was.erp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class ProductLogic {
	Logger logger = Logger.getLogger(ProductLogic.class);
	ProductDao productDao;
	public ProductLogic() {
		productDao = new ProductDao();
	}
	public List<Map<String, Object>> productInsert(Map<String, Object> pMap) {
		int result = 0;
		Map<String,Object> rMap = new HashMap<>();
		List<Map<String,Object>> rList = new ArrayList<>();
		result = productDao.productInsert(pMap);
		if(result==1) {
			String msg ="등록성공";
			rMap.put("msg", msg);
			rList.add(rMap);
		}else if(result==0) {
			String msg ="등록실패";
			rMap.put("msg", msg);
			rList.add(rMap);
		}
		return rList;
	}
	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		List<Map<String,Object>> rList = new ArrayList<>();
		rList = productDao.productList(pMap);
		return rList;
	}

	public List<Map<String, Object>> productShipOut(Map<String, Object> pMap) {
		Map<String,Object> rMap = new HashMap<>();
		List<Map<String,Object>> rList = new ArrayList<>();
		productDao.productShipOut(pMap);
		return rList;
	}
	public List<Map<String, Object>> productShipIn(Map<String, Object> pMap) {
		Map<String,Object> rMap = new HashMap<>();
		List<Map<String,Object>> rList = new ArrayList<>();
		productDao.productShipIn(pMap);
		return rList;
	}
}
