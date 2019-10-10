package com.was.erp;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
	
	public int get_Total(Map<String, Object> pMap) {
		logger.info("get_total호출성공");
		int tot = productDao.get_Total(pMap);
		return tot;
	}

	public List<Map<String, Object>> productList(Map<String, Object> pMap, int tot) {
		logger.info("Logic-productList 호출 성공");
		int nowPage = 1;//현재 페이지
		if(pMap.get("nowPage")!=null) {
			nowPage = Integer.parseInt(pMap.get("nowPage").toString())+1;
		}
		int pagePer_Num = 5;//한페이지에 뿌려질 로우수
		int start = 0;
		int end = 0;
		if(nowPage>0) {
			start = ((nowPage-1)*pagePer_Num)+1;
			end = nowPage * pagePer_Num;
			pMap.put("start",start);
			if(end > tot) {
				pMap.put("end",tot);
			}else {
				pMap.put("end",end);
			}
		}
		logger.info("tot :"+tot);
		logger.info("nowPage :"+nowPage);
		logger.info("start :"+start);
		logger.info("end :"+end);
		List<Map<String,Object>> rList = productDao.productList(pMap);
		return rList;
	}

	public List<Map<String, Object>> productDetail(Map<String, Object> pMap) {
		
		return null;
	}
	public int productInsert(Map<String, Object> pMap) {
		logger.info("productInsert 호출 성공");
		int result = 0;
		try { 
	    	result = productDao.supplyInsert(pMap);
		  }catch (DataAccessException e) { 
			  throw e; 
			  } 
	    return result;		 
	}

	public void productDelete(String[] r_rowid) {
		logger.info("productDelete 호출 성공");
		
		productDao.productDelete(r_rowid);
		
	}


}
