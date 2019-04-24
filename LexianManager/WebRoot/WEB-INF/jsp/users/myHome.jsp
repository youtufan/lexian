<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人中心</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />		
	<!--theme-style-->
	<link href="css/style4.css" rel="stylesheet" type="text/css" media="all" />	
	<link href="css/main.css" rel="stylesheet" type="text/css" media="all" />	
	<!--//theme-style-->
	
	<script src="js/jquery-3.3.1.min.js"></script> 
	
	<!-- slide -->
	
	<script src="js/bootstrap.min.js"></script>
	<script type="application/x-javascript"> 
	addEventListener("load", function() { 
	setTimeout(hideURLbar, 0); }, false);function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<!--- start-rate---->
	<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	
	<script type="text/javascript">
			jQuery(function() {
			jQuery('.starbox').each(function() {
				var starbox = jQuery(this);
					starbox.starbox({
					average: starbox.attr('data-start-value'),
					changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
					ghosting: starbox.hasClass('ghosting'),
					autoUpdateAverage: starbox.hasClass('autoupdate'),
					buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
					stars: starbox.attr('data-star-count') || 5
					}).bind('starbox-value-changed', function(event, value) {
					if(starbox.hasClass('random')) {
					var val = Math.random();
					starbox.next().text(' '+val);
					return val;
					} 
				})
			});
		});
	</script>
	<style>
		.home-top ul li{
			list-style: none;
			padding: 20px;
			width: 150px;
		}
        .home-top li:hover {
			color: #B21F2D;
			background-color: #B21F2D;
		}
        .home-top  a:hover{
			color: #FAFAFA;
			text-decoration: none;
		}
	</style>
</head>

<%
		String u_phone=(String)session.getAttribute("loginedUser");
		pageContext.setAttribute("u_phone", u_phone);
	%>

<body>
	<!--header-->
	<!-- UserBean ub=(UserBean)session.getAttribute("ub"); -->
	<div class="header">
		<div class="container">
			<div class="head" ><div class=" logo"><a href="index.jsp"><img src="img/logo.jpg" alt=""></a></div></div>
		</div>
		<div class="header-top">
			<div class="container">
					<div class="col-sm-5 col-md-offset-2 header-login float-right">
						<ul >
							<li><a href="returnIndex.action">首页</a></li>
							
							<li><a href="getTrolley.action?u_phone=${u_phone }">购物车</a></li>
						</ul>
					</div>	
					<div class="clearfix"></div>
			</div>
		</div>
	</div>	
	<!--banner-->
	<div class="banner-top ">
		<div class="container">
			<h1>个人中心</h1>
			<em></em>
		
		</div>
	</div>
	
	<div class="container" >
		<img src="img/head.jpg" style="margin-top: 20px;margin-left: -90px;"/>
		<div class="home-top" style="margin-left: -120px;">
			<table width="100%" height="700" border="0" cellpadding="0" cellspacing="0">
            <tr>
            <td width="15%" height="100%" valign="top">
    	    <ul class=" nav-pills nav-stacked" role="tablist">
            <li><a href="myInfo.action?u_id=${u_id } " target="mainFrame" >我的个人信息</a><br></li>
            
            <li><a href="myOrder.action?u_id=${u_id } " target="mainFrame">我的订单</a><br></li>
           </ul>
            </td>
            <td width="100%" valign="top"><iframe scrolling="no" style="margin-top: -130px;margin-left: -30px;" src="myInfo.action?u_id=${u_id }"   name="mainFrame" frameborder="0" marginheight="0" marginwidth="0" height="700" width="115%"></iframe></td>
            </tr>
            </table>
		</div>
	</div>
			
	
	<!--过渡-->
	<div class="container">
		<div class="brand">			
			<div class="clearfix"></div>
		</div>
	</div>
	<!--页脚-->
	<div class="footer">
		<center>
			<div class="footer-bottom"><p style="color: white;">乐鲜生活电子商城</p></div>
		</center>
	</div>
	<!--页脚-->
</body>
	
</html>