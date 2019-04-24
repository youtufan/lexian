<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>乐鲜生活</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/main.css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/css; charset=UTF-8">
<style>
/*web background*/
.card {
	float: right;
}

h1 {
	color: #E2214B;
}

.panel {
	display: table;
	width: 100%;
	height: 100%;
}

/* centered columns styles */
.row-centered {
	text-align: left;
	float: right;
}

.col-centered {
	display: inline-block;
	float: center;
	text-align: justify;
	display: flex;
	/*控制元素在主轴的对齐方式*/
	justify-content: center;
	/*控制默认的一行的对齐方式*/
	align-items: center;
	margin: 0 auto;
}

img {
	width: 100%;
	height: 100%;
}

body {
	background-image: url(img/loginB.jpg);
	background-repeat: no-repeat;
	background-size: 100%;
}

.header {
	background-color: white;
	margin-top: 0;
	text-justify: auto;
	height: 120px;
	padding: 30px 50px;
}
</style>
<body>

	<%
		String u_phone = "";
		String u_pwd  = "";
		Cookie[] c = request.getCookies();
		if(c!=null){
			for(int i =0;i<c.length;i++)
			{
				if("u_phone".equals(c[i].getName())){
					u_phone = c[i].getValue();
				}else if("u_pwd".equals(c[i].getName())){
					u_pwd = c[i].getValue();
				}
			}
		}else{
			u_phone = "";
			u_pwd = "";
		}
		System.out.println(u_phone);
	%>

	<div class="header">
		<h1 class="display-4" style="margin-left: 20px;">乐鲜生活</h1>


	</div>

	<div class=panel>
		<div class="row row-centered  ">
			<div class=" col-lg-10 ">
				<div class="card"
					style="width: 550px; height: 400px; margin-top: 20px; float: right;">
					<div class="card-header">登录</div>
					<div class="card-body">


						<form id="loginForm"
							action="${pageContext.request.contextPath }/userlogin.action"
							method="post">
							<div class="form-group row">
								<label for="inputEmail3" class="col-sm-2 form-control-label">用户名</label>
								<div class="col-sm-10">
									<input type="text" name="u_phone" class="form-control"
										id="inputEmail3" placeholder="电话" value="<%=u_phone %>">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPassword3" class="col-sm-2 form-control-label">密码</label>
								<div class="col-sm-10">
									<input type="password" name="u_pwd" class="form-control"
										id="inputPassword3" placeholder="密码" value="<%=u_pwd %>">
								</div>
							</div>

							<div class="form-group row">
								<div class="col-sm-10">
									<div class="checkbox">
										<label> <input type="checkbox" name="passcookie">
											记住密码
										</label>
									</div>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-secondary">Sign
										in</button>
								</div>
								<p>${fail }</p>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>



</body>
</html>