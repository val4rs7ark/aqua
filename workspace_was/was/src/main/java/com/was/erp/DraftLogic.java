package com.was.erp;

import java.sql.Clob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.util.ClobToString;

@Service
public class DraftLogic {
	Logger logger = LoggerFactory.getLogger(DraftLogic.class);
	ClobToString clobToString = new ClobToString();
	@Autowired
	DraftDao draftDao = null;
	public void draftAdd(Map<String, Object> pMap) {
		draftDao.draftAdd(pMap);
	}
	public List<Map<String, Object>> draft_selectEmp(List<Map<String,Object>> l_list) {
		List<Map<String,Object>> result_List = draftDao.draft_selectEmp(l_list);
		return result_List;
	}
	public List<Map<String, Object>> draft_deleteEmp(List<String> l_list) {
		List<Map<String,Object>> result_List = draftDao.draft_deleteEmp(l_list);
		return result_List;
	}
	public void draft_cancle() {
		draftDao.draft_cancle();
	}
    public List<Map<String, Object>> draft_commitEmp(List<String> r_list) {
	       List<Map<String,Object>> result_List = draftDao.draft_commitEmp(r_list);
	       List<Map<String,Object>> nList = new ArrayList<>();
	       for(int i=0;i<result_List.size();i++) {
	          if(("임시").equals(result_List.get(i).get("EMP_LEVEL"))){
	             nList.add(result_List.get(i));
	          }
	       }
	       for(int i=0;i<result_List.size();i++) {
	          if(("사원").equals(result_List.get(i).get("EMP_LEVEL"))){
	             nList.add(result_List.get(i));
	          }
	       }
	       for(int i=0;i<result_List.size();i++) {
	          if(("대리").equals(result_List.get(i).get("EMP_LEVEL"))){
	             nList.add(result_List.get(i));
	          }
	       }
	       for(int i=0;i<result_List.size();i++) {
	          if(("차장").equals(result_List.get(i).get("EMP_LEVEL"))){
	             nList.add(result_List.get(i));
	          }
	       }
	       for(int i=0;i<result_List.size();i++) {
	          if(("부장").equals(result_List.get(i).get("EMP_LEVEL"))){
	             nList.add(result_List.get(i));
	          }
	       }
	       return nList;
	}
	public Map<String, Object> draft_selectText(Map<String,Object> pMap) throws Exception {
		List<Map<String,Object>> r_list = draftDao.draft_selectText(pMap);
		List<Map<String,Object>> myWrite_list = draftDao.draft_myWrite_list(pMap);
		String DRAFT_CONTENTS = "";
		
		if(r_list.size()!=0) {
			for(int i=0;i<r_list.size();i++){
				Map<String,Object> rMap = r_list.get(i);
				DRAFT_CONTENTS = clobToString.clobToString((Clob)rMap.get("DRAFT_CONTENTS"));
				rMap.put("DRAFT_CONTENTS",DRAFT_CONTENTS);
				r_list.set(i, rMap);
			}
		}
		
		 if(myWrite_list.size()!=0) { 
			 for(int i=0;i<myWrite_list.size();i++){
				 Map<String,Object> rMap = myWrite_list.get(i); 
				 DRAFT_CONTENTS = clobToString.clobToString((Clob)rMap.get("DRAFT_CONTENTS"));
				 rMap.put("DRAFT_CONTENTS",DRAFT_CONTENTS);
				 myWrite_list.set(i, rMap);
		 	}
		 }
		 
		Map<String, Object> imsi_Map = new HashMap<>();
		imsi_Map.put("one", r_list);
		imsi_Map.put("two", myWrite_list);
		return imsi_Map;
	}
	//기안서
	public List<Map<String, Object>> draft_permission_page(Map<String, Object> pMap) throws Exception {
		//결재해야하는 기안서 정보를 가져오는 1개로우의 List
		List<Map<String,Object>> r_list = draftDao.draft_permission_page(pMap);
		String DRAFT_CONTENTS = "";
		 if(r_list.size()!=0) { 
			 for(int i=0;i<r_list.size();i++){
				 Map<String,Object> rMap = r_list.get(i); 
				 DRAFT_CONTENTS = clobToString.clobToString((Clob)rMap.get("DRAFT_CONTENTS"));
				 logger.info(DRAFT_CONTENTS); 
				 rMap.put("DRAFT_CONTENTS",DRAFT_CONTENTS);
				 r_list.set(i, rMap);
		 	}
		 }
		//결재해야하는 기안서에도 결재자 개인 정보가 필요한데 각각 정보가 필요해서 다시 select태움
		List<String> st_list = new ArrayList<>();
		st_list.add(r_list.get(0).get("FIRST_PERMISSION").toString());
		st_list.add(r_list.get(0).get("SECCOND_PERMISSION").toString());
		st_list.add(r_list.get(0).get("THIRD_PERMISSION").toString());
		st_list.add(r_list.get(0).get("FORTH_PERMISSION").toString());
		List<Map<String,Object>> imsi_list = draftDao.draft_commitEmp(st_list);
		List<Map<String,Object>> nList = new ArrayList<>();
	       for(int i=0;i<imsi_list.size();i++) {
	          if(("임시").equals(imsi_list.get(i).get("EMP_LEVEL"))){
	             nList.add(imsi_list.get(i));
	          }
	       }
	       for(int i=0;i<imsi_list.size();i++) {
	          if(("사원").equals(imsi_list.get(i).get("EMP_LEVEL"))){
	             nList.add(imsi_list.get(i));
	          }
	       }
	       for(int i=0;i<imsi_list.size();i++) {
	          if(("대리").equals(imsi_list.get(i).get("EMP_LEVEL"))){
	             nList.add(imsi_list.get(i));
	          }
	       }
	       for(int i=0;i<imsi_list.size();i++) {
	          if(("차장").equals(imsi_list.get(i).get("EMP_LEVEL"))){
	             nList.add(imsi_list.get(i));
	          }
	       }
	       for(int i=0;i<imsi_list.size();i++) {
	          if(("부장").equals(imsi_list.get(i).get("EMP_LEVEL"))){
	             nList.add(imsi_list.get(i));
	          }
	       }
	       Map<String,Object> list_Map = new HashMap<>();
	       list_Map.put("list_Map",nList);
	       //2리스트 1번째 방에는 결재자 정보가 담겨있음.
	       r_list.add(list_Map);
	     return r_list;
	}
	public void draft_buttonLoot(Map<String, Object> pMap) {
		String loot = pMap.get("loot").toString();//버튼을 구별하는 변수
		if("dismiss".equals(loot)) {//반려버튼
			draftDao.dismiss(pMap);
		}else if("permission".equals(loot)) {//결제버튼
			draftDao.permission(pMap);
		}else if("draft_delete".equals(loot)) {//결제버튼
			draftDao.draft_delete(pMap);
		}
	}
	public Map<String,Object> draft_catchpw(Map<String, Object> pMap) {
		String pw = draftDao.draft_catchpw(pMap);
		pMap.put("pw",pw);
		return pMap;
	}
	
	//잠시대기
	//public List<Map<String,Object>> draft_select(Map<String, Object> pMap) {
	//	List<Map<String,Object>> r_list = draftDao.draft_selectText(pMap);
	//	return r_list;
	//}
}
