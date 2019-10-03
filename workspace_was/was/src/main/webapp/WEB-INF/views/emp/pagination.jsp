<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="/common/bootStrap4.jsp" %>
</head>
<body>
<div >
<div style="margin-top:5%">
  <ul class="pagination">
  	<button class="btn btn-dark" onClick="empDel()" style="margin-left:1%;margin-right:15%">삭제</button>
    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</div>  
</div>
<!-- 
================================================================================================================================
												Modal 삭제 하시겠습니까?
================================================================================================================================
-->
<div class="modal fade" id="myModal_del" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
			<h4 align="center">정말 삭제하시겠습니까?</h4>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="btn_del();" data-dismiss="modal">YES</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">NO</button>
      </div>
    </div>
  </div>
  </div>
</body>
</html>