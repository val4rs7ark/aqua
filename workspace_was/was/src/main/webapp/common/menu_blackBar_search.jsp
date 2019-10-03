<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/common/bootStrap4.jsp" %>
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid ">
<div class="row">
<div style="width:20%">
	 <%@ include file="/common/MenuCommon.jsp" %> <!-- <<메뉴는 얘 데려가서 쓰면 됨.  -->
</div>
<div style="width:80%">
<!--  아래 코드가 업무명 쓰는 블랙바  -->
<div class="card bg-dark text-white" style="height:50px; margin-top:70px">
    <div class="card-body">사원목록</div>
  </div>
<div class="row">
    <!-- ========================================검색창 메인모양================================ -->
  <div class="w3-container w3-light-gray" style=" margin-top: 25px; height: 60px;">
  <div class="box-container">
  <div id="box">
  <table>
     <thead>
        <th>
           <td>
              <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">생산품명</button>
                      <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">어선명</a>
                      </div>
           </td>
           <td>
              <input type="text" width="200px;" height="35px;" data-options="prompt:'생산품명을 선택하세요.'">
           </td>
        </th>
        <th>
           <td><button type="button" class="btn btn-dark">입고등록일</button></td>
           <td>
              <input type="date" class="form-control">
           </td>
           <td><i class='fas fa-minus-square' style='font-size:36px'></i></td>
           <td>
              <input type="date" class="form-control">
           </td>
           <td><button onclick="location.href='#'" class="btn btn-dark" style="float: right;">조회</button></td>
        </th>
     </thead>
  </div>
  </div>
  </table>
  </div>
  </div>
  </div>
    <!-- ========================================검색창 메인모양================================ -->
</div>
</div>
</body>
</html>