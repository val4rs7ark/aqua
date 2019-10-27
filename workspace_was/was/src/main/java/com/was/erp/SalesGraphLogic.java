package com.was.erp;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SalesGraphLogic {
	private static final Logger logger = LoggerFactory.getLogger(SalesGraphLogic.class);
	@Autowired
	SalesGraphDao salesDao;
	///////////////////////////////////   매출현황 메인 페이지 그래프        ////////////////////////////////
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
	public List<Map<String, Object>> salesYear(Map<String, Object> pMap) {
		logger.info("Logic salesSelectYear =======");
		//쿼리문에 넣을 월 담을 변수
		int[] gMonth = new int[13];
		//모든 날짜를 각각 년도와 월로 나누는 작업
		for(int i=1;i<13;i++) {
				gMonth[i]= i;
		}
		pMap.put("gMonth1", gMonth[1]);
		pMap.put("gMonth2", gMonth[2]);
		pMap.put("gMonth3", gMonth[3]);
		pMap.put("gMonth4", gMonth[4]);
		pMap.put("gMonth5", gMonth[5]);
		pMap.put("gMonth6", gMonth[6]);
		pMap.put("gMonth7", gMonth[7]);
		pMap.put("gMonth8", gMonth[8]);
		pMap.put("gMonth9", gMonth[9]);
		pMap.put("gMonth10", gMonth[10]);
		pMap.put("gMonth11", gMonth[11]);
		pMap.put("gMonth12", gMonth[12]);
		
		logger.info("하루하루 멀어져 간다. "+pMap.get("today_year").toString());
		logger.info("하루하루 멀어져 간다. "+pMap.get("gMonth1").toString());
		logger.info("하루하루 멀어져 간다. "+pMap.get("gMonth12").toString());
		List<Map<String,Object>> sList = salesDao.salesYear(pMap);
		return sList;
	}
	///////////////////////////////////   매출현황 그래프 선택 조회 (< 금월  >)        ////////////////////////////////
	public List<Map<String, Object>> salesSelectMonth(Map<String, Object> pMap) {
		int imsiMonth = Integer.parseInt(pMap.get("today_month").toString());
		if(imsiMonth<10) {
			String stringMonth = "0"+imsiMonth;
			pMap.put("today_month", stringMonth);
		}
		logger.info("salesSelectMonth ============  매출현황 월별 그래프 선택 조회 (< 금월  >)");
		logger.info("가져온 값들 : today_year : "+ pMap.get("today_year").toString());
		logger.info("가져온 값들은 : today_month : "+pMap.get("today_month").toString());
		String today_year =pMap.get("today_year").toString();
		String today_month = pMap.get("today_month").toString();
		//////////////////6개월구하기/////////////////
		DecimalFormat df = new DecimalFormat("00");
		Calendar currCal = Calendar.getInstance();
		//////////////////현재날자//////////////////
		pMap.put("gYear0", today_year);
		pMap.put("gMonth0", today_month);
		//////////////////나머지5달/////////////////
		String df_lastyear = null;
		String df_lastmonth = null;
		int imonth = Integer.parseInt(today_month);
		int j = 1;
		for(int i=0;i<5;i++) {
			//1월보다 낮다면 이전년도로 바꿔야 하기에 분기
			if(imonth-(i+1)<1) {
				df_lastyear = df.format(currCal.get(Calendar.YEAR)-1);
				//이전달이 1월보다 더 전이고 그 차이가 0보다 클 때
				if((0-(imonth-(i+1)))>0) {
					df_lastmonth = 12-(0-(imonth-(i+1)))+"";
				//이전달이 1월보다 전이고 그차이가 0일 때 == 12월	
				}else {
					df_lastmonth = "12";
				}
			}else {
				df_lastyear = today_year;
				df_lastmonth = df.format(imonth-(i+1));
			}
			pMap.put("gMonth"+j, df_lastmonth);
			pMap.put("gYear"+j, df_lastyear);
			j++;
		}
		List<Map<String,Object>> sList = salesDao.salesSelectMonth(pMap);

		return sList;
	}
	
	///////////////////////////////////   월별 그래프 기간 선택 조회       ////////////////////////////////
	public List<Map<String, Object>> salesTwoSelect(Map<String, Object> pMap) {
		logger.info("salesTwoSelect ============  월별 기간 선택 그래프 Logic");
		String today_1 = pMap.get("today_1").toString();
		String today_2 = pMap.get("today_2").toString();
		String today1[] = today_1.split("-");
		String today2[] = today_2.split("-");
		int todays1 = Integer.parseInt(today1[1]);
		int todays2 = Integer.parseInt(today2[1]);
		String sMonth[] = null;
		Map<String,Object> countMap = new HashMap<>();
		if(today1[0]==today2[0]) {// 가져온 두 기간의 년도가 같으면
			for(int i=todays1+1;i<todays2;i++) {
				sMonth[i] = Integer.toString(i);
			}
			
		}else {// 가져온 기간의 년도가 다르면
			int first_count = 0;
			int second_count = 0;
			for(int i=todays1+1;i<13;i++) {
				logger.info("첫번째 포문");
				countMap.put("smonth"+first_count, today1[0]+"^"+(todays1+(first_count+1)));
				first_count++;
			}
			if(todays2==1) {
				
			}else {
				for(int j=todays2-1;j>0;j--) {
					logger.info("두번째 포문");
					if(first_count==1&&second_count==0) {
						countMap.put("smonth"+(first_count+(second_count)), today2[0]+"^"+(todays2-(second_count+1)));
					}
					countMap.put("smonth"+(first_count+(second_count+1)), today2[0]+"^"+(todays2-(second_count+1)));
					second_count ++;
				}	
			}
			int count = countMap.size();
			int resultCount = first_count+second_count;
			Object[] keys = countMap.keySet().toArray();
			for(int i =0;i<countMap.size();i++) {
				String imsi = countMap.get("smonth"+i).toString();
				StringTokenizer st = new StringTokenizer(imsi,"^");
				countMap.put("syear"+i, st.nextToken());
				countMap.put("smonth"+i, st.nextToken());
			}
			countMap.put("syear_first"+count, today1[0]);
			countMap.put("smonth_first"+count, todays1);
			countMap.put("syear_end", today2[0]);
			countMap.put("smonth_end", todays2);
			List<String> yearList = new ArrayList<>();
			List<String> monthList = new ArrayList<>();
			for(int i = 0;i<count;i++) {
			yearList.add(countMap.get("syear"+i).toString());
			monthList.add(countMap.get("smonth"+i).toString());
			}
			pMap.put("syear_first", countMap.get("syear_first").toString());
			pMap.put("smonth_first", countMap.get("smonth_first").toString());
			pMap.put("syear_end", countMap.get("syear_end").toString());
			pMap.put("smonth_end", countMap.get("smonth_end").toString());
			pMap.put("yearList", yearList);
			pMap.put("monthList", monthList);
			
			
		}
		List<Map<String,Object>> sList = salesDao.salesTwoSelect(pMap);
		return sList;
	}
}







 