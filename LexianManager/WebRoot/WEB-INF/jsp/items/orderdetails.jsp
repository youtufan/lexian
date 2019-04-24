<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ page import="net.sf.json.JSONObject"%>
<!DOCTYPE html>
<html>
    <head>
          <meta charset="utf-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/main.css" />
    	<link rel="stylesheet" href="css/carts.css">
        
        <script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
        <script type="text/javascript" src="js/bootstrap.min.js" ></script>
        
        <meta http-equiv="Content-Type" content="text/css; charset=UTF-8">
    <style>
    	.card{
    		margin-left: 100px;height: 250px;
    		
    	}
    	.table tbody{
    		background-color: white;
    	}
    	
    </style>
    </head>
    
    <%
		String u_phone=(String)session.getAttribute("loginedUser");
		pageContext.setAttribute("u_phone", u_phone);
		int com_num = (Integer) request.getAttribute("com_num");
		String orderitemsString = (String) request.getAttribute("orderitemsString");
		pageContext.setAttribute("orderitemsString", orderitemsString);
		String commodity_picturesString = (String) request.getAttribute("commodity_picturesString");
		pageContext.setAttribute("commodity_picturesString", commodity_picturesString);
	%>
    
    <body>
<div class="row">
  


  <div class=col-lg-6>
 <table class="table table-striped">
    <thead>
      <tr>
        <th>商品</th>
        <th>商品简介</th>
        <th>单价</th>
        <th>数量</th>
        <th>小计</th>
      </tr>
    </thead>
    <tbody>
    <%
    	JSONArray jaoi = JSONArray.fromObject(orderitemsString);
    	JSONArray jacp = JSONArray.fromObject(commodity_picturesString);
    	String checko_no = "";
    	for(int i=0;i<com_num;i++)
    	{
    		JSONObject jooi = jaoi.getJSONObject(i);
    		JSONObject jocp = jacp.getJSONObject(i);
    		
    		String pictureurl = jocp.getString("picture_url");
        	pageContext.setAttribute("pictureurl", pictureurl);
			String introduce = jocp.getString("introduce");
			pageContext.setAttribute("introduce", introduce);
		 	String sto_name = jocp.getString("sto_name");
		 	pageContext.setAttribute("sto_name", sto_name);/* 
        	String com_no = jocp.getString("com_no");
        	pageContext.setAttribute("com_no", com_no); */
        	String order_no = jocp.getString("order_no");
        	pageContext.setAttribute("order_no", order_no);
        	
        	String listprice = jooi.getString("listprice");
        	pageContext.setAttribute("listprice", listprice);
        	String amount = jooi.getString("amount");
        	pageContext.setAttribute("amount", amount);
        	String totalprice = jooi.getString("oi_totalprice");
        	pageContext.setAttribute("totalprice", totalprice);
			if(!order_no.equals(checko_no)){
				checko_no = order_no;
    %>
       <tr>
        <td>${order_no }</td>
        <td>取货门店：${sto_name }</td>
      </tr>
      <%} %>
      <tr>
        <td><div class="list_img"><a href="javascript:;"><img src="${pictureurl }" alt=""></a></div></td>
        <td>${introduce }</td>
        <td>${listprice }</td>
        <td>${amount }</td>
        <td>${totalprice }</td>
      </tr>
      <%} %>
    </tbody>
  </table>

 </div>
    	</div>
    	<div class="row">
  <div class="offset-sm-1 col-lg-10">
    	<div class="card" style=" background-color: #DC3545;height: 150px;margin-right: 10px;margin-top: 15px;">
  <div class="card-block">
    <h3 style="margin-top: 40px;margin-right: 20px;margin-left: 20px;">订单总价：<span><strong id="totalPrice" class="text-light "style="font-size: larger;">244</strong>元</span></h3>
    <p class="card-text"></p>
  </div>
</div>
</div>
 	</body>
</html>