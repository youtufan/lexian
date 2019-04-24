<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lexianmanager.po.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<title>产品页面</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
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
	setTimeout(hideURLbar, 0); }, false);
	function hideURLbar(){ window.scrollTo(0,1); } 
	</script>
	
	<!--- start-rate---->
	
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
	
	
</head>
	<%
		String u_phone=(String)session.getAttribute("loginedUser");
		pageContext.setAttribute("u_phone", u_phone);
	%>
<body>
	<!--header-->
	<div class="header">
		<div class="container">
			<div class="head"><div class=" logo"><a href="index.jsp"><img src="img/logo.jpg" alt=""></a></div></div>
		</div>
		<div class="header-top">
			<div class="container">
					<div class="col-sm-5 col-md-offset-2 header-login float-right">
						<ul >
							<li id="welcome"><font size="2" color="white">欢迎${u_phone}</font></li>
							
							<li><a href="quit.action">退出账户</a></li>
						</ul>
					</div>			
						
					<div class="clearfix"></div>
					<div class="input-group float-md-right" style="width: 300px;margin-top: -30px;margin-right: -50px;"> 
				<form action="${pageContext.request.contextPath }/getProduct.action" method="post"class="form-inline">
				<span><input type="text" id="com_name" name="com_name"  class="form-control input-lg">
				<input type="submit" value="搜索" class="input-group-addon btn btn-danger "></span>
				</form>
			</div>
			</div>
		</div>
		
	</div>	
	
	
	
	<!--banner-->
	<div class="banner-top ">
		<div class="container">
			<h1>商品页面</h1>
			<em></em>
		<h2><a href="index.jsp">首页</a><label>/</label>商品</h2>
		</div>
	</div>
	<!--content目录-->
	
	<ul class="nav navbar-nav nav_1 " style="list-style: none;display: inline-block;text-align:justify">
	<div  style="float: left;width:88%;height:700px; margin-top: 20px; margin-left:180px;display: inline-block;white-space: nowrap;">
	
	<c:forEach items="${commodityShowList }" var="commodity">
		<div style="float:left;height:auto;margin-left=20px;display: inline-block;text-align:justify">
				<div class="goods">
				<ul style="list-style: none;display: inline-block;text-align:justify">
					<li><a href="${pageContext.request.contextPath }/commodity.action?com_no=${commodity.com_no}"><img alt="" src="${commodity.pictureurl }" style="width: 200px; height: 200px;"></a></li>
					<div style="margin-left:22px;">
					<li>${commodity.com_name}</li>
					<li>￥${commodity.min_price }~￥${commodity.max_price }</li>
					</div>
				</ul>
				</div>
		</div>
	</c:forEach>
	
		<div class='page all'>
            <b>共${pageUtil.pageNumber}</b>件商品,当前第<span>${pageUtil.pageIndex}</span>页
               <a href="byCategory.action?pageIndex=1&cat_id=${pageUtil.cat_id }&type=${pageUtil.type }" class='first'>首页</a> 
                <a href="byCategory.action?pageIndex=${pageUtil.pageIndex>1?pageUtil.pageIndex-1:1}&cat_id=${pageUtil.cat_id }&type=${pageUtil.type }" class='pre'>上一页</a>
                <c:forEach begin="1" end="${pageUtil.pageCount}" var="i">  
                <a href="byCategory.action?pageIndex=${i}&cat_id=${pageUtil.cat_id }&type=${pageUtil.type }" style="text-decoration: none;">${i}</a>
                </c:forEach>
                    <a href="byCategory.action?pageIndex=${pageUtil.pageIndex<pageUtil.pageCount?pageUtil.pageIndex+1:pageUtil.pageCount}&cat_id=${pageUtil.cat_id }&type=${pageUtil.type }" class='next'>下一页</a>
                <a href="byCategory.action?pageIndex=${pageUtil.pageCount}&cat_id=${pageUtil.cat_id }&type=${pageUtil.type }" class='last'>末页</a>
        </div>
	</div>
	
	<%-- <!--<%	response.setIntHeader("refresh",1); %>--> --%>
	<!--首页 上一页 下一页 尾页 -->
	<center>
		<form action="gs?op=findall" method="post" name="mf">	
			<div style="position: absolute;left:500px;top:950px;">	
				<!--
                	<c:if test="${currentpage>1 }">
				 <a name="firstpage" href="gs?op=findall&cp=1"/>首页</a>&nbsp;&nbsp;&nbsp;
				 <a name="previpage" href="gs?op=findall&cp=${currentpage-1 }"/>上一页</a>&nbsp;&nbsp;&nbsp;
				 <!--用一张新的表单处理跳转的页面-->
				 <!--<input type="text" value="1" size="5" name="cp"/>
				 <input type="button" value="go" onclick="javascript:mf.submit()"/>
			</div>
			</c:if>-->
			
			<c:if test="${currentpage<allpage }">
				 <a name="nexpage" href="gs?op=findall&cp=${currentpage+1 }"/>下一页</a>&nbsp;&nbsp;&nbsp;
			 	<a name="lastpage" href="gs?op=findall&cp=${allpage }"/>尾页</a>&nbsp;&nbsp;&nbsp;
			 	<!--用一张新的表单处理跳转的页面-->
				 <input type="text" value="1" size="5" name="cp"/>
				 <input type="button" value="go" onclick="javascript:mf.submit()"/>
			</div>
			</c:if>
			<c:if test="${currentpage==1&&allpage==1 }">
				<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前商品数据量只有一页</a>&nbsp;&nbsp;&nbsp;
			</c:if>
		</form>
	</center>
	
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