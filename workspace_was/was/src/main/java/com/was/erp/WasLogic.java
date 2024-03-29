﻿package com.was.erp;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.util.Encryption;

@Service
public class WasLogic {
	private static final Logger logger = LoggerFactory.getLogger(WasLogic.class);
	@Autowired
	WasDao wasDao;
	
	public void wasLogin(Map<String, Object> pMap) {
		Encryption et = new Encryption();
		logger.info("wasLogin:::::::::::::::::::"+pMap.get("firstLogin"));
		logger.info("건들이기 전 sid :"+pMap.get("session_no"));
		if(pMap.get("firstLogin")!=null) {
			pMap.put("login_gubun","first");
		}
		else {
			pMap.put("login_gubun","no_first");
		}
		
		if(pMap.get("postHandle")!=null) { 
			wasDao = new WasDao(); 
		}
		wasDao.wasLogin(pMap);
		String emp_name = pMap.get("msg").toString();
		if(!"존재하지 않는 사원코드입니다..".equals(emp_name)&&!"비밀번호를 다시 확인하세요".equals(emp_name))  {
			//첫 로그인일때만 타는 if문
			if(pMap.get("firstLogin")!=null) {
				//암호화처리할 때 더미값을 넣을 index위치를 사원의 생일날자를 이용하기위해
				//DB에서 사원의 생일날자를 땡겨오는로직.
				String dumyIndex = wasDao.dumyIndex(pMap.get("empno").toString()).substring(4, 6);
				//세션아이디를 DB에 담기 전에 암호화처리. 
				String dumy_session = et.encryption(pMap.get("session_no").toString(), dumyIndex);
				pMap.put("session_no", dumy_session); 
				//세션이 생성 돼는 즉 첫번째 로그인일때만 DB에 세션아이디를 업데이트 해야 하기 때문에
				//index.jsp에서 로그인할때만 request에 firstLogin속성이 담겨있다.
				wasDao.firstLogin(pMap);
			}
			else {
				logger.info("n번의 로그인인 경우 :"+pMap.get("empno"));
				Map<String,Object> dumy_session = wasDao.checkLogin(pMap);
				String origin_session = et.decryption(dumy_session);
				if(!origin_session.equals(pMap.get("session_no").toString())) {
					logger.info("세션아이디가 다를 경우");
					logger.info("복호화 sid :"+origin_session);
					logger.info("현재 접속 sid :"+pMap.get("session_no").toString());
					pMap.put("emp_name", "기존 아이디로 새로운 접속이 감지되었습니다.");
					return;
				}
			}
		}
		pMap.put("emp_name", emp_name);
	}

