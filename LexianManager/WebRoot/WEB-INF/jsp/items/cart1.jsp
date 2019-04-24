<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ page import="net.sf.json.JSONObject"%>
<!doctype html>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物车</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
    <link href="css/style4.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/carts.css">
     <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/main.css" />
      
        <script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
        <script type="text/javascript" src="js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="js/carts.js"></script>
      
        <meta http-equiv="Content-Type" content="text/css; charset=UTF-8">
</head>
	<%
		String u_phone=(String)session.getAttribute("loginedUser");
		pageContext.setAttribute("u_phone", u_phone);
		String trolleysString = (String) request.getAttribute("trolleysString");
		pageContext.setAttribute("trolleysString", trolleysString);
		String commoditysString = (String) request.getAttribute("commoditysString");
		pageContext.setAttribute("commoditysString", commoditysString);
	%>
<body>
	<div class="header ">
		<div class="container">
			<div class="head"><div class=" logo"><a href="index.jsp"><img src="img/logo.jpg" alt=""></a></div></div>
		</div>
		<div class="header-top">
			<div class="container">
					<div class="col-sm-5 col-md-offset-2 header-login float-right ">
						<ul >
							<%-- <!--
                            	<%UserBean ub=(UserBean)session.getAttribute("ub");
								if(ub==null){								
							%>
							<%
								}
							%>
                            --> --%>
						<c:set var="isLogin" value="${not empty u_phone}" />
						<c:if test="${not isLogin}">
							<li id="login"><a href="user_login.jsp">登录</a></li>
							<li id="register"><a href="userReg.jsp">注册</a></li>
							<li><a href="cart.jsp">购物车</a></li>
							<li><a href="myHome.action?u_phone=${u_phone }">我的个人中心</a></li>
						</c:if>
						<c:if test="${isLogin}">
							<li id="quit"><a href="returnIndex.action">首页</a></li>
							<li><a href="myHome.action?u_phone=${u_phone }">我的个人中心</a></li>

						</c:if>
						</ul>
					</div>		
					<div class="clearfix " ></div>
			</div>
			
		</div>
	</div>
	
   <section class="cartMain">
        <div class="cartMain_hd">
            <ul class="order_lists cartTop">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                    <label for="all"></label>
                    全选
                </li>
                <li class="list_con">商品信息</li>
                <li class="list_info">门店</li>
                <li class="list_price">单价</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">金额</li>
                <li class="list_op">操作</li>
            </ul>
        </div>

        <div class="cartBox">

            <form id="com_Form" action="${pageContext.request.contextPath }/getUTrolley.action" method="post" >   
            <div class="order_content">
            <% 
            JSONArray jat = JSONArray.fromObject(trolleysString);
            JSONArray jac = JSONArray.fromObject(commoditysString);
            for(int i=0;i<jat.size();i++){ 
            	JSONObject jot = jat.getJSONObject(i);
            	JSONObject joc = jac.getJSONObject(i);
            	String pictureurl = joc.getString("pictureurl");
            	pageContext.setAttribute("pictureurl", pictureurl.substring(1));
   			 	String introduce = joc.getString("introduce");
   			 	pageContext.setAttribute("introduce", introduce);
			 	String sto_name = joc.getString("sto_name");
			 	pageContext.setAttribute("sto_name", sto_name);
   			 	String sto_add = joc.getString("sto_add");
            	pageContext.setAttribute("sto_add", sto_add);
            	String com_no = jot.getString("com_no");
            	pageContext.setAttribute("com_no", com_no);
            	String sto_no = jot.getString("sto_no");
            	pageContext.setAttribute("sto_no", sto_no);
            	String listprice = jot.getString("listprice");
            	pageContext.setAttribute("listprice", listprice);
            	String amount = jot.getString("amount");
            	pageContext.setAttribute("amount", amount);
            	String totalprice = jot.getString("totalprice");
            	pageContext.setAttribute("totalprice", totalprice);
            	
            	pageContext.setAttribute("com_nox", "com_no"+i);
            	pageContext.setAttribute("sto_nox", "sto_no"+i);
            	pageContext.setAttribute("pictureurlx", "pictureurl"+i);
            	pageContext.setAttribute("checkbox", "checkbox"+i);
            	pageContext.setAttribute("checkboxx", "checkboxx"+i);
            	pageContext.setAttribute("introducex", "introduce"+i);
            	pageContext.setAttribute("listpricex", "listprice"+i);
            	pageContext.setAttribute("amountx", "amount"+i);
            	pageContext.setAttribute("totalpricex", "totalprice"+i);
            	pageContext.setAttribute("sto_addx", "sto_add"+i);
            	pageContext.setAttribute("sto_namex", "sto_name"+i);
            	pageContext.setAttribute("size", jat.size());
            %>
				<ul class="order_lists">
                    <li class="list_chk">
                    	<input type="hidden" name="${sto_namex }" value="${sto_name }">	
                    	<input type="hidden" name="${pictureurlx }" value="${pictureurl }">	
                    	<input type="hidden" name="${com_nox }" value="${com_no }">
                    	<input type="hidden" name="${sto_nox }" value="${sto_no }">
                    	<input type="hidden" name="size" value="${size }"> 
                        <input type="checkbox" id="${checkbox }" name="${checkboxx }" value="${com_no }" class="son_check" >
                        <label for="${checkbox }" ></label>
                    </li>
                    <li class="list_con">
                        <div class="list_img"><a href="javascript:;"><img src="${pictureurl }" alt=""></a></div>
                        <div class="list_text"><input type="text" name="${introducex }" value="${introduce }" readonly="readonly" style="height:50px;width: 250px;border:none;" ></div>
                    	
                    </li>
                    <li class="list_info">
                        <textarea name="${sto_addx }" cols="20" rows="6" style="height:50px;width: 250px;border:none;">${sto_add }</textarea>
                        <textarea name="${sto_namex }" cols="20" rows="6" style="height:50px;width: 250px;border:none;">${sto_name }</textarea>
                        <input type="text" name="${sto_addx }" value="${sto_add }"style="display:none" >
                        <input type="text" name="${sto_namex }" value="${sto_name }" style="display:none" >
                    </li>
                    <li class="list_price">
                        <textarea class="price" name="${listpricex }" style="border:none;">￥${listprice }</textarea>
                    </li>
                    <li class="list_amount">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce reSty">-</a>
                            <input type="text" name="${amountx }" value="${amount }" class="sum">
                            <a href="javascript:void();" class="plus">+</a>
                        </div>
                    </li>
                    <li class="list_sum">
                        <textarea class="sum_price" name="${totalpricex }" style="border:none;">￥${totalprice }</textarea>
                    </li>
                    <li class="list_op">
                        <p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p>
                    </li>
                </ul>
			<% }%>
            </div>
        <!--底部-->
        <div class="bar-wrapper">
            <div class="bar-right">
                <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
                <input class="calBtn "  type="submit" value="结算">
            </div>
        </div>
		</form>
        </div>

       
            
    </section>
    <section class="model_bg"></section>
    <section class="my_model">
        <p class="title">删除宝贝<span class="closeModel">X</span></p>
        <p>您确认要删除该宝贝吗？</p>
        <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
    </section>
	
    <script src="js/jquery.min.js"></script>
    <script src="js/carts.js"></script>
    
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
<!-- <script type="text/javascript">
var i = '${checkboxx}';
doucument.getElementById(i).value="true"
</script> -->
</body>

</html>