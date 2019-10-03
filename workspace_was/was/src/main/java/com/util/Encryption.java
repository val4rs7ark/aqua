package com.util;

import java.time.LocalDateTime;
import java.time.temporal.ChronoField;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class Encryption {
	Logger logger = LoggerFactory.getLogger(Encryption.class);
	//세션아이디 와 암호화 로직을 위해 생일날자(DD)를 파라미터로 받아온다.
	public String encryption(String sid, String day) {
		//////////////////긴 껍데기값 추출///////////////////
		String dumy = "";
		for (char chars : Protocol.PART.toCharArray()) {
			dumy = dumy+Character.getNumericValue(chars);
		}
		//받아온 날짜를 더미값에 추가
		dumy = dumy+day;
		///////////////////////////////////////////////
		////////////////현재시간 밀리세컨드를 2개의 인덱스로 활용//////////
		LocalDateTime now = LocalDateTime.now();
		int millis = now.get(ChronoField.MILLI_OF_SECOND);
		String ms = millis+"";
		if(ms.length()>1) {
			ms = ms.substring(0, 2);
		}
		else if(ms.length()==1) {
			ms = ms+ms;
		}
		if(ms.indexOf("0")>-1) {
			int index = ms.indexOf("0");
			StringBuilder sb = new StringBuilder(ms);
			Random random = new Random();
			int col = 0;
			boolean tru = true;
			while(tru) {
				col = random.nextInt(10);
				if(col>0) {
					tru = false;
				}
			}
			sb.insert(index, col+"");
			ms = sb.toString().substring(0, 2);
		}
		StringBuffer sbday = new StringBuffer(ms);
		sbday.insert(1, "-");
		StringTokenizer st = new StringTokenizer(sbday.toString(),"-");
		int tokenDay1 = Integer.parseInt(st.nextToken());
		int tokenDay2 = Integer.parseInt(st.nextToken());
		////////////////////////////////////////////////
		StringBuffer remote = new StringBuffer(sid);
		remote.insert(tokenDay1, dumy);
		remote.insert(tokenDay2, dumy);
		String result = remote.toString();
		return result;
	}
	//암호화 되어버린 세션아이디를 분해작업 해줘야한다.
	public String decryption(Map<String,Object> pMap) {
		String sid = pMap.get("session_no").toString();
		String day = pMap.get("day").toString();
		//////////////////긴 껍데기값 추출///////////////////
		String dumy = "";
		for (char chars : Protocol.PART.toCharArray()) {
			dumy = dumy+Character.getNumericValue(chars);
		}
		//받아온 날짜를 더미값에 추가
		dumy = dumy+day;
		///////////////////////////////////////////////
		//더미가 없어질 때 까지 while문
		while(sid.indexOf(dumy)>-1) {
			//더미가 들어가기전 위치 인덱스
			int index = sid.indexOf(dumy);
			//더미가 들어가기전 앞부분 세션파편
			String a = sid.substring(0, index);
			//더미
			String b = sid.substring(index, index+dumy.length());
			//세션의 뒷부분파편
			String c = sid.substring((index+b.length()),sid.length());
			//더미 들어가지 않은 앞부분+뒷부분 합치기
			String d = a+c;
			sid = d;
		}
		return sid;
	}
}
