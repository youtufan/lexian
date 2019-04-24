<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>商品详情</h1>

	<table width="100%" border=1>
	<c:forEach items="${commodityDetailShowList }" var="commodity">
		<tr>
			<td>商品编号：<input type="text" name="no" value="${commodity.com_no} "/></td>
			<td>商品名:<input type="text" name="name" value="${commodity.com_name }" /></td>
			<td>商品价格:<input type="text" name="name" value="${commodity.com_price }" /></td>
			<td>门店名字:<input type="text" name="name" value="${commodity.sto_name }" /></td>
			<td>门店地址:<input type="text" name="name" value="${commodity.sto_add }" /></td>
		</tr>
	</c:forEach>
	</table>

</body>
</html>