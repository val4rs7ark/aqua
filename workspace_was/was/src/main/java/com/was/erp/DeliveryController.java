package com.was.erp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/delivery*")
public class DeliveryController {
	Logger logger = LoggerFactory.getLogger(DeliveryController.class);
	@Autowired(required=false)
	private DeliveryLogic deliveryLogic = null; 
	
	public int get_total(Map<String,Object> pMap) {
		int tot = deliveryLogic.get_total(pMap);
		return tot;
	}
	
	@RequestMapping(value="/delivery_List")
	public String deliveryList(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("controller////////////deliveryList호출성공");
		Map<String,Object> pl_Map = new HashMap<>();
//==================================조건검색 필요 요소==================================================
		if(pMap.get("before_date")!=null) {
			if(pMap.get("before_date").toString().length()>9) {
				String befor_date_ud = pMap.get("before_date").toString();
				pMap.put("befor_date_ud",befor_date_ud);
				pl_Map.put("befor_date_ud",befor_date_ud);
			}
		}
		if(pMap.get("after_date")!=null) {
			if(pMap.get("after_date").toString().length()>9) {
				String after_date_ud = pMap.get("after_date").toString();
				pMap.put("after_date_ud",after_date_ud);
				pl_Map.put("after_date_ud",after_date_ud);
			}
		}
		if("".equals(pMap.get("cb_situation"))) { //진행상황 콤보박스에서 선택을 택하면 널이 입력됨
			pMap.put("cb_situation","null");
		}
		if(pMap.get("keyword")!=null) {
			pl_Map.put("keyword",pMap.get("keyword"));
		}
		if(pMap.get("cb_search")!=null) {
			pl_Map.put("cb_search",pMap.get("cb_search"));
		}
		
		pl_Map.put("cb_situation",pMap.get("cb_situation"));
		
//===================================================================================================
		int tot = this.get_total(pMap);
		List<Map<String,Object>> deliveryList = deliveryLogic.deliveryList(pMap,tot);
		
		model.addAttribute("pl_Map",pl_Map); //조건검색을 유지하기 위해 Map에 담아서 뷰로 보낸다.
		model.addAttribute("tot",tot);
		model.addAttribute("deliveryList", deliveryList);
		logger.info("이상없음");
		return "delivery/project_bs_pix";
	}
	@RequestMapping(value="/delivery_save.was", method=RequestMethod.GET)
	public String deli_save(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("Controller //////////////// deli_save 호출성공");
		logger.info("deli_no : "+pMap.get("deli_no"));
		logger.info("team_name : "+pMap.get("team_name"));
		logger.info("deli_man : "+pMap.get("deli_man"));
		
		Map<String, Object> rMap = new HashMap<>();
		pMap.put("msg","");
		pMap.put("deli_no",Integer.parseInt(pMap.get("deli_no").toString()));
		Map<String,Object> r_Map = null;
		deliveryLogic.deli_save(pMap);
		String msg = null;
		String r_deli_start = null;
		if(pMap.get("msg").toString()!=null) {
			msg = pMap.get("msg").toString();
		}
		if(pMap.get("r_deli_start").toString()!=null) {
			r_deli_start = pMap.get("r_deli_start").toString();
		}
		String path="";
		String id_save= (String)pMap.get("id_save");
		String deli_no = pMap.get("deli_no").toString();
		mod.addAttribute("deli_no",deli_no);
		mod.addAttribute("msg",msg);
		mod.addAttribute("r_deli_start",r_deli_start);
		logger.info("msg : "+msg);
		logger.info("r_deli_start :"+r_deli_start);
		if(msg.equals("존재하지 않는 사원입니다. 이름을 다시입력해 주십시오")) {
			mod.addAttribute("id_update",id_save);
			path="delivery/result_update";
		}else if(msg.equals("소속과 이름이 일치하지 않습니다. 다시 입력해 주십시오")) {
			mod.addAttribute("id_update",id_save);
			path="delivery/result_update";
		}else {
			mod.addAttribute("id_save",id_save);
			path="delivery/result_save";
		}
		return path;
	}
	@RequestMapping(value="/delivery_commit.was", method=RequestMethod.GET)
	public String deli_commit(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("Controller //////////////// deli_commit 호출성공");
		String msg = (String)pMap.get("msg");
		String id_commit= (String)pMap.get("id_commit");
		String deli_no= (String)pMap.get("deli_no");
		pMap.put("deli_no",Integer.parseInt(pMap.get("deli_no").toString()));
		deliveryLogic.commit_state(pMap); // =================  delivery테이블의 state를 변경하는 코드
		String deli_afterTime = deliveryLogic.deli_commit(pMap);
		mod.addAttribute("deli_no", deli_no);
		mod.addAttribute("deli_afterTime", deli_afterTime);
		mod.addAttribute("msg",msg);
		mod.addAttribute("id_commit",id_commit);
		return "delivery/result_commit";
	}
	@RequestMapping(value="/delivery_update.was", method=RequestMethod.GET)
	public String deli_update(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("Controller //////////////// deli_update 호출성공");
		String id_update= (String)pMap.get("id_update");
		String deli_no= (String)pMap.get("deli_no");
		String msg = "update_null";
		deliveryLogic.update_state(pMap); // =================  delivery테이블의 state를 변경하는 코드
		mod.addAttribute("deli_no",deli_no);
		mod.addAttribute("id_update",id_update);
		mod.addAttribute("msg",msg);
		return "delivery/result_update";
	}
	@RequestMapping(value="/delivery_cancle.was", method=RequestMethod.GET)
	public String deli_cancle(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("Controller //////////////// deli_cancle 호출성공");
		String id_cancle= (String)pMap.get("id_cancle");
		String msg = (String)pMap.get("msg");
		String deli_no = (String)pMap.get("deli_no");
		deliveryLogic.cancle_state(pMap); // =================  delivery테이블의 state를 변경하는 코드
		String r_deli_start = deliveryLogic.select_start(pMap); 
		mod.addAttribute("deli_no",deli_no);
		mod.addAttribute("msg",msg);
		mod.addAttribute("id_save",id_cancle);
		mod.addAttribute("r_deli_start",r_deli_start);
		return "delivery/result_save";
	}
	
	
	
/***********************************************************************************************************
 *********************************************************************************************************** 
 ***********************************************************************************************************
 ***********************************************************************************************************/
	//배송 insert 초기화면
	@RequestMapping("/deliveryInsert_ListF")
	public String deliveryInsert_ListF(@RequestParam Map<String,Object> pMap, Model model) {
		logger.info("controller////////////deliveryInsert_ListF호출성공");
		Map<String,Object> r_Map = null;
		Map<String,Object> pl_Map = new HashMap<>(); //조건검색 유지 Map
////////////////////////삭제 실패시///////////////////////////////////////////
		if(pMap.get("fm")!=null) { 
			model.addAttribute("fail_msg", "배송중인 내역이 있습니다.");
		}
///////////////////////////////////////////////////////////////////////////
////////////////////////등록 입력후 메세지//////////////////////////////////////
		String insert_msg = null;
		if(pMap.get("insert_msg")!=null) { 
			insert_msg = pMap.get("insert_msg").toString();
			model.addAttribute("insert_msg", insert_msg);
		}
///////////////////////////////////////////////////////////////////////////
		

//==================================조건검색 필요 요소==================================================
		if(pMap.get("before_date")!=null) {
			if(pMap.get("before_date").toString().length()>9) {
				String befor_date_ud = pMap.get("before_date").toString();
				pMap.put("befor_date_ud",befor_date_ud);
				pl_Map.put("befor_date_ud",befor_date_ud);
			}
		}
		if(pMap.get("after_date")!=null) {
			if(pMap.get("after_date").toString().length()>9) {
				String after_date_ud = pMap.get("after_date").toString();
				pMap.put("after_date_ud",after_date_ud);
				pl_Map.put("after_date_ud",after_date_ud);
			}
		}
		if("".equals(pMap.get("cb_situation"))) { //진행상황 콤보박스에서 선택을 택하면 널이 입력됨
			pMap.put("cb_situation","null");
		}
		if(pMap.get("keyword")!=null) {
			pl_Map.put("keyword",pMap.get("keyword"));
		}
		if(pMap.get("cb_search")!=null) {
			pl_Map.put("cb_search",pMap.get("cb_search"));
		}
		
		pl_Map.put("cb_situation",pMap.get("cb_situation"));
		
//===================================================================================================
		int tot = this.get_total(pMap);
		r_Map = deliveryLogic.deliveryInsert_ListS(); //r_Map에는 리스트가 3개 담겨있음
		model.addAttribute("r_Map", r_Map);
		model.addAttribute("pl_Map",pl_Map); //조건검색을 유지하기 위해 Map에 담아서 뷰로 보낸다.
		return "delivery/baesong_insert";
	}
	@RequestMapping("/deliveryInsert_List")
	public String deliveryInsert_List(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("controller////////////deliveryInsert_List호출성공");
		String cus_manhp = pMap.get("cus_manhp_a").toString()+"-"+pMap.get("cus_manhp_b").toString()+"-"+pMap.get("cus_manhp_c").toString();
		String deli_when = pMap.get("deli_when_date").toString()+"/"+pMap.get("deli_when_time").toString();
		pMap.put("deli_weight",Integer.parseInt((pMap.get("deli_weight").toString())));
		pMap.put("deli_when",deli_when);
		pMap.put("cus_manhp",cus_manhp);
		deliveryLogic.deliveryInsert_List(pMap);
		mod.addAttribute("insert_msg", pMap.get("msg").toString());
		return "forward:deliveryInsert_ListF";
	}
	@RequestMapping("/delivery_Update_Insert")
	public String delivery_Update_Insert(@RequestParam Map<String,Object> pMap) {
		logger.info("controller////////////delivery_Update_Insert호출성공");
		String cus_manhp = pMap.get("cus_manhp_a").toString()+"-"+pMap.get("cus_manhp_b").toString()+"-"+pMap.get("cus_manhp_c").toString();
		String deli_when = pMap.get("deli_when_date").toString()+"/"+pMap.get("deli_when_time").toString();
		pMap.put("deli_when",deli_when);
		pMap.put("cus_manhp",cus_manhp);
		//=====================================================
		pMap.put("deli_no",Integer.parseInt(pMap.get("deli_no").toString()));
		pMap.put("deli_weight",Integer.parseInt(pMap.get("deli_weight").toString()));
		deliveryLogic.delivery_Update_Insert(pMap);
		return "redirect:deliveryInsert_ListF";
	}
	//배송 insert화면 업체명 검색후 화면
	@RequestMapping("/delivery_selectcomp")
	public String delivery_selectcomp(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("controller////////////delivery_selectcomp 호출성공");
		logger.info(pMap.get("cus_code").toString());
		Map<String, Object> r_Map = deliveryLogic.delivery_selectcomp(pMap);
		mod.addAttribute("delivery_rMap", r_Map);
		logger.info("이동하는곳 result_select_comp");
		return "delivery/result_select_comp";
	}
	//등록 취소 완료 버튼 누른후 화면///////////////////////////////////////////////////////////////////////
	@RequestMapping("/delivery_cancle_pix")
	public String delivery_cancle_pix(@RequestParam Map<String,Object> pMap) {
		logger.info("controller////////////delivery_cancle_pix 호출성공");
		pMap.put("deli_no",Integer.parseInt(pMap.get("deli_no").toString()));
		deliveryLogic.delivery_cancle_pix(pMap);
		return "redirect:deliveryInsert_ListF";
	}
	@RequestMapping("/delivery_selectInfo")
	public String delivery_selectInfo(@RequestParam Map<String,Object> pMap, Model mod) {
		logger.info("controller////////////delivery_selectInfo 호출성공");
		pMap.put("deli_no",Integer.parseInt(pMap.get("deli_no").toString()));
		logger.info("no:"+pMap.get("deli_no").toString());
		Map<String, Object> r_Map = deliveryLogic.delivery_selectInfo(pMap);
		r_Map.put("insert_gubun",pMap.get("insert_gubun"));
		logger.info("CUS_CODE :"+r_Map.get("CUS_CODE").toString());
		logger.info("BUSINESS_NO :"+r_Map.get("BUSINESS_NO").toString());
		logger.info("CUS_CEONAME :"+r_Map.get("CUS_CEONAME").toString());
		logger.info("CUS_HP :"+r_Map.get("CUS_HP").toString());
		logger.info("no:"+pMap.get("deli_no").toString());
		r_Map.put("deli_no",pMap.get("deli_no"));
		mod.addAttribute("delivery_selectInfo", r_Map);
		return "delivery/delivery_selectInfo";
	}
	@RequestMapping(value="/delivery_trance.was", method=RequestMethod.GET)
	public String delivery_trance(@RequestParam Map<String,Object> pMap) {
		logger.info("Controller //////////////// delivery_trance 호출성공");
		return "redirect:delivery_List";
	}
	@RequestMapping(value="/delivery_delete_insert.was", method=RequestMethod.GET)
	public String deli_delete_insert(@RequestParam Map<String,Object> pMap) {
		logger.info("Controller //////////////// delivery_delete_insert 호출성공");
		String rowid = null;
		if(pMap.get("rowid").toString()!=null) {
			rowid= pMap.get("rowid").toString();
			String r_rowid[] = rowid.split(",");
			List<Integer> c_rowid = new ArrayList<>();
			List<Map<String,Object>> r_list = deliveryLogic.deli_delete_insert(r_rowid); 
			for(int j=0;j<r_list.size();j++) {
				Map<String,Object> r_Map = r_list.get(j);
				if(r_Map.get("DELIVERY_STATE")!=null) {
					if("1".equals(r_Map.get("DELIVERY_STATE").toString())){ //삭제할 로우들중에 상태가 배송전인것들이 있으면 if문 실행
						
						c_rowid.add(Integer.parseInt(r_Map.get("ORDER_NO").toString()));//삭제할 것들 list에 담아기 시작 시작
						
					}else {
						String fail_msg = "z16k9"; //무의미 전달
						return "redirect:deliveryInsert_ListF?fm="+fail_msg; // 실패시무의미수 전달
					}
				}
			}//for문이 끝남 삭제할 것이 배열에 다 담김
			//삭제 시작
			deliveryLogic.deli_delete(c_rowid);
		}
		return "redirect:deliveryInsert_ListF";
	}

/*
=============================================================================
========================전체수정처리 보류=========================================
	@RequestMapping(value="/delivery_cancle_top.was", method=RequestMethod.GET)
	public String delivery_cancle_top(@RequestParam Map<String,Object> pMap) {
		logger.info("Controller //////////////// delivery_cancle_top 호출성공");
		String rowid = null;
		if(pMap.get("rowid").toString()!=null) {
			rowid= pMap.get("rowid").toString();
			String r_rowid[] = rowid.split(",");
			List<Integer> c_rowid = new ArrayList<>();
			List<Map<String,Object>> r_list = deliveryLogic.deli_delete_insert(r_rowid); 
			for(int j=0;j<r_list.size();j++) {
				Map<String,Object> r_Map = r_list.get(j);
				if(r_Map.get("DELIVERY_STATE")!=null) {
					if("1".equals(r_Map.get("DELIVERY_STATE").toString())){ //삭제할 로우들중에 상태가 배송전인것들이 있으면 if문 실행
						
						c_rowid.add(Integer.parseInt(r_Map.get("ORDER_NO").toString()));//삭제할 것들 list에 담아기 시작 시작
						
					}else {
						String fail_msg = "z16k9"; //무의미 전달
						return "redirect:deliveryInsert_ListF?fm="+fail_msg; // 실패시무의미수 전달
					}
				}
			}//for문이 끝남 삭제할 것이 배열에 다 담김
			//삭제 시작
			deliveryLogic.delivery_cancle_top(c_rowid);
		}
		return "redirect:deliveryInsert_ListF";
	}
=============================================================================
=============================================================================	
*/
}
