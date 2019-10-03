package com.was.erp;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductLogic {
	private static final Logger logger = LoggerFactory.getLogger(ProductLogic.class);
	@Autowired
	ProductDao productDao;
	
	public void productShipIn(Map<String, Object> pMap) {
		productDao.productShipIn(pMap);
		
	}

	public void productShipOut(Map<String, Object> pMap) {
		productDao.productShipOut(pMap);
		
	}

	public void productInsert(Map<String, Object> pMap) {
		logger.info("productInsert 호출 성공");
		double pd_weight = 0;
		if(pMap.get("pd_weight")!=null) {//화면 input태그에 name속성에 없어서 널포 일어날 수 있는 것을 방지 or 그 전에 화면에서 hidden속성으로 넘겨주면 널포 당할 일 없다.
			logger.info("pd_weight : "+pMap.get("pd_weight").toString());
			pd_weight = Double.parseDouble(pMap.get("pd_weight").toString());
		}
		logger.info("pd_weight : "+pd_weight);
		pMap.put("pd_weight", pd_weight);//채번한 것을 넘김
		productDao.productInsert(pMap);
		
	}

	public List<Map<String, Object>> productList(Map<String, Object> pMap) {
		logger.info("productList 호출 성공");
		List<Map<String,Object>> rList = productDao.productList(pMap);
		logger.info(rList.get(0).toString());
		return rList;
	}

	public List<Map<String, Object>> productDetail(Map<String, Object> pMap) {
		logger.info("productList 호출 성공");
		List<Map<String,Object>> rList = productDao.productDetail(pMap);
		return rList;
	}
}
