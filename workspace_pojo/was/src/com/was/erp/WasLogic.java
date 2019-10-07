package com.was.erp;
//190925
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.util.Encryption;
import com.util.HangulConversion;

public class WasLogic {
	private static final Map<String, Object> rMap = null;
	Logger logger = Logger.getLogger(WasLogic.class);
	WasDao wasDao;
	public WasLogic() {
		wasDao = new WasDao();
	}
	public List<Map<String, Object>> wasLogin(Map<String, Object> pMap) {
		Encryption et = new Encryption();
		logger.info("wasLogin:::::::::::::::::::"+pMap.get("firstLogin"));
		wasDao.wasLogin(pMap);
		String emp_name = pMap.get("msg").toString();
		if(!"존재하지 않는 사원코드입니다..".equals(emp_name)&&!"비밀번호를 다시 확인하세요".equals(emp_name))  {
			//첫 로그인일때만 타는 if문
			if("1".equals(pMap.get("firstLogin").toString())) {
				//암호화처리할 때 더미값이 고정인 점을 보완하기 위해 더미값에 사원의 생일날자를 더하기 위해
				//DB에서 사원의 생일날자를 땡겨오는로직.
				String dumyIndex = wasDao.dumyIndex(pMap.get("empno").toString()).substring(4, 6);
				//세션아이디를 DB에 담기 전에 암호화처리. 
				String dumy_session = et.encryption(pMap.get("session_no").toString(), dumyIndex);
				pMap.put("session_no", dumy_session); 
				//세션이 생성 돼는 즉 첫번째 로그인일때만 DB에 세션아이디를 업데이트 해야 하기 때문에
				//index.jsp에서 로그인할때만 request에 firstLogin속성이 담겨있다.
				wasDao.firstLogin(pMap);
			}else {	//첫 로그인이 아닌 경우
				logger.info("n번의 로그인인 경우 :"+pMap.get("empno"));
				Map<String,Object> dumy_session = wasDao.checkLogin(pMap);
				String origin_session = et.decryption(dumy_session);
				if(!origin_session.equals(pMap.get("session_no").toString())) {
					List<Map<String,Object>> rList = new ArrayList<>();
					pMap.put("emp_name", "기존 아이디로 새로운 접속이 감지되었습니다.");
					rList.add(pMap);
					return rList;
				}
			}
		}
		List<Map<String,Object>> rList = new ArrayList<>();
		if(pMap.get("msg") != null) {
			Map<String, Object> rMap = new HashMap<>();
			rMap.put("emp_name", pMap.get("msg"));
			rMap.put("outtime", pMap.get("outtime"));
			rMap.put("empno", pMap.get("empno"));
			rMap.put("emp_pw", pMap.get("emp_pw"));
			rList.add(rMap);
		}
		return rList;
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
	public List<Map<String, Object>> wasEmpStatusNoteDetail(Map<String, Object> pMap) {
		logger.info("wasEmpStatusNoteDetail Logic타는중~~~~~~~~~~~~~~~~~~~~~");
		List<Map<String, Object>> result = wasDao.wasEmpStatusNoteDetail(pMap);
		return result;
	}
}