	public List<Map<String, Object>> wasEmpStatus(Map<String, Object> pMap) {
		List<Map<String, Object>> rList = new ArrayList<>();
		//if calendar_bungi는 첫 달력 호출인지 아니면 달력이 호출 된 뒤인지 분기하기 위함이다.
		if(pMap.get("calendar_bungi")!=null) {
			List<Map<String, Object>> statusList = wasDao.wasEmpStatus(pMap);
				//상태정보를 담을 맵을 선언
				Map<String,Object> statusMap = null;
				//받아온 값은 날짜 형식이 YYYY-MM-DD이다 이 중 필요한 요소는
				//DD뿐이라 형식을 바꿔서 Map에 담아줘야 한다.
				for(Map<String,Object> rMap :statusList) {
					statusMap = new HashMap<>();
					Object[] keys = rMap.keySet().toArray();
					for(Object key : keys) {
						if("STATUS_NAME".equals(key.toString())) {
							if("출근".equals(rMap.get("STATUS_NAME"))) {
								//출근일 때 는 enddate가 필요없다.
								String needDay = rMap.get("STATUS_STARTDATE").toString();
								//지금 needDay는 yyyy-mm-dd/시간 의 형식이라 dd만 잘라내야 한다.
								String[] splits = needDay.split("/");
								StringTokenizer st = new StringTokenizer(splits[0],"-");
								st.nextToken();
								st.nextToken();
								String dd = st.nextToken();
								statusMap.put("STATUS_DAY", dd);
							}
							//출근 이외의 STATUS_NAME의 값은 여기에 입력
						}else {
							statusMap.put(key.toString(), rMap.get(key.toString()));
						}
					}
					rList.add(statusMap);
					logger.info("return하기전 rList:::::::::::"+rList);
					statusMap = null;
				}
				List<Map<String, Object>> noteList = wasDao.wasEmpStatusNoteList(pMap);
				//노트정보를 담을 맵을 선언
				Map<String,Object> noteMap = null;
				for(Map<String,Object> rMap : noteList) {
					noteMap = new HashMap<>();
					Object[] keys = rMap.keySet().toArray();
					for(Object key : keys) {
						if("NOTE_WRITE_DATE".equals(key.toString())) {
								//출근일 때 는 enddate가 필요없다.
								String needDay = rMap.get("NOTE_WRITE_DATE").toString();
								StringTokenizer st = new StringTokenizer(needDay,"-");
								st.nextToken();
								st.nextToken();
								String dd = st.nextToken();
								noteMap.put("NOTE_DAY", dd);
						}else {
							noteMap.put(key.toString(), rMap.get(key.toString()));
							logger.info("resultMap:::::::::"+noteMap.get(key.toString()));
						}
					}
					rList.add(noteMap);
					noteMap = null;	
				}
		}else {
			//if bungi_month는 달력이 호출 된 뒤 전달 다음달 호출인지 분기하기 위함이다.
			if(pMap.get("bungi_month")!=null) {
				int i_month = Integer.parseInt(pMap.get("empStatus_month").toString());
				if("prev".equals(pMap.get("bungi_month"))) {
					if(i_month==1) {
						i_month = 12;
						String month =  String.valueOf(i_month);
						pMap.put("empStatus_month", month);
						int i_year = Integer.parseInt(pMap.get("empStatus_year").toString());
						i_year = i_year-1;
						String year = String.valueOf(i_year);
						pMap.put("empStatus_year", year);
					}else {
						i_month = i_month-1;
						String month =  String.valueOf(i_month);
						pMap.put("empStatus_month", month);
					}
				}else if("next".equals(pMap.get("bungi_month"))) {
					if(i_month==12) {
						i_month = 1;
						String month =  String.valueOf(i_month);
						pMap.put("empStatus_month", month);
						int i_year = Integer.parseInt(pMap.get("empStatus_year").toString());
						i_year = i_year+1;
						String year = String.valueOf(i_year);
						pMap.put("empStatus_year", year);
					}
					else {
						i_month = i_month+1;
						String month =  String.valueOf(i_month);
						pMap.put("empStatus_month", month);
					}
				}
			}
			else if(pMap.get("bungi_year")!=null){
				int i_year = Integer.parseInt(pMap.get("empStatus_year").toString());
				if("prev".equals(pMap.get("bungi_year"))) {
					i_year = i_year-1;
					String year = String.valueOf(i_year);
					pMap.put("empStatus_year", year);
				}else if("next".equals(pMap.get("bungi_year"))){
					i_year = i_year+1;
					String year = String.valueOf(i_year);
					pMap.put("empStatus_year", year);
				}
			}
			List<Map<String, Object>> result = wasDao.wasEmpStatus(pMap);
			////////////받아온 값을 화면에서 쓰기 편하게 바꾼다.////////////
				Map<String,Object> resultMap = null;
				for(Map<String,Object> rMap :result) {
					resultMap = new HashMap<>();
					Object[] keys = rMap.keySet().toArray();
					for(Object key : keys) {
						if("STATUS_NAME".equals(key.toString())) {
							if("출근".equals(rMap.get("STATUS_NAME"))) {
								//출근일 때 는 enddate가 필요없다.
								String needDay = rMap.get("STATUS_STARTDATE").toString();
								//지금 needDay는 yyyy-mm-dd/시간 의 형식이라 dd만 잘라내야 한다.
								String[] splits = needDay.split("/");
								StringTokenizer st = new StringTokenizer(splits[0],"-");
								st.nextToken();
								st.nextToken();
								String dd = st.nextToken();
								resultMap.put("STATUS_DAY", dd);
							}
							//출근 이외의 STATUS_NAME의 값은 여기에 입력
							
						}else {
							resultMap.put(key.toString(), rMap.get(key.toString()));
							logger.info("resultMap:::::::::"+resultMap.get(key.toString()));
						}
					}
					rList.add(resultMap);
					resultMap = null;
				}
				List<Map<String, Object>> noteList = wasDao.wasEmpStatusNoteList(pMap);
				//노트정보를 담을 맵을 선언
				Map<String,Object> noteMap = null;
				for(Map<String,Object> rMap : noteList) {
					noteMap = new HashMap<>();
					Object[] keys = rMap.keySet().toArray();
					for(Object key : keys) {
						if("NOTE_WRITE_DATE".equals(key.toString())) {
								//출근일 때 는 enddate가 필요없다.
								String needDay = rMap.get("NOTE_WRITE_DATE").toString();
								StringTokenizer st = new StringTokenizer(needDay,"-");
								st.nextToken();
								st.nextToken();
								String dd = st.nextToken();
								noteMap.put("NOTE_DAY", dd);
						}else {
							noteMap.put(key.toString(), rMap.get(key.toString()));
							logger.info("resultMap:::::::::"+noteMap.get(key.toString()));
						}
					}
					rList.add(noteMap);
					noteMap = null;	
				}
		}
		rList.add(pMap);
		logger.info("return하기전 rList:::::::::::"+rList);
		return rList;
		
	}

