<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%	
	Map<String,Object> pMap = new HashMap<>();
	pMap = (Map<String,Object>)request.getAttribute("pMap");
//////////////////세션에 담긴 아디와 비번 담을 변수////////////
	String order_writer = session.getAttribute("s_emp_no").toString();
	out.print("order_writer"+order_writer);
	String gubun2 = pMap.get("gubun2").toString();
%>   
      		<tbody style="text-align: left;">
		          <tr>
		             <td class="bi_table_insert" style="width:20%;padding-top:9px; padding-bottom: 0px;">품목코드</td>
		             <td style="width:45%;padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_code" name="ivgroup_code" type="text" class="form-control" style="height:auto;font-size: 13px;text-align:right" value="<%=pMap.get("code")%>" required>
		           	 </td>
		        	 <td style="padding-top:7px; padding-bottom:7px;width:auto" colspan="3">
<%
	if(gubun2.equals("register")){
%>     	 
		           		<input class="btn btn-secondary btn_firstrow btn_tableRow" type="button" 
		           			   style="height:26px;margin-right:0px" onClick="javascript:pummoksearch()" 
		           			   data-toggle="modal" data-target="#pummoksearch_register" value="검색" >
<%
	} else{
%>		         
		           		<input class="btn btn-secondary btn_firstrow btn_tableRow" type="button" 
		           			   style="height:26px;margin-right:0px" onClick="javascript:pummoksearch2()" 
		           			   data-toggle="modal" data-target="#pummoksearch_register" value="검색" >
<%

	}
%>  			   
		           		<input class="btn btn-secondary btn_firstrow btn_tableRow" type="button" style="height:26px;width:auto" data-toggle="modal" data-target="#itemadd" value="품목추가">
		           	 </td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >품목명</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_name" name="ivgroup_name" type="text" class="form-control" style="height: 28px;font-size: 13px;text-align:right" readonly value="<%=pMap.get("name")%>">
		           	 </td>
		           	 <td colspan="3" style="font-size:12px"></td>
		          </tr>
		          <tr>
		             <td class="bi_table_insert" style="padding-top: 7px; padding-bottom: 7px;" >규격</td>
		             <td style="padding-top: 5px; padding-bottom: 5px;">
		              <input id="ivgroup_size" name="ivgroup_size" type="text" class="form-control" style="height:28px;font-size:13px;text-align:right" readonly value="<%=pMap.get("size")%>">
		           	 </td>
		             <td colspan="3" style="font-size:12px"></td>
		          </tr>
       		</tbody>
       		
		<script type="text/javascript">  
			//구매/사용 신청 총액 자동 구하기
			$(function(){
			$('input.num_only').on('keyup',function(){
		     var order_unitprice = parseInt($("#order_unitprice").val() || 0 ); // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
		     var order_count = parseInt($("#order_count").val() || 0);
		     var totalPrice = order_unitprice * order_count
		     $("#order_totalprice").val(totalPrice);
		        });
			});
			$(function(){
			$('input.num_only').on('mouseup',function(){
		     var order_unitprice = parseInt($("#order_unitprice").val() || 0 ); // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
		     var order_count = parseInt($("#order_count").val() || 0);
		     var totalPrice = order_unitprice * order_count
		     $("#order_totalprice").val(totalPrice);
		        });
			});
		</script>     			