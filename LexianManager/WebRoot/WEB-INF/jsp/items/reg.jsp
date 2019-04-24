<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<script src="jquery.slim.min.js"></script>
		<script src="popper.min.js"></script>
		<script src="js/bootstrap.js"></script>
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/main.css">
		
		 <style>
            /*web background*/
            .container{
                display:table;
                height:100%;
            }
 
            /* centered columns styles */
            .row-centered {
                text-align:center;
            }
            .col-centered {
                display:inline-block;
                float:center;
                text-align:justify;
               
                display: flex;
			/*控制元素在主轴的对齐方式*/
			justify-content: center;
			/*控制默认的一行的对齐方式*/
			align-items: center;
			margin: 0 auto;

               
            }
        </style>
        
		<title>管理员注册</title>
	</head>
	<body>
		
		<div class="jumbotron text-center">
			<h2>管理员注册</h2>
		</div>
		
		
		
		<div class="container">
			<div class="col-centered">
			<div class="card" style="width:650px" >
				<div class="card-body">
					<h3 class="card-title">注册</h3>
					<form id="RegisterForm" action="${pageContext.request.contextPath }/Mregister.action" method="post">
				        <div class="form-group">
				            <label for="name">手机号：</label>
				            <input type="number" class="form-control" id="phone" name="phe" placeholder="手机号">
				        </div>
				        <div class="form-group">
				            <label for="pwd">密码：</label>
				            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="密码">
				        </div>
				        <div class="form-group">
				            <label for="checkpwd">确认密码：</label>
				            <input type="password" class="form-control" id="checkpwd" placeholder="确认密码">
				        </div>
				        <div class="form-group">
				            <label for="num">商店ID：</label>
				            <input type="number" class="form-control" id="num" name="num" placeholder="商店ID">
				        </div>
				        <div class="form-check">
					        <label class="form-check-label">
						    <input class="form-check-input" type="checkbox">记住手机号
					    </label>
					    <br/><br/>
				        </div>
				        <button type="submit" class="btn btn-primary">注册</button>
				        <p>${fail }</p>
					</form>
					<script language="javascript" type="text/javascript">
					function myfunction()
							{
							
							 if (document.getElementById('phone').value==""){
							alert("请输入登录账号!");
							return false;
							}
							 /*if (document.form1.passwords.value==""){
							alert("请输入登录密码!");
							return false;
							}
							if (document.form1.password.value==""){
							alert("请输入重复密码!");
							return false;
							}
							if (document.form1.password.value!=document.form1.passwords.value){
							alert("对不起!重复密码不等于登录密码");
							return false;
							}
							return true; */
							}
					</script>
				</div>
			</div>
			</div>
		</div>
		<br/><br/><br/><br/><br/><br/>
	</body>
</html>