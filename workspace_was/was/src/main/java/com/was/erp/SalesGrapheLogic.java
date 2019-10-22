package com.was.erp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SalesGrapheLogic {
	private static final Logger logger = LoggerFactory.getLogger(SalesGrapheLogic.class);
	@Autowired
	SalesGraphDao salesDao;
	public List<Map<String, Object>> salesMainSelect(Map<String, Object> pMap) {
		logger.info("Logic salesMainSelect =======");
		//현재 달 구하기
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String today1  = date.format(cal.getTime());
		//현재 달부터 6달전까지 집어넣을 array
		String[] day1 = new String[6];
		//현재 달은 0번
		day1[0] = today1;
		for(int i=1;i<6;i++) {
			cal.add(Calendar.MONTH, -1);
			day1[i]  = date.format(cal.getTime());		
			//logger.info("외로운 날짜 혼자선 심심해"+day1[i]);//값 확인용
		}
		String[] day2 = new String[6];
		String[] gYear = new String[6];
		String[] gMonth = new String[6];
		//모든 날짜를 각각 년도와 월로 나누는 작업
		for(int i=0;i<day1.length;i++) {
			day2= day1[i].split("-");
			gYear[i] = day2[0];
			gMonth[i]= day2[1];
		}
		//logger.info("아침 해가 빛나는 끝"+gYear[5]+", "+gMonth[0]); //확인용
		//쿼리문에서 사용될 현재 달과 현재 달-6 값 넣기
		pMap.put("gYear0", gYear[0]);
		pMap.put("gYear1", gYear[1]);
		pMap.put("gYear2", gYear[2]);
		pMap.put("gYear3", gYear[3]);
		pMap.put("gYear4", gYear[4]);
		pMap.put("gYear5", gYear[5]);
		pMap.put("gMonth0", gMonth[0]);
		pMap.put("gMonth1", gMonth[1]);
		pMap.put("gMonth2", gMonth[2]);
		pMap.put("gMonth3", gMonth[3]);
		pMap.put("gMonth4", gMonth[4]);
		pMap.put("gMonth5", gMonth[5]);

		logger.info("안녕하십니까, 이 모든 것은 우리가 함께 유지해야할 유산입니다."+pMap.get("gYear3").toString());//값 확인용
		List<Map<String,Object>> sList = salesDao.salesMainSelect(pMap);

		return sList;
	}
}
