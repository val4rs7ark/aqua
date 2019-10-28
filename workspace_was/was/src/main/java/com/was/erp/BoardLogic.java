package com.was.erp;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardLogic {
   private static final Logger logger = LoggerFactory.getLogger(BoardLogic.class);
   @Autowired
   BoardDao boardDao;

   public int boardTotal(Map<String, Object> pMap) {
      logger.info("boardTotal 호출 성공");
      int tot = boardDao.boardTotal(pMap);
      return tot;
   }

   public List<Map<String, Object>> boardList(Map<String, Object> pMap, int tot) {
      logger.info("Logic-productList 호출 성공");
      int nowPage = 1;// 현재 페이지
      if (pMap.get("nowPage") != null) {
         nowPage = Integer.parseInt(pMap.get("nowPage").toString()) + 1;
      }
      int pagePer_Num = 5;// 한페이지에 뿌려질 로우수
      int start = 0;
      int end = 0;
      if (nowPage > 0) {
         start = ((nowPage - 1) * pagePer_Num) + 1;
         end = nowPage * pagePer_Num;
         pMap.put("start", start);
         if (end > tot) {
            pMap.put("end", tot);
         } else {
            pMap.put("end", end);
         }
      }
      logger.info("tot :" + tot);
      logger.info("nowPage :" + nowPage);
      logger.info("start :" + start);
      logger.info("end :" + end);
      List<Map<String, Object>> boardList = boardDao.boardList(pMap);
      return boardList;
   }
   //============================================================================================================================================//

   public int boardADD(Map<String, Object> pMap) {
      logger.info("boardAdd 호출 성공");
      int bo_no = 0;
      int bm_group = 0;
      if (pMap.get("bm_group") != null) {
         bm_group = Integer.parseInt(pMap.get("bm_group").toString());
      }
      int mresult = 0;
      int sresult = 0;
      bo_no = boardDao.getBono();
      logger.info("새로 채번한 순번:" + bo_no);
      pMap.put("bo_no", bo_no);// 채번한 것을 넘김
      /*
       * if (bm_group > 0) {// 너 댓글이니? boardDao.bmStepUpdate(pMap); int pos = 0; int
       * step = 0; if (pMap.get("bm_pos") != null) { pos =
       * Integer.parseInt(pMap.get("bm_pos").toString()); } pMap.put("bm_pos", pos +
       * 1); if (pMap.get("bm_step") != null) { step =
       * Integer.parseInt(pMap.get("bm_step").toString()); } pMap.put("bm_step", step
       * + 1); } else {// 너 새글이지? bm_group = boardDao.getBmgroup();
       * pMap.put("bm_group", bm_group); pMap.put("bm_pos", 0); pMap.put("bm_step",
       * 0); }
       */
      // 공통 처리 부분
      logger.info("글번호:" + pMap.get("bo_no"));
      logger.info("그룹번호:" + pMap.get("bm_group"));
      logger.info("차수번호:" + pMap.get("bm_pos"));
      logger.info("정렬순서번호:" + pMap.get("bm_step"));
      mresult = boardDao.boardMADD(pMap);
      // 첨부파일이 있을 때
      if (pMap.get("bs_file") != null && pMap.get("bs_file").toString().length() > 1) {
         pMap.put("bo_no", bo_no);
         sresult = boardDao.boardMADD(pMap);
      }
      return mresult;
   }

   public List<Map<String, Object>> boardList(Map<String, Object> bMap) {
      List<Map<String, Object>> boardList = boardDao.boardList2(bMap);
      return boardList;
   }

}