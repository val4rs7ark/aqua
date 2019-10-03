package com.was.erp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class DeliveryLogic {
	Logger logger = LoggerFactory.getLogger(DeliveryLogic.class);
	@Autowired
	private DeliveryDao deliveryDao = null;
	
	public List<Map<String, Object>> deliveryList(Map<String, Object> pMap, int tot) {
		logger.info("DeliveryLogic////////////deliveryList호출성공");
		int nowPage = 1;//현재 페이지
		if(pMap.get("nowPage")!=null) {
			nowPage = Integer.parseInt(pMap.get("nowPage").toString())+1;
		}
		int pagePer_Num = 8;//한페이지에 뿌려질 로우수
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
		List<Map<String, Object>> deliveryList = deliveryDao.deliveryList(pMap);
		return deliveryList;
	}

	public void deliveryInsert_List(Map<String, Object> pMap) {
		logger.info("DeliveryLogic////////////deliveryInsert_List호출성공");
		deliveryDao.deliveryInsert_List(pMap);
	}

	public Map<String,Object> deliveryInsert_ListS() {
		logger.info("DeliveryLogic////////////deliveryInsert_ListS호출성공");
		 List<Map<String, Object>> deliveryInsert_ListF = deliveryDao.deliveryInsert_ListF();
		 List<Map<String, Object>> deliveryInsert_ListS = deliveryDao.deliveryInsert_ListS();
		 List<Map<String, Object>> f_list = deliveryDao.delivery_selectfish();
			Map<String, Object> r_Map = new HashMap<>();
			r_Map.put("deliveryInsert_ListF", deliveryInsert_ListF);
			r_Map.put("deliveryInsert_ListS", deliveryInsert_ListS);
			r_Map.put("f_list", f_list);
		 return r_Map;
	}
	public Map<String,Object> deli_save(Map<String, Object> pMap) {
		logger.info("DeliveryLogic////////////deli_save호출성공");
		//Map<String,Object> result_Map = null;
		deliveryDao.deli_save(pMap);
		return pMap;
	}

	public String deli_commit(Map<String,Object> pMap) {
		String deli_afterTime = deliveryDao.deli_commit(pMap);
		return deli_afterTime;
	}
	public void commit_state(Map<String, Object> pMap) {
		deliveryDao.commit_state(pMap);
	}

	public void update_state(Map<String, Object> pMap) {
		deliveryDao.update_state(pMap);
	}

	public void cancle_state(Map<String, Object> pMap) {
		deliveryDao.cancle_state(pMap);
	}

	public Map<String, Object> delivery_selectcomp(Map<String, Object> pMap) {
		logger.info("DeliveryLogic////////////delivery_selectcomp호출성공");
		List<Map<String, Object>> c_list = deliveryDao.delivery_selectcomp(pMap);
		List<Map<String, Object>> f_list = deliveryDao.delivery_selectfish();
		Map<String, Object> r_Map = new HashMap<>();
		r_Map.put("c_list", c_list);
		r_Map.put("f_list", f_list);
		return r_Map;
	}

	public String select_start(Map<String, Object> pMap) {
		String r_deli_start = deliveryDao.select_start(pMap);
		return r_deli_start;
	}

	public Map<String, Object> delivery_selectInfo(Map<String, Object> pMap) {
		logger.info("DeliveryLogic////////////delivery_selectInfo호출성공");
		Map<String, Object> r_Map = deliveryDao.delivery_selectInfo(pMap);
		List<Map<String, Object>> f_list = deliveryDao.delivery_selectfish();
		r_Map.put("f_list",f_list);
		return r_Map;
	}

	public void delivery_Update_Insert(Map<String, Object> pMap) {
		logger.info("DeliveryLogic////////////delivery_Update_Insert호출성공");
		deliveryDao.delivery_Update_Insert(pMap);
	}

	public int get_total(Map<String,Object> pMap) {
		logger.info("DeliveryLogic////////////get_total호출성공");
		int tot = deliveryDao.get_total(pMap);
		return tot;
	}

	public void deli_delete(String r_rowid[]) {
		logger.info("DeliveryLogic////////////deli_delete호출성공");
		deliveryDao.deli_delete(r_rowid);
	}

}
