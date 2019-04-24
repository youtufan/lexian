<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>乐鲜生活电子商城</title>
	
	
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
		
	<!--theme-style-->
	<link href="css/style4.css" rel="stylesheet" type="text/css" media="all" />	
	<link href="css/main.css" rel="stylesheet" type="text/css" media="all" />
	<!--//theme-style-->
	
	<script src="js/jquery-3.3.1.min.js"></script> 
	<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
	<!-- slide -->
	
	<script src="js/bootstrap.min.js"></script>
	<script type="application/x-javascript"> 
    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
    function hideURLbar(){ window.scrollTo(0,1); } 
	</script>
	<script src="js/bootstrap.js"></script>
	<!--- start-rate---->
	
	<style >
		.goodsMenu ul li a{
			list-style: none;
		}
	</style>


<style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 100%;
           
           }
           
        </style>
<style>
	.col1>li{
		display: inline-block;
	}
</style>

</head>
	<%
		String u_phone=(String)session.getAttribute("loginedUser");
		pageContext.setAttribute("u_phone", u_phone);
	%>

<body>
	<!--header-->
  <div class="header ">
		<div class="container">
			<div class="head"><div class=" logo"><a href="index.jsp"><img src="img/logo.jpg" alt=""></a></div></div>
		</div>
		<div class="header-top">
			<div class="container">
					<div class="col-sm-5 col-md-offset-2 header-login float-right">
						<ul >
						
							<c:set var="isLogin" value="${not empty u_phone}" />
						<c:if test="${not isLogin}">
							<li id="login"><a href="user_login.jsp">登录</a></li>
							<li id="register"><a href="userReg.jsp">注册</a></li>
							<li>
								<form id="userForm" action="${pageContext.request.contextPath }/getTrolley.action" method="post">
									<input id="userFormJson" name="u_phone" type="hidden" value="${u_phone }"/>
									<input type="submit"  value="购物车" style="border:none;background:none;cursor:pointer;font-size:13px;color:white;"/>
								</form>
							</li>
							<li>
								<form id="userForm1" action="${pageContext.request.contextPath }/myHome.action" method="post">
									<input id="userFormJson" name="u_phone" type="hidden" value="${u_phone }"/>
									<input type="submit"  value="我的个人中心" style="border:none;background:none;cursor:pointer;font-size:13px;color:white;"/>
								</form>
							</li>
						</c:if>
						<c:if test="${isLogin}">
							<li id="welcome"><font size="2" color="white">欢迎${u_phone}</font></li>
							<li id="quit"><a href="quit.action">注销</a></li>
							<li>
								<form id="userForm" action="${pageContext.request.contextPath }/getTrolley.action" method="post">
									<input id="userFormJson" name="u_phone" type="hidden" value="${u_phone }"/>
									<input type="submit"  value="购物车" style="border:none;background:none;cursor:pointer;font-size:13px;color:white;"/>
								</form>
							</li>
							<li>
								<form id="userForm1" action="${pageContext.request.contextPath }/myHome.action" method="post">
									<input id="userFormJson" name="u_phone" type="hidden" value="${u_phone }"/>
									<input type="submit"  value="我的个人中心" style="border:none;background:none;cursor:pointer;font-size:13px;color:white;"/>
								</form>
							</li>

						</c:if>
						</ul>
						
					</div>			
					
					<div class="clearfix " ></div>
			</div>
			<div class="input-group float-md-right" style="width: 300px;margin-top: -30px;margin-right: 20px;"> 
				<form action="${pageContext.request.contextPath }/getProduct.action" method="post"class="form-inline">
				<span><input type="text" id="com_name" name="com_name"  class="form-control input-lg">
				<input type="submit" value="搜索" class="input-group-addon btn btn-danger "></span>
				</form>
			</div>
		</div>
			
	
			   <!--导航栏-->
                    <div class="goodsMenu">
			        <ul class="nav navbar-nav nav_1 " >
			        	<br />
			        	<li style="margin-left: 28px;">商品目录</li>
			        	<br />
			            <li class="dropdown mega-dropdown active" >
						    <a  href="#" class="dropdown-toggle " data-toggle="dropdown">女装/内衣<span class="caret"></span></a>				
							<!--标题导航栏所有产品-->
							<div class="dropdown-menu mega-dropdown-menu" style="margin-left:174px;margin-top:-92px;">
			                    <div class="menu-top" >
									<div class="col1 ">
										    
											<h5>当季流行</h5>
											<ul>	
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="夏季新品" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li> 
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="T恤" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="衬衫" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="外套" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="休闲裤" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="牛仔裤" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
											</ul>
										</div>
										<div class="col1 ">	
											<br />
											<h5>浪漫裙装</h5>
											<ul>	
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="连衣裙" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li> 
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="半身裙" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="牛仔裤" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="A字裙" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="荷叶边裙" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>精选上装</h5>
											<ul>	
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="羽绒服" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li> 
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="卫衣" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="风衣" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="针织衫" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
											</ul>
										</div>							
									</div> 
							</div>
							
						</li>
			            <br />

			            <li class="dropdown mega-dropdown active">
						    <a  href="#" class="dropdown-toggle " data-toggle="dropdown">男装/运动<span class="caret"></span></a>				
							<!--标题导航栏所有产品-->
							<div class="dropdown-menu mega-dropdown-menu" style="margin-left:174px;margin-top:-140px;">
			                    <div class="menu-top">
									<div class="col1 ">
										    
											<h5>当季流行</h5>
											<ul>	
												<li><a >夏季新品 &nbsp;&nbsp;&nbsp;</a></li> 
												<li><a href="product.jsp">T恤 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">夹克&nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">跑步鞋 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">自行车 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">牛仔裤&nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">	
											<br />
											<h5>男士内搭</h5>
											<ul>	
												<li><a href="product.jsp">短袖T恤 &nbsp;&nbsp;&nbsp;</a></li> 
												<li><a href="product.jsp">长袖衬衫&nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">背心&nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">卫衣&nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">毛衣 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>男士裤装</h5>
											<ul>	
												<li><a href="product.jsp">短裤&nbsp;&nbsp;&nbsp;</a></li> 
												<li><a href="product.jsp">休闲裤&nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">牛仔裤&nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">西裤 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">运动裤 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>户外用品</h5>
											<ul>	
												<li><a href="product.jsp">钓竿&nbsp;&nbsp;&nbsp;</a></li> 
												<li><a href="product.jsp">冲锋衣&nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">户外包&nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">帐篷&nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">刀具 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
							</div>
							
						</li>
			            <br />
			            <li class="dropdown mega-dropdown active">
						    <a  href="#" class="dropdown-toggle " data-toggle="dropdown">美妆/护理<span class="caret"></span></a>				
							<!--标题导航栏所有产品-->
							<div class="dropdown-menu mega-dropdown-menu" style="margin-left:174px;margin-top:-188px;">
			                    <div class="menu-top">
									<div class="col1 ">
										    
											<h5>护肤品</h5>
											<ul>	
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="面膜" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li> 
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="精华液" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="护手霜" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="爽肤水" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="洁面" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="卸妆" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
											</ul>
										</div>
										<div class="col1 ">	
											<br />
											<h5>彩妆</h5>
											<ul>	
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="香水" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li> 
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="BB霜" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="口红" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="隔离" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="眼影" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>美发护发</h5>
											<ul>	
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="洗发水"/>
														<input type="submit"  value="洗发水" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li> 
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="护发素" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="假发" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="护发精油" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
												<li>
													<form action="${pageContext.request.contextPath }/getProduct.action" method="post">
														<input id="com_name" name="com_name" type="hidden" value="非转基因"/>
														<input type="submit"  value="染发霜" style="border:none;background:none;cursor:pointer;font-size:17px;"/>
													</form>
												</li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>口腔护理</h5>
											<ul>	
												<li><a href="product.jsp">牙膏&nbsp;&nbsp;&nbsp;</a></li> 
												<li><a href="product.jsp">牙刷&nbsp;&nbsp;&nbsp;</a></li>
												<li><a href="product.jsp">口气清新剂&nbsp;&nbsp;&nbsp;</a></li>
												
											</ul>
										</div>
							</div>
							
						</li>
			            <br />
			            <li class="dropdown mega-dropdown active">
						    <a  href="#" class="dropdown-toggle " data-toggle="dropdown">男鞋/女鞋<span class="caret"></span></a>				
							<!--标题导航栏所有产品-->
							<div class="dropdown-menu mega-dropdown-menu" style="margin-left:174px;margin-top:-236px;">
			                    <div class="menu-top">
									<div class="col1 ">
										    
											<h5>当季流行</h5>
											<ul>	
												<li><a >夏季新品 &nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >T恤 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >夹克&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >跑步鞋 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >自行车 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >牛仔裤&nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">	
											<br />
											<h5>男士内搭</h5>
											<ul>	
												<li><a >短袖T恤 &nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >长袖衬衫&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >背心&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >卫衣&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >毛衣 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>男士裤装</h5>
											<ul>	
												<li><a >短裤&nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >休闲裤&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >牛仔裤&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >西裤 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >运动裤 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>户外用品</h5>
											<ul>	
												<li><a >钓竿&nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >冲锋衣&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >户外包&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >帐篷&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >刀具 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
							</div>
							
						</li>
			            <br />
			            <li class="dropdown mega-dropdown active">
						    <a  href="#" class="dropdown-toggle " data-toggle="dropdown">手机/数码<span class="caret"></span></a>				
							<!--标题导航栏所有产品-->
							<div class="dropdown-menu mega-dropdown-menu" style="margin-left:174px;margin-top:-284px;">
			                    <div class="menu-top">
									<div class="col1 ">
										    
											<h5>当季流行</h5>
											<ul>	
												<li><a >夏季新品 &nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >T恤 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >夹克&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >跑步鞋 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >自行车 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >牛仔裤&nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">	
											<br />
											<h5>男士内搭</h5>
											<ul>	
												<li><a >短袖T恤 &nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >长袖衬衫&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >背心&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >卫衣&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >毛衣 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>男士裤装</h5>
											<ul>	
												<li><a >短裤&nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >休闲裤&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >牛仔裤&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >西裤 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >运动裤 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>户外用品</h5>
											<ul>	
												<li><a >钓竿&nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >冲锋衣&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >户外包&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >帐篷&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >刀具 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
							</div>
							
						</li>
						<br />
			            <li class="dropdown mega-dropdown active">
						    <a  href="#" class="dropdown-toggle " data-toggle="dropdown">零食/茶酒<span class="caret"></span></a>				
							<!--标题导航栏所有产品-->
							<div class="dropdown-menu mega-dropdown-menu" style="margin-left:174px;margin-top:-332px;">
			                    <div class="menu-top">
									<div class="col1 ">
										    
											<h5>当季流行</h5>
											<ul>	
												<li><a >夏季新品 &nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >T恤 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >夹克&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >跑步鞋 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >自行车 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >牛仔裤&nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">	
											<br />
											<h5>男士内搭</h5>
											<ul>	
												<li><a >短袖T恤 &nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >长袖衬衫&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >背心&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >卫衣&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >毛衣 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>男士裤装</h5>
											<ul>	
												<li><a >短裤&nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >休闲裤&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >牛仔裤&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >西裤 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >运动裤 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>户外用品</h5>
											<ul>	
												<li><a >钓竿&nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >冲锋衣&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >户外包&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >帐篷&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >刀具 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
							</div>
							
						</li>
						<br />
			            <li class="dropdown mega-dropdown active">
						    <a  href="#" class="dropdown-toggle " data-toggle="dropdown">生鲜水果     <span class="caret"></span></a>				
							<!--标题导航栏所有产品-->
							<div class="dropdown-menu mega-dropdown-menu" style="margin-left:174px;margin-top:-380px;">
			                    <div class="menu-top">
									<div class="col1 ">
										    
											<h5>当季流行</h5>
											<ul>	
												<li><a >夏季新品 &nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >T恤 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >夹克&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >跑步鞋 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >自行车 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >牛仔裤&nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">	
											<br />
											<h5>男士内搭</h5>
											<ul>	
												<li><a >短袖T恤 &nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >长袖衬衫&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >背心&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >卫衣&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >毛衣 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>男士裤装</h5>
											<ul>	
												<li><a >短裤&nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >休闲裤&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >牛仔裤&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >西裤 &nbsp;&nbsp;&nbsp;</a></li>
												<li><a >运动裤 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
										<div class="col1 ">
											<br />
											<h5>户外用品</h5>
											<ul>	
												<li><a >钓竿&nbsp;&nbsp;&nbsp;</a></li> 
												<li><a >冲锋衣&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >户外包&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >帐篷&nbsp;&nbsp;&nbsp;</a></li>
												<li><a >刀具 &nbsp;&nbsp;&nbsp;</a></li>
											</ul>
										</div>
							</div>
							
						</li>
			            <br />
									            
							</div>				
						</li>
						
			        </ul>
			        </div>

