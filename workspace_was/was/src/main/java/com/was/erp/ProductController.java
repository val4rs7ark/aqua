package com.was.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//190918
@RequestMapping("/product*")
@Controller
public class ProductController {
   private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
   @Autowired
   ProductLogic productLogic;
   public int get_Total(Map<String,Object> pMap) {
      int tot = productLogic.get_Total(pMap);
      return tot;
   }
   
   @RequestMapping(value="/productList")
   public String productList(@RequestParam Map<String,Object> pMap,Model model) {
      logger.info("Controller-productList 메소드 호출 성공");
      Map<String,Object> pl_Map = new HashMap<>();
      //===============================================조건검색=========================================================
      String before_date_ud = null;
      String after_date_ud = null;
      if(pMap.get("before_date")!=null) {
         if(pMap.get("before_date").toString().length()<11 && pMap.get("before_date").toString().length()>8) {//2019-10-11<11 & 20191011>8
            before_date_ud = pMap.get("before_date").toString()+"/00:00";//시간 정보를 더해서 before_date_ud에 담기
            pMap.put("before_date_ud",before_date_ud);// pMap으로 담기
            pl_Map.put("before_date_ud",before_date_ud);// pl_Map으로 담기
            logger.info("before_date_ud :"+before_date_ud);
         }else if(pMap.get("before_date").toString().length()>11) {//화면에서 넘어온 0000-00-00보다 더 클 때
            before_date_ud = pMap.get("before_date").toString();
            pMap.put("before_date_ud",before_date_ud);
            pl_Map.put("before_date_ud",before_date_ud);
            logger.info("before_date_ud :"+before_date_ud);
         }
      }
      if(pMap.get("after_date")!=null) {
         if(pMap.get("after_date").toString().length()<11 && pMap.get("after_date").toString().length()>8) {
            after_date_ud = pMap.get("after_date").toString()+"/23:59";
            pMap.put("after_date_ud",after_date_ud);
            pl_Map.put("after_date_ud",after_date_ud);
            logger.info("after_date_ud :"+after_date_ud);
         }else if(pMap.get("after_date").toString().length()>9) {
            after_date_ud = pMap.get("after_date").toString();
            pMap.put("after_date_ud",after_date_ud);
            pl_Map.put("after_date_ud",after_date_ud);
            logger.info("after_date_ud :"+after_date_ud);
         }
      }
      if("".equals(pMap.get("ivgroup_search"))) { //생산품 콤보박스에서 선택을 택하면 널이 입력됨
         //logger.info("******************************* 생산품 콤보박스 *******************************************");
         pMap.put("ivgroup_search","null");
      }
      pl_Map.put("ivgroup_search",pMap.get("ivgroup_search"));
      
      if("".equals(pMap.get("ship_search"))) { //어선 콤보박스에서 선택을 택하면 널이 입력됨
         //logger.info("******************************* 어선명 콤보박스 *******************************************");
         pMap.put("ship_search","null");
      }
      pl_Map.put("ship_search",pMap.get("ship_search"));
      //=================================================조건검색=======================================================
      int tot = this.get_Total(pMap);
      if(pMap.get("keyword")!=null) {
         logger.info(pMap.get("keyword").toString());
      }
      List<Map<String,Object>> rList = productLogic.productList(pMap, tot);
      model.addAttribute("pl_Map",pl_Map); //조건검색을 유지하기 위해 Map에 담아서 뷰로 보낸다.
      model.addAttribute("tot",tot);
      model.addAttribute("rList",rList);
      return "products/productsAdd";
   }
   
   @GetMapping(value="/productInsert")
   public String productInsert(@RequestParam Map<String,Object> pMap,Model model) {
      logger.info("productInsert 메소드 호출 성공");
      productLogic.productInsert(pMap);
      return "redirect:productList";   
   }
   
   @RequestMapping(value="/productsDetail", method=RequestMethod.GET)
   public String productsDetail(@RequestParam Map<String,Object> pMap,Model model) {
      logger.info("Controller>productDetail 호출 성공");
      Map<String, Object> productsDetail = null;
      productsDetail = productLogic.productsDetail(pMap);
      Object[] keys = productsDetail.keySet().toArray();
      for(Object key : keys) {
         logger.info("key :"+key.toString()+" , value :"+productsDetail.get(key.toString()));
      }
      model.addAttribute("productsDetail", productsDetail);
      return "products/productsDetail";
   }
   
   @RequestMapping(value="/productDelete")
   public String productDelete(@RequestParam Map<String,Object> pMap) {
      logger.info("productDelete 호출 성공");
      String rowid = null;
      if(pMap.get("rowid").toString()!=null) {
         rowid= pMap.get("rowid").toString();//2
         String r_rowid[] = rowid.split(",");//2,3,5 -> 
         productLogic.productDelete(r_rowid);//[2],[3],[5]
      }
      return "redirect:productList";
   }
   
   /*=====================================================================================================================================================================================*/
   @PostMapping(value="/productShipIn")
   public String productShipIn(@RequestParam Map<String,Object> pMap,Model model) {
      logger.info("productShipIn 메소드 호출 성공");
      productLogic.productShipIn(pMap);
      
      return "";//190909 이메소드는 아직 수정 중 입니다.
   }
   
   @PostMapping(value="/productShipOut")
   public String productShipOut(@RequestParam Map<String,Object> pMap,Model model) {
      logger.info("productShipOut 메소드 호출 성공");
      productLogic.productShipOut(pMap);
      return "";//190909 이메소드는 아직 수정 중 입니다.
   }
   
}