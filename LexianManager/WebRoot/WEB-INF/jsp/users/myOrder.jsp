<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html >
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>我的订单</title>
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
<body>
	
	
   <section class="cartMain">
   	<br />
   	<c:forEach items="${orderUserVoList}" var="orderUserVo">
   	<p style="margin-left: 200px;">门店名称：${orderUserVo.getSto_name()}</p>
        <div class="cartMain_hd" style="margin-left: 200px;">
            <ul class="order_lists cartTop">
                <li>商品</li>
                <li class="list_con">商品信息</li>
                
                <li class="list_price">单价</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">金额</li>
               
            </ul>
        </div>

        <div class="cartBox" style="width: 800px;margin-left: 200px;">

               
            <div class="order_content">
            <c:forEach items="${orderUserVo.getOrdersUserComListVo()}" var="ordersUserComListVo">
            <ul class="order_lists">
                   
                    <li class="list_con">
                        <div class="list_img"><a href="commodity.jsp"><img src="${ordersUserComListVo.getPictureurl()}" alt=""></a></div>
                        <div class="list_text"><a href="commodity.jsp">${ordersUserComListVo.getCom_name()}</a></div>
                    </li>
                    
                    <li class="list_price">
                        <p class="price">${ordersUserComListVo.getListprice()}</p>
                    </li>
                    <li class="list_amount">
                        <p style="margin-top: 20px;">${ordersUserComListVo.getAmount()}</p>
     
                    </li>
                    <li class="list_sum">
                        <p class="sum_price">${ordersUserComListVo.getOi_totalprice()}</p>
                    </li>
                    
                </ul>
              </c:forEach>
   
                <li class="list_op" style="list-style: none;">
                        <p class="del float-right"><a href="javascript:;" class="delBtn" style="text-decoration: none;">移除订单</a></p>
                    </li>
                   
            </div>
        </div>
  </c:forEach>
       
            
        </div>s
        <!--底部-->
       
    </section>
    <section class="model_bg"></section>
    <section class="my_model" >
        <p class="title">删除订单<span class="closeModel">X</span></p>
        <p>您确认要删除该订单吗？</p>
        <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
    </section>
	
    <script src="js/jquery.min.js"></script>
    <script src="js/carts.js"></script>
    
    

</body>
</html>