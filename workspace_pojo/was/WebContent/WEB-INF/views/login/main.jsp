<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="Content-Type" content="text/html;">
<%@ include file="/common/bootStrap4.jsp" %>
<title>WAS, AQUA</title>
</head>
<body>
<div class="container-fluid">
<div class="row">
   <div class="col-sm-3">
       <%@ include file="/common/MenuCommon.jsp" %>
  </div>
   <div class="col-sm-9">
   <div class="row" style="height: 100px;"></div>
         <%@ include file="/common/chart.jsp" %>
      <div class="row">
         <!-- 공지사항 -->
      <div id="notice" style="width: 700px;height: 500px;margin-top: 50px;">
          <h2>사내 공지사항</h2>
           <p>The .table-striped class adds zebra-stripes to a table:</p>            
           <table class="table table-striped">
             <thead>
                  <tr>
                 <th>번호</th>
                 <th>제목</th>
                 <th>작성자</th>
                 <th>작성일</th>
                 <th>조회수</th>
                  </tr>
             </thead>
             <tbody>
                  <tr>
                    <td>3</td>
                    <td>2019년도 직원 건강검진 안내</td>
                    <td>김시성</td>
                    <td>2019-08-30</td>
                    <td>3</td>
                  </tr>
                     <tr>
                    <td>2</td>
                    <td>9월 사내행사 일정 안내</td>
                    <td>김희원</td>
                    <td>2019-08-29</td>
                    <td>7</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td>임직원 영어교육비 지원안내</td>
                    <td>유종남</td>
                    <td>2019-08-23</td>
                    <td>12</td>
                  </tr>
             </tbody>
         </table>
      </div>
      </div>
   </div>
   </div>
   </div>
</body>
</html>