	public List<Map<String, Object>> wasEmpStatusNoteList(Map<String, Object> pMap) {
		List<Map<String, Object>> result = wasDao.wasEmpStatusNoteList(pMap);
		return result;
	}

	public List<Map<String, Object>> wasEmpStatusNoteDetail(Map<String, Object> pMap) {
		logger.info("wasEmpStatusNoteDetail Logic타는중~~~~~~~~~~~~~~~~~~~~~");
		List<Map<String, Object>> result = wasDao.wasEmpStatusNoteDetail(pMap);
		return result;
	}

	public List<Map<String, Object>> wasEmpStatusNoteInsert(Map<String, Object> pMap) {
		int result = wasDao.wasEmpStatusNoteInsert(pMap);
		List<Map<String, Object>> rList = new ArrayList<>();
		Map<String,Object> rMap = new HashMap<>();
		String insertResult = null;
		//인설트 성공
		if(1==result) {
			insertResult = "정상적으로 등록되었습니다.";
		}else {
			insertResult = "다시 시도하세요.";
		}
		rMap.put("noteInsertResult", insertResult);
		rList.add(rMap);
		Gson gs = new Gson();
		String gString = gs.toJson(rList);
		List<Map<String,Object>> gList = new ArrayList<>();
		Map<String,Object> gMap = new HashMap<>();
		gMap.put("gson", gString);
		gList.add(gMap);
		logger.info("gList return보내기 직전 :::"+gList);
		return gList;
	}

	public List<Map<String,Object>> wasEmpAttendance(Map<String, Object> pMap) {
		List<Map<String,Object>> result = wasDao.wasEmpAttendance(pMap);
		List<Map<String,Object>> rList = new ArrayList<>();
		Map<String,Object> resultMap = result.get(0);
		Map<String,Object> rMap = new HashMap<>();
		String msg = resultMap.get("msg").toString();
		//+가 응답문자에 들어가 있을 때 즉 출석체크 해서 시간도 보여주려고 할 때
		if(msg.indexOf("+")>-1) {
			logger.info("+가 있음~+++++++++++++++++++++++++++++++++++++++");
			StringTokenizer st = new StringTokenizer(msg,"+");
			String mrdate = st.nextToken();
			String mresult = st.nextToken();
			resultMap.put("rdate", mrdate);
			resultMap.put("result", mresult);
			rList.add(resultMap);
		}else {//+가 응답문자에 없을 때 즉 이미 출석체크 했다고 결과만 보여줄 때
			logger.info("+가 없음~++++++++++++++++++++++++++++++++++++++++");
			resultMap.put("rdate", " ");
			resultMap.put("result", result.get(0).get("msg"));
			rList.add(resultMap);
		}
		return rList;
	}

	public String wasEmpStatusNoteDelete(Map<String, Object> pMap) {
		logger.info("wasEmpStatusNoteDelete Logic타는중~~~~~~~~~~~~~~~~~~~~~");
		if(pMap.get("note_no").toString().contains("^")) {
			logger.info("^를 찾음 ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ");
			String param = pMap.get("note_no").toString();
			String params[] = null;
			pMap.remove("note_no");
			StringTokenizer st = new StringTokenizer(param,"^");
			params = new String[st.countTokens()];
			int count = 0;
			String token = "";
			while(st.hasMoreTokens()) {
				token = st.nextToken();
				if(!"".equals(token)) {
				params[count] = token;
				count++;
				}
				token = "";
			}
			pMap.put("note_nos", params);
		}
		String result = null;
		int rint = 0;
		rint = wasDao.wasEmpStatusNoteDelete(pMap);
		if(rint!=0) {
			result = "삭제되었습니다.";
		}else {
			result = "다시시도하세요.";
		}
		return result;
	}

