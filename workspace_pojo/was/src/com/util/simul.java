package com.util;

import java.time.LocalDateTime;
import java.time.temporal.ChronoField;
import java.util.Random;
import java.util.StringTokenizer;

public class simul {
	
	public static void main(String[] args) {
		//String session_no ="aaa7777bbb";
		String session_no ="5F81B77503FAB68C34D6CABFF64C76BC";
		String dumy = "223425302312171327302320112433142711";
		////////////////////////////////암호화 시뮬///////////////////////////////
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
		System.out.println(ms);
		StringBuffer sbday = new StringBuffer(ms);
		sbday.insert(1, "-");
		StringTokenizer st = new StringTokenizer(sbday.toString(),"-");
		int tokenDay1 = Integer.parseInt(st.nextToken());
		int tokenDay2 = Integer.parseInt(st.nextToken());
		System.out.println("tokenDay1 :"+tokenDay1);
		System.out.println("tokenDay2 :"+tokenDay2);
		StringBuffer remote = new StringBuffer(session_no);
		remote.insert(tokenDay1, dumy);
		remote.insert(tokenDay2, dumy);
		String result = remote.toString();
		System.out.println("암호화 :"+result);
		////////////////////////////////암호화 시뮬///////////////////////////////
		///////////////////////////////복호화 시뮬////////////////////////////////
		String sid = result;//암호화되어있는 세션id
		while(sid.indexOf(dumy)>-1) {
			//더미가 들어가기전 위치 인덱스
			int index = sid.indexOf(dumy);
			System.out.println("더미 위치 인덱스"+index);
			//더미가 들어가기전 앞부분 세션파편
			String a = sid.substring(0, index);
			System.out.println("세션앞파편 :"+a);
			//더미
			String b = sid.substring(index, index+dumy.length());
			System.out.println("더미 :"+b);
			//세션의 뒷부분파편
			String c = sid.substring((index+b.length()),sid.length());
			System.out.println("세션뒷파편 :"+c);
			//더미 들어가지 않은 앞부분+뒷부분 합치기
			String d = a+c;
			sid = d;
			System.out.println("와일문 안에서 :"+sid);
		}
		System.out.println("복호화 :"+sid);
		///////////////////////////////복호화 시뮬////////////////////////////////
	}
}