<button class="back_to_top" ><img style="width: 40px;height: 40px;" src="img/back-top.jpg"/></button>
<script>
	    var backButton=$('.back_to_top');
    function backToTop() {
        $('html,body').animate({
            scrollTop: 0
        }, 800);
    }
    backButton.on('click', backToTop);
 
    $(window).on('scroll', function () {/*当滚动条的垂直位置大于浏览器所能看到的页面的那部分的高度时，回到顶部按钮就显示 */
        if ($(window).scrollTop() > $(window).height())
            backButton.fadeIn();
        else
            backButton.fadeOut();
    });
    $(window).trigger('scroll');/*触发滚动事件，避免刷新的时候显示回到顶部按钮*/

</script>


<!--
	轮播图
-->
                    
<div id="demo" class="carousel slide " style="margin-top: -380px;margin-left: 180px;" data-ride="carousel">
 
  <!-- 指示符 -->
  <ul class="carousel-indicators " style="margin-left: -120px;">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
 
  <!-- 轮播图片 -->
  <div class="carousel-inner" >
    <div class="carousel-item active">
      <img style="width: 930px;height: 390px;" src="img/lunbo1.jpg">
      
    </div>
    <div class="carousel-item">
      <img style="width: 930px;height: 390px;" src="img/lunbo2.jpg">
      
    </div>
    <div class="carousel-item">
      <img style="width: 930px;height: 390px;" src="img/lunbo3.jpg">
      
    </div>
  </div>
 
  <!-- 左右切换按钮 -->
  
  <a class="carousel-control-prev " style="margin-left: -60px;" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon" ></span>
  </a>
  <a class="carousel-control-next "  href="#demo" data-slide="next">
    <span class="carousel-control-next-icon" ></span>
  </a>
 </div>		        
