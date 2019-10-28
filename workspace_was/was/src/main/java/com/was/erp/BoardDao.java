package com.was.erp;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class BoardDao {
   private static final Logger logger = LoggerFactory.getLogger(BoardDao.class);
   @Autowired
   SqlSessionTemplate sqlSessionTemplate = null;
   public int boardTotal(Map<String, Object> pMap) {
      logger.info("boardTotal 호출 성공");
      int tot = 0;
      try {
         tot = sqlSessionTemplate.selectOne("boardTotal",pMap);
         logger.info("이상없음 tot:"+tot);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return tot;
   }

   public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
       logger.info("boardList 호출 성공"); 
        List<Map<String,Object>> boardList = null;
        try {
           boardList = sqlSessionTemplate.selectList("boardList",pMap); 
           logger.info("boardList size:"+boardList.size());
      } catch (Exception e) {
         e.printStackTrace();
      }
        return boardList; 
   }
//==============================================================================================================================================//
   public int getBono() {
      int bo_no = 0;
      try {
         bo_no = sqlSessionTemplate.selectOne("getBono");                     
      } catch (Exception e) {
         e.printStackTrace();
      }    
      return bo_no;
   }
   
   /*
    * public String boardAdd(Map<String, Object> pMap) {
    * logger.info("BoardDao>boardAdd 호출 성공"+sqlSessionTemplate); List<Map<String,
    * Object>> boardAdd = new ArrayList<>(); boardAdd =
    * sqlSessionTemplate.selectList("boardAdd", pMap); return ""; }
    */

   public int boardMADD(Map<String, Object> pMap) {
      logger.info("BoardDao>boardMADD 호출 성공");
      int result = 0;
      try {
         result = sqlSessionTemplate.update("boardMADD",pMap);   
         logger.info("result:"+result);//추가 1 추가x 0
      } catch (Exception e) {
         e.printStackTrace();
      }    
      return result;
   }
   
   public int boardSAdd(Map<String, Object> pMap) {
      logger.info("BoardDao>boardSAdd 호출 성공");
      int result = 0;
      try {
         result = sqlSessionTemplate.update("boardSAdd",pMap);      
      } catch (Exception e) {
         e.printStackTrace();
      }    
      return result;
   }
   
   public int getBogroup() {
      int bo_group = 0;
      try {
         bo_group = sqlSessionTemplate.selectOne("getBogroup");//웨어절 파라미터 2개 그룹번호가 같고 앤드 화면에서 가져온 값 보다 큰거                        
      } catch (Exception e) {
         e.printStackTrace();
      }
      return bo_group;
   }

   public List<Map<String, Object>> boardList2(Map<String, Object> bMap) {
      // TODO Auto-generated method stub
       logger.info("main>boardList 호출 성공"); 
        List<Map<String,Object>> boardList = null;
        try {
           boardList = sqlSessionTemplate.selectList("boardList_ghost",bMap); 
           logger.info("boardList size:"+boardList.size());
      } catch (Exception e) {
         e.printStackTrace();
      }
        return boardList; 
   }
   
   /*public int boStepUpdate(Map<String, Object> pMap) {
     logger.info("BoardDao>bmStepUpdate호출 성공");
     logger.info("bo_group"+pMap.get("bo_group")+"bo_step"+pMap.get("bo_group"));//화면에서 값을 넘기는 것이니 소문자 
     int result = 0; 
     BoardNoticeVO bmVO = new BoardNoticeVO();
     int ibm_group = 0; 
     if(pMap.get("bo_group")!=null) { 
        ibm_group = Integer.parseInt(pMap.get("bo_group").toString()); 
     } 
     int ibm_step = 0;
     if(pMap.get("bo_step")!=null) { 
        ibm_step = Integer.parseInt(pMap.get("bo_step").toString()); 
     }
     bmVO.setBm_group(ibm_group); 
     bmVO.setBm_step(ibm_step); 
     try { 
        result = sqlSessionTemplate.update("boStepUpdate",bmVO);//웨어절 파라미터 2개 그룹번호가 같고 앤드 화면에서  가져온 값 보다 큰거 
     } 
     catch (Exception e) { 
       e.printStackTrace(); 
     } 
      return result; 
    
   }*/
   
}