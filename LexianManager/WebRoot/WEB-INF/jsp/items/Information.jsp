<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="loginForm" action="${pageContext.request.contextPath }/modify.action" method="post" >
用户的具体信息：<br>
手  机  号：<input type="text" name="u_phone" value= "${loginedUser.u_phone}"/><br>
用户姓名：<input type="text" name="username" value= "${loginedUser.username}"/><br>
用  户  名：<input type="text" name="u_name" value= "${loginedUser.u_name}"/><br>
性        别：<input type="text" name="sex" value= "${loginedUser.sex}"/><br>
电子邮箱：<input type="text" name="mail" value= "${loginedUser.mail}"/><br>
<input type="submit" name="login" value="确认修改"/>
</form>
<p>${xxx}</p>
</body>
</html>