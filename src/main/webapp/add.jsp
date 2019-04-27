<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<script type="text/javascript">
		$(function() {
			$.post(
				"shop/gettype.do",
				function(json) {
					$.each(json,function(index,t){
						$("select").append("<option value='"+t.tid+"'>"+t.tname);
					})
				},"json"
			);
		});
		/* function tj() {
			$.post(
				"shop/add.do",
				$("form").serialize(),
				function(d) {
					if(d>0){
						alert("添加成功");
						location.href="viewMain.do";
					}else{
						alert("添加失败");
					}
				},"json"
			);
		} */
	</script>
</head>
<body>
	<center>
	<form action="shop/add.do" method="post" enctype="multipart/form-data" >
		<table>
			<tr>
				<td>商品名称</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>商品简介</td>
				<td><input type="text" name="content"></td>
			</tr>
			<tr>
				<td>商品分类</td>
				<td>
					<select name="type.tid">
						
					</select>
				</td>
			</tr>
			<tr>
				<td>发布状态</td>
				<td>
					<input type="radio" value="0">已发布
					<input type="radio" value="1">已下架
				</td>
			</tr>
			<tr>
				<td>图片</td>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="添加"  >
				</td>
			</tr>
		</table>
	</form>
	</center>
	
</body>
</html>