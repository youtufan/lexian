<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>用户管理首页</h1>
<form id="loginForm" action="${pageContext.request.contextPath }/get.action" method="post" >
当前用户名是:${loginedUser.u_phone}
<input type="hidden" name="u_phone" value= "${loginedUser.u_phone}"/>
<input type="submit" name="login" value="修改用户信息"/>
</form>
<form id="quit" action="${pageContext.request.contextPath }/quit.action" method="post" >
<input type="submit" name="quit" value="退出账号"/>
</form>
</body>
</html>