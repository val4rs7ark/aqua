package com.was.erp;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AndroidLogic {
	private static final Logger logger = LoggerFactory.getLogger(WasLogic.class);
	@Autowired
	AndroidDao androidDao;

	public String wasAndroidLogin(Map<String, Object> pMap) {
		androidDao.wasAndroidLogin(pMap);
		String result = pMap.get("msg").toString();
		return result;
	}

	public List<Map<String, Object>> wasAndroidDelivery_List(Map<String, Object> pMap) {
		List<Map<String, Object>> deliveryList = androidDao.deliveryList(pMap);
		return deliveryList;
	}
}