	public List<Map<String,Object>> wasMainChart(Map<String, Object> pMap) {
		//////////////////6개월구하기/////////////////
		DecimalFormat df = new DecimalFormat("00");
		Calendar currCal = Calendar.getInstance();
		//////////////////현재날자///////////////////
		String df_month = df.format(currCal.get(Calendar.MONTH)+1);
		String df_year = df.format(currCal.get(Calendar.YEAR));
		//////////////////현재날자//////////////////
		pMap.put("mcMonth", df_month);
		pMap.put("mcYear", df_year);
		//////////////////나머지5달/////////////////
		String df_lastyear = null;
		String df_lastmonth = null;
		int imonth = Integer.parseInt(df_month);
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
				df_lastyear = df.format(currCal.get(Calendar.YEAR));
				df_lastmonth = df.format(imonth-(i+1));
			}
			pMap.put("mcMonth"+j, df_lastmonth);
			pMap.put("mcYear"+j, df_lastyear);
			j++;
		}
		//////////////////나머지5달/////////////////
		//////////////////6개월구하기/////////////////
		List<Map<String,Object>> result = wasDao.wasMainChart(pMap);
		return result;
	}
	//퇴직금 : 직근 3개월 평균 비용 구하기
	public String wasAvgofSal(Map<String, Object> pMap) {
		String avgofSal = wasDao.wasAvgofSal(pMap);
		return avgofSal;
	}
	//생일자 구하는 로직
	public String wasEmp_birth(String gubun) {
		String result_st = "";
		StringBuilder result = new StringBuilder();
		if("birth".equals(gubun)) {
		List<Map<String,Object>> r_list = wasDao.wasEmp_birth();
			for(int i=0;i<r_list.size();i++) {
				Map<String,Object> r_Map = r_list.get(i);
				//총무1팀 홍길동(10.3),배송 1팀 배성우(10.12)
				result.append(r_Map.get("TEAM_NAME").toString()+"&nbsp;");
				result.append(r_Map.get("EMP_NAME").toString()+"님(");
				result.append(r_Map.get("BIRTH_MONTH").toString()+".");
				result.append(r_Map.get("BIRTH_DAY").toString()+")&nbsp;");
			}
			result_st = result.toString();
		}else if("to_day".equals(gubun)) {
			String imsi_result_st = wasDao.wasTo_day();
			result_st = imsi_result_st.substring(0, 4)+"년"+imsi_result_st.substring(4, 6)+"월"+imsi_result_st.substring(6, 8)+"일";
		}
		return result_st;
	}

	public List<Map<String, Object>> wasMain_schedule(Map<String,Object> pMap) {
		List<Map<String,Object>> rList = wasDao.wasMain_schedule(pMap);
		return rList;
	}

	public void wasMain_schedule_Memo(Map<String, Object> pMap) {
		wasDao.wasMain_schedule_Memo(pMap);
	}

	public List<Map<String, Object>> wasSearch_mem(Map<String, Object> pMap) {
		if("chongmu_1team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","총무1팀");
		}else if("chongmu_2team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","총무2팀");
		}else if("chongmu_3team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","총무3팀");
		}else if("insa_1team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","인사1팀");
		}else if("insa_2team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","인사2팀");
		}else if("insa_3team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","인사3팀");
		}else if("beasong_1team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","배송1팀");
		}else if("beasong_2team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","배송2팀");
		}else if("beasong_3team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","배송3팀");
		}else if("prod_1team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","생산1팀");
		}else if("prod_2team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","생산2팀");
		}else if("prod_3team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","생산3팀");
		}else if("sales_1team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","영업1팀");
		}else if("sales_2team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","영업2팀");
		}else if("sales_3team".equals(pMap.get("team_name").toString())) {
			pMap.put("team_name","영업3팀");
		}
		List<Map<String,Object>> rList = wasDao.wasSearch_mem(pMap);
		return rList;
	}
}
