<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>乐鲜生活电子商城</title>


<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"
	media="all" />
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

<style>
.goodsMenu ul li a {
	text-decoration: none;
}

.goodsMenu a:hover {
	color: #B21F2D;
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
.col1>li {
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
			<div class="head">
				<div class=" logo">
					<a href="index.jsp"><img src="img/logo.jpg" alt=""></a>
				</div>
			</div>
		</div>
		<div class="header-top">
			<div class="container">
				<div class="col-sm-5 col-md-offset-2 header-login float-right">
					<ul>

						<c:set var="isLogin" value="${not empty u_phone}" />
						<c:if test="${not isLogin}">
							<li id="login"><a href="denglu.action">登录</a></li>
							<li id="register"><a href="zhuce.action">注册</a></li>
							
						</c:if>
						<c:if test="${isLogin}">
							<li id="welcome"><font size="2" color="white">欢迎${u_phone}</font></li>
							<li id="quit"><a href="quit.action">注销</a></li>
							<li>
								<form id="userForm"
									action="${pageContext.request.contextPath }/getTrolley.action"
									method="post">
									<input id="userFormJson" name="u_phone" type="hidden"
										value="${u_phone }" /> <input type="submit" value="购物车"
										style="border: none; background: none; cursor: pointer; font-size: 13px; color: white;" />
								</form>
							</li>
							<li>
								<form id="userForm1"
									action="${pageContext.request.contextPath }/myHome.action"
									method="post">
									<input id="userFormJson" name="u_phone" type="hidden"
										value="${u_phone }" /> <input type="submit" value="我的个人中心"
										style="border: none; background: none; cursor: pointer; font-size: 13px; color: white;" />
								</form>
							</li>

						</c:if>
					</ul>

				</div>

				<div class="clearfix "></div>
			</div>
			<div class="input-group float-md-right"
				style="width: 300px; margin-top: -30px; margin-right: 20px;">
				<form action="${pageContext.request.contextPath }/getProduct.action"
					method="post" class="form-inline">
					<span><input type="text" id="com_name" name="com_name"
						class="form-control input-lg"> <input type="submit"
						value="搜索" class="input-group-addon btn btn-danger "></span>
				</form>
			</div>
		</div>


		<!--导航栏-->
		<div class="goodsMenu">
			<ul class="nav navbar-nav nav_1 ">
				<br />
				<li style="margin-left: 28px;">商品目录</li>
				<br />
				<li class="dropdown mega-dropdown active"><a href="#"
					class="dropdown-toggle " data-toggle="dropdown">营养膳食<span
						class="caret"></span></a> <!--标题导航栏所有产品-->
					<div class="dropdown-menu mega-dropdown-menu"
						style="margin-left: 174px; margin-top: -92px;">
						<div class="menu-top">
							<div class="col1 ">

								<h5><a href="byCategory.action?cat_id=52&type=2">营养早餐 &nbsp;&nbsp;&nbsp;</a></h5>
								
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=53&type=2">精品午餐 &nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=74&type=3">香肠 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=75&type=3">蛋糕 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=76&type=3">鸡蛋 &nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=54&type=2">健康晚餐 &nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=77&type=3">烧鸡 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=79&type=3">鱼翅 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=80&type=3">拉面 &nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
						</div>
					</div></li>
				<br />

				<li class="dropdown mega-dropdown active"><a href="#"
					class="dropdown-toggle " data-toggle="dropdown">学习装备<span
						class="caret"></span></a> <!--标题导航栏所有产品-->
					<div class="dropdown-menu mega-dropdown-menu"
						style="margin-left: 174px; margin-top: -140px;">
						<div class="menu-top">
							<div class="col1 ">

								<h5><a href="byCategory.action?cat_id=63&type=2">圆珠笔 &nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=68&type=3">圆珠笔 &nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=64&type=2">橡皮 &nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=68&type=3">橡皮 &nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
						</div></li>
				<br />
				<li class="dropdown mega-dropdown active"><a href="#"
					class="dropdown-toggle " data-toggle="dropdown">精致生活<span
						class="caret"></span></a> <!--标题导航栏所有产品-->
					<div class="dropdown-menu mega-dropdown-menu"
						style="margin-left: 174px; margin-top: -188px;">
						<div class="menu-top">
							<div class="col1 ">

								<h5><a href="byCategory.action?cat_id=136&type=2">洗发护肤 &nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=137&type=3">洗发水 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=138&type=3">护发素 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=139&type=3">沐浴露 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=140&type=3">香皂 &nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=141&type=2">女性护理 &nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=146&type=3">卫生巾 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=147&type=3">护垫 &nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=142&type=2">面部护肤&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=148&type=3">洗面奶 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=149&type=3">洁面乳 &nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=143&type=2">口腔护理&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=150&type=3">牙刷 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=151&type=3">牙膏&nbsp;&nbsp;&nbsp;</a></li>

								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=144&type=2">洗涤用品&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=150&type=3">洗衣粉 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=151&type=3">洗洁精&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=150&type=3">洗手液 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=151&type=3">洗衣液&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=150&type=3">洗衣皂 &nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=145&type=2">身体护理&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=151&type=3">花露水&nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
						</div></li>
				<br />
				<li class="dropdown mega-dropdown active"><a href="#"
					class="dropdown-toggle " data-toggle="dropdown">学习攻坚<span
						class="caret"></span></a> <!--标题导航栏所有产品-->
					<div class="dropdown-menu mega-dropdown-menu"
						style="margin-left: 174px; margin-top: -236px;">
						<div class="menu-top">
							<div class="col1 ">

								<h5><a href="byCategory.action?cat_id=65&type=2">语文材料&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=69&type=3">小学语文教材 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=70&type=3">初中语文教材&nbsp;&nbsp;&nbsp;</a></li>

								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=66&type=2">数学材料&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=71&type=3">小学数学教材 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=72&type=3">初中数学教材&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=83&type=3">大学数学教材&nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=189&type=2">科普漫画&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=194&type=3">少儿百科 &nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=192&type=2">儿童文学&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=195&type=3">童话故事 &nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=193&type=2">启蒙益智&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=196&type=3">成长认知 &nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
						</div></li>
				<br />
				<li class="dropdown mega-dropdown active"><a href="#"
					class="dropdown-toggle " data-toggle="dropdown">健康五谷<span
						class="caret"></span></a> <!--标题导航栏所有产品-->
					<div class="dropdown-menu mega-dropdown-menu"
						style="margin-left: 174px; margin-top: -284px;">
						<div class="menu-top">
							<div class="col1 ">

								<h5><a href="byCategory.action?cat_id=114&type=2">特产干货&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=118&type=3">葡萄干 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=119&type=3">白莲&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=120&type=3">墨鱼&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=121&type=3">菌菇&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=122&type=3">桂圆&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=123&type=3">银耳&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=124&type=3">腐竹 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=125&type=3">枣类&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=133&type=3">木耳&nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=115&type=2">食用油&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=126&type=3">茶油&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=127&type=3">葵花油&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=128&type=3">调和油&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=129&type=3">菜籽油 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=130&type=3">玉米油&nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=116&type=2">米面&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=131&type=3">米&nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=198&type=2">粗粮&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=199&type=3">绿豆&nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
						</div></li>
				<br />
				<li class="dropdown mega-dropdown active"><a href="#"
					class="dropdown-toggle " data-toggle="dropdown">家居保卫<span
						class="caret"></span></a> <!--标题导航栏所有产品-->
					<div class="dropdown-menu mega-dropdown-menu"
						style="margin-left: 174px; margin-top: -332px;">
						<div class="menu-top">
							<div class="col1 ">

								<h5><a href="byCategory.action?cat_id=160&type=2">纸巾&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=162&type=3">卷纸&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=163&type=3">手帕纸&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=164&type=3">湿巾&nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
						</div></li>
				<br />
				<li class="dropdown mega-dropdown active"><a href="#"
					class="dropdown-toggle " data-toggle="dropdown">校服文化 <span
						class="caret"></span></a> <!--标题导航栏所有产品-->
					<div class="dropdown-menu mega-dropdown-menu"
						style="margin-left: 174px; margin-top: -380px;">
						<div class="menu-top">
							<div class="col1 ">

								<h5><a href="byCategory.action?cat_id=201&type=2">上装&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=205&type=3">长袖衬衫&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=206&type=3">长袖毛线衫&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=207&type=3">西装上衣&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=208&type=3">呢子大衣&nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=202&type=2">下装&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=209&type=3">西装下装&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=210&type=3">男长裤&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="byCategory.action?cat_id=211&type=3">女长裤&nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
							<div class="col1 ">
								<br />
								<h5><a href="byCategory.action?cat_id=203&type=2">套装&nbsp;&nbsp;&nbsp;</a></h5>
								<ul>
									<li><a href="byCategory.action?cat_id=204&type=3">运动衫&nbsp;&nbsp;&nbsp;</a></li>
								</ul>
							</div>
						</div></li>
				<br />
		</div>
		</li>

		</ul>
	</div>

	<button class="back_to_top">
		<img style="width: 40px; height: 40px;" src="img/back-top.jpg" />
	</button>
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

	<div id="demo" class="carousel slide "
		style="margin-top: -380px; margin-left: 180px;" data-ride="carousel">

		<!-- 指示符 -->
		<ul class="carousel-indicators " style="margin-left: -120px;">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>

		<!-- 轮播图片 -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img style="width: 930px; height: 390px;" src="img/lun1.jpg">

			</div>
			<div class="carousel-item">
				<img style="width: 930px; height: 390px;" src="img/lun2.jpg">

			</div>
			<div class="carousel-item">
				<img style="width: 930px; height: 390px;" src="img/lun3.jpg">

			</div>
		</div>

		<!-- 左右切换按钮 -->

		<a class="carousel-control-prev " style="margin-left: -60px;"
			href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next " style="margin-right: 180px;"
			href="#demo" data-slide="next"> <span
			class="carousel-control-next-icon"></span>
		</a>
	</div>
	<br />
	<br />
	<div class="float-right">
		<img style="margin-top: -730px; margin-right: -200px; width: 200px;"
			src="img/ada1.jpg" /> <img
			style="margin-top: -280px; margin-right: 40px; width: 200px;"
			src="img/ada2.jpg" />
	</div>

	<ul class="nav navbar-nav nav_1 ">
		<div
			style="float: left; width: 980px; height: 700px; margin-top: 20px; display: inline-block; white-space: nowrap;">

			<div style="float: left; height: auto;">
				<div class="goods">
					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt="" src="img/bangong.jpg"
								style="width: 200px; height: 200px; margin-left: 30px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt="" src="img/chufang.jpg"
								style="width: 200px; height: 200px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt="" src="img/dianqi.jpg"
								style="width: 200px; height: 200px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt=""
								src="img/qingjie.jpg" style="width: 200px; height: 200px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="byCategory.action?cat_id=112&type=1"><img alt="" src="img/mimian.jpg"
								style="width: 200px; height: 200px;"></a></li>

					</ul>
				</div>
			</div>

			<div style="float: left; height: auto; margin-top: 40px">
				<div class="goods">
					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt="" src="img/jiaju.jpg"
								style="width: 200px; height: 200px; margin-left: 30px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt="" src="img/lingshi.jpg"
								style="width: 200px; height: 200px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt="" src="img/naizhi.jpg"
								style="width: 200px; height: 200px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt="" src="img/shuiguo.jpg"
								style="width: 200px; height: 200px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt="" src="img/yinliao.jpg"
								style="width: 200px; height: 200px;"></a></li>

					</ul>
				</div>
			</div>

			<div style="float: left; height: auto; margin-top: 40px">
				<div class="goods">
					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt="" src="img/you.jpg"
								style="width: 200px; height: 200px; margin-left: 30px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt="" src="img/naizhi.jpg"
								style="width: 200px; height: 200px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt="" src="img/baojian.png"
								style="width: 200px; height: 200px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt=""
								src="img/hufu.jpg" style="width: 200px; height: 200px;"></a></li>

					</ul>

					<ul style="list-style: none; display: inline-block;">
						<li><a href="commodity.jsp"><img alt=""
								src="img/huli.jpg" style="width: 200px; height: 200px;"></a></li>

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
				<div class="footer-bottom">
					<p style="color: white;">乐鲜生活电子商城</p>
				</div>
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