<br /><br />
<div class="float-right">
<img style="margin-top:-730px ;margin-right: -200px;width: 200px;"  src="img/headAd1.jpg" />
<img style="margin-top:-230px; margin-right: 40px;width: 200px;" src="img/headAd2.jpg" />
</div>

<ul class="nav navbar-nav nav_1 ">
<div  style="float: left;width:980px;height:700px; margin-top: 20px; display: inline-block;white-space: nowrap;">
		
			<div style="float:left;height:auto;">
				<div class="goods">
				<li><a href="commodity.action?com_no=${comVo.getCom_no()}  "><img alt="" src="${comVo.getPictureurl() }" style="width: 200px; height: 200px;margin-left: 30px;"></a></li>
					<div style="margin-left:52px;">
					<li>${comVo.getCom_name() }</li>
					<li>商品ID</li>
					<li>商品价格</li>
					<li>商品介绍</li>
					</div>
				</ul>	
				
				<ul style="list-style: none;display: inline-block;">
					<li><a href="commodity.jsp"><img alt="" src="img/11.webp.jpg" style="width: 200px; height: 200px;"></a></li>
					<div style="margin-left:22px;">
					<li>商品ID</li>
					<li>商品价格</li>
					<li>商品介绍</li>
					</div>
				</ul>
				
				<ul style="list-style: none;display: inline-block;">
					<li><a href="commodity.jsp"><img alt="" src="img/11.webp.jpg" style="width: 200px; height: 200px;"></a></li>
					<div style="margin-left:22px;">
					<li>商品ID</li>
					<li>商品价格</li>
					<li>商品介绍</li>
					</div>
				</ul>
				
				<ul style="list-style: none;display: inline-block;">
					<li><a href="commodity.jsp"><img alt="" src="img/4.webp.jpg" style="width: 200px; height: 200px;"></a></li>
					<div style="margin-left:22px;">
					<li>商品ID</li>
					<li>商品价格</li>
					<li>商品介绍</li>
					</div>
				</ul>
				
				<ul style="list-style: none;display: inline-block;">
					<li><a href="commodity.jsp"><img alt="" src="img/5.webp.jpg" style="width: 200px; height: 200px;"></a></li>
					<div style="margin-left:22px;">
					<li>商品ID</li>
					<li>商品价格</li>
					<li>商品介绍</li>
					</div>
				</ul>
				</div>
			</div>
		
		    <div style="float:left;height:auto;margin-top: 40px">
				<div class="goods">
				<ul style="list-style: none;display: inline-block;">
					<li><a href="commodity.jsp"><img alt="" src="img/6.webp.jpg" style="width: 200px; height: 200px;margin-left: 30px;"></a></li>
					<div style="margin-left:52px;">
					<li>商品ID</li>
					<li>商品价格</li>
					<li>商品介绍</li>
					</div>
				</ul>	
				
				<ul style="list-style: none;display: inline-block;">
					<li><a href="commodity.jsp"><img alt="" src="img/7.webp.jpg" style="width: 200px; height: 200px;"></a></li>
					<div style="margin-left:22px;">
					<li>商品ID</li>
					<li>商品价格</li>
					<li>商品介绍</li>
					</div>
				</ul>
				
				<ul style="list-style: none;display: inline-block;">
					<li><a href="commodity.jsp"><img alt="" src="img/8.webp.jpg" style="width: 200px; height: 200px;"></a></li>
					<div style="margin-left:22px;">
					<li>商品ID</li>
					<li>商品价格</li>
					<li>商品介绍</li>
					</div>
				</ul>
				
				<ul style="list-style: none;display: inline-block;">
					<li><a href="commodity.jsp"><img alt="" src="img/9.webp.jpg" style="width: 200px; height: 200px;"></a></li>
					<div style="margin-left:22px;">
					<li>商品ID</li>
					<li>商品价格</li>
					<li>商品介绍</li>
					</div>
				</ul>
				
				<ul style="list-style: none;display: inline-block;">
					<li><a href="commodity.jsp"><img alt="" src="img/10.webp.jpg" style="width: 200px; height: 200px;"></a></li>
					<div style="margin-left:22px;">
					<li>商品ID</li>
					<li>商品价格</li>
					<li>商品介绍</li>
					</div>
				</ul>
				</div>
			</div>
	</div>
			<!--过渡-->
	<div class="container">
		<div class="brand">			
			<div class="clearfix"></div>
		</div>
	</div>
	
    <!--脚页-->
    <div class="footer " style="width: 1349px;">
        <center>
            <div class="footer-bottom"><p style="color: white;">乐鲜生活电子商城</p></div>
        </center>
    </div>
</body>
	<!--light-box-files -->
    <script type="text/javascript" charset="utf-8">
    $(".h_nav li a").click(function(){
		var vtext=$(this).text()
		$.post(
			"gs?op=sel",
			{"vtext":vtext},
			function(data){
				if(data.flag){//如果查到了就跳转页面
					window.location.href="product.jsp"
				}
			},
			"json"
		)
	})
    </script>
</html>