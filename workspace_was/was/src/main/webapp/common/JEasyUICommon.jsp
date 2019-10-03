<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>
<link rel="stylesheet" type="text/css" href="<%=path.toString()%>/themes/default/easyui.css"><!--프로젝트 이름을 다르게 줘도 안바꿔도 됨.  -->
<link rel="stylesheet" type="text/css" href="<%=path.toString()%>/themes/icon.css?1">
<link rel="stylesheet" type="text/css" href="<%=path.toString()%>/demo/demo.css">
<script type="text/javascript" src="<%=path.toString()%>/js/jquery.min.js?2"></script>
<script type="text/javascript" src="<%=path.toString()%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path.toString()%>/js/commons.js"></script>
<script type="text/javascript" scr="<%=path.toString()%>/js/jquery.cookie.js"></script>
