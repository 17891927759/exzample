<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
		function subForm(p) {
			$("#curPage").val(p);
			$("#frm").submit();
		}
		//删除
		function ps() {
			var ids="";
			$(":checked").each(function() {
				ids+=","+$(this).val();
			});
			ids=ids.substring(1);
			$.post(
				"shop/delete.do?id="+ids,
				function(d) {
					if(d>0){
						alert("删除成功");
						location.href="shop/viewMain.do";
					}else{
						alert("删除失败");
					}
				},"json"
			);
		}
		//全选
		function fx() {
			$(":checkbox").each(function() {
				$(this).prop("checked",!$(this).prop("checked"));
			})
		}
		function tj() {
			location.href="add.jsp";
		}
	</script>
</head>
<body>
<center>
	<table border="1" bordercolor="black" >
	  <tr>
	  	<td colspan="11" align="center">
	  		<form action="shop/viewMain.do" method="post" id="frm">
	  			<input type="hidden" name="curPage" id="curPage">
	  			时间范围：<input name="conditions['crtime']" value="${page.conditions.crtime}" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />-
	  			<input name="conditions['uptime']" value="${page.conditions.uptime}" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />
	  			<input type="text" name="conditions['name']" placeholder="商品名称或商品描述查询" value="${page.conditions.name}">
	  			<input type="button" value="查询" onclick="subForm(1)">
	  		</form>
	  	</td>
	  </tr>
	  <tr>
	    <th><input type="checkbox" name="qx" onclick="fx()" ></th>
	    <th>编号</th>
	    <th>缩略图</th>
	    <th>商品名称</th>
	    <th>描述</th>
	    <th>单价</th>
	    <th>创建日期</th>
	    <th>修改日期</th>
	    <th>商品类型</th>
	    <th>发布状态</th>
	    <th>操作</th>
	  </tr>
	  <c:forEach items="${list}" var="s">
	  	<tr>
	    <td><input type="checkbox"  value="${s.sid}"></td>
	    <td>${s.sid}</td>
	    <td>
	    	<c:if test="${not empty s.photo}">
	    		<img alt="" src="upload/${s.photo}" style="width: 50px;height: 50px;border-radius: 10px;">
	    	</c:if>
	    	<c:if test="${empty s.photo}">
	    		<img alt="" src="upload/260158.jpg" style="width: 50px;height: 50px;border-radius: 10px;">
	    	</c:if>
	    	
	    </td>
	    <td>${s.name}</td>
	    <td>${s.content}</td>
	    <td>${s.price}</td>
	    <td>
	    	<fmt:formatDate value="${s.crtime}"/>
	    </td>
	    <td>
	    	<fmt:formatDate value="${s.uptime}"/>
	    </td>
	    <td>${s.type.tname}</td>
	    <td>${s.state==1?'已下架':'已发布'}</td>
	    <td>
	    	<input type="button" value="删除" onclick="sc()" >
	    	<input type="button" value="编辑">
	    </td>
	  </tr>
	  </c:forEach>
	  <tr>
	  	<td colspan="11" align="center">
	  		${page.pageBar}
	  		<input type="button" value="批量删除" onclick="ps()" >
	  		<input type="button" value="添加" onclick="tj()" >
	  	</td>
	  </tr>
	</table>
</center>
</body>
</html>