<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="net.sf.json.JSONArray"%>
<%@ page import="net.sf.json.JSONObject"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>订单确认</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/check.css" />
<link rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/wow.min.js"></script>
<meta http-equiv="Content-Type" content="text/css; charset=UTF-8">
<style>
.card {
	width: 500px;
	float: right;
	text-align: right;
	padding-right: 50px;
}

div {
	margin: 30px;
}

div>input {
	display: none;
}

div>label {
	position: relative;
	margin-right: 34px;
	font-size: larger;
}

div>label::before {
	display: inline-block;
	content: "";
	width: 16px;
	height: 16px;
	border-radius: 50%;
	border: 1px solid rgb(219, 219, 219);
	margin-right: 6px;
	vertical-align: bottom;
}

div>input:checked+label::before {
	background-color: rgb(239, 66, 56);
}

div>input:checked+label::after {
	display: inline-block;
	content: "";
	width: 6px;
	height: 6px;
	border-radius: 50%;
	position: absolute;
	left: 5px;
	bottom: 80px;
	background-color: white;
}

.form-control {
	width: 200px;
	height: 60px;
	border-color: #C82333;
	border-width: medium;
	margin-top: 30px;
	text-align: center;
	font-size: larger;
}

td {
	font-size: larger;
	margin-right: -20px;
	padding: 0;
}

th {
	margin: 0;
	padding: 0;
}

img {
	width: 30%;
	height: 30%;
	padding: 0;
	margin: 0;
}

.table .table-striped {
	width: 200%;
}
</style>
<script>
	
		
	
	</script>
</head>


<%
		String u_phone=(String)session.getAttribute("loginedUser");
		pageContext.setAttribute("u_phone", u_phone);
		int com_num = (Integer) request.getAttribute("com_num");
		int store_num = (Integer) request.getAttribute("store_num");
		pageContext.setAttribute("store_num", store_num);
		String orderitemsString = (String) request.getAttribute("orderitemsString");
		pageContext.setAttribute("orderitemsString", orderitemsString);
		String commodity_picturesString = (String) request.getAttribute("commodity_picturesString");
		pageContext.setAttribute("commodity_picturesString", commodity_picturesString);
	%>
<script type="text/javascript">
		 	var json = [];
	        var j = {};
	        j.store_num = ${store_num };
			json.push(j);
			var j = {};
    </script>

<body>
	<form action="${pageContext.request.contextPath }/checkDetail.action">
		<div class="container" style="margin-left: 130px; width: 250%;">
			<div>
				<h5>支付方式</h5>
				<hr class="m-lg-2">
				<div class="payment-methods fix">
					<div class="single-payment cheque">
						<button class="select-btn active">
							<span class="check-box"></span>PayPal
						</button>
						<p>Please send your cheque to Store Name, Store Street, Store
							Town, Store State / County, Store Postcode.</p>
					</div>

					<div class="single-payment other">
						<div class="wrapper">
							<a href="#" class="paypal"><img src="img/paypal.png"
								alt="paypal" / style="width: 100%; height: 100%;"></a> <a
								href="#" class="visa"><img src="img/visa.png" alt="visa" /></a>
							<a href="#" class="mastercard"><img src="img/mastercard.png"
								alt="mastercard" /></a> <a href="#" class="express"><img
								src="img/express.png" alt="express" /></a> <a href="#" class="jcb"><img
								src="img/jcb.png" alt="jcb" /></a>
						</div>

					</div>
				</div>
			</div>
			<div>
				<h5>取货方式</h5>
				<hr class="m-lg-2">
				<input type="text" class="form-control " placeholder="到店取货"
					style="width: 150px;">
			</div>
			<div class=time>
				<h5>取货时间</h5>
				<hr class="m-lg-2">

				<div>
					<input type="radio" name="paixu" id="today" checked> <label
						for="today" style="cursor: pointer">当天</label> <input type="radio"
						name="paixu" id="tday"> <label for="tday"
						style="cursor: pointer">三天内</label> <input type="radio"
						name="paixu" id="wday"> <label for="wday"
						style="cursor: pointer">一周内</label>
				</div>


			</div>
			<div>
				<h4 style="margin-bottom: 20px;">确认订单信息</h4>
				<%
		String[] x = new String[store_num];//存放不同门店名
    	JSONArray jaoi = JSONArray.fromObject(orderitemsString);
    	JSONArray jacp = JSONArray.fromObject(commodity_picturesString);
    	double total_amount=0; 
    	for(int j=0;j<store_num;j++){
    	for(int i=0;i<com_num;i++)
    	{
    		JSONObject jooi = jaoi.getJSONObject(i);
    		JSONObject jocp = jacp.getJSONObject(i);
    		
    		String pictureurl = jocp.getString("picture_url");
        	pageContext.setAttribute("pictureurl", pictureurl);
			String introduce = jocp.getString("introduce");
			pageContext.setAttribute("introduce", introduce);
		 	String sto_name = jocp.getString("sto_name");
		 	pageContext.setAttribute("sto_name", sto_name);
        	String order_no = jocp.getString("order_no");
        	pageContext.setAttribute("order_no", order_no);
        	pageContext.setAttribute("order_nox", "o_no"+j);
        	
        	String listprice = jooi.getString("listprice");
        	pageContext.setAttribute("listprice", listprice);
        	String amount = jooi.getString("amount");
        	pageContext.setAttribute("amount", amount);
        	String totalprice = jooi.getString("oi_totalprice");
        	pageContext.setAttribute("totalprice", totalprice);
        	if(x[j]==null)
			{
        		int k=0;
            	for(;k<store_num;k++){
            			if(sto_name.equals(x[k])){
            				break;
            			}
            	}
            	if(k==store_num){
            		x[j]=sto_name;//该门店的第一件商品
            		%>
				<script>
	        		j.o_no = '${order_no }';
        			json.push(j);
        			var j = {};
            		</script>
            	<input name="${order_nox }" value="${order_no }">
				<h5>
					订单编号：<span><strong id="ono">${order_no }</strong></span>
				</h5>
				<h5>
					取货门店：<span><strong id="ono">${sto_name }</strong></span>
				</h5>
				<table class="table table-striped" style="">
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
            	}
			}
        		if(sto_name.equals(x[j])){
                	total_amount+=Double.parseDouble(totalprice);
    	    		%>
						<tr>
							<td><div class="list_img">
									<a href="javascript:;"><img src="${pictureurl }" alt=""
										style=""></a>
								</div></td>
							<td>${introduce }</td>
							<td>${listprice }</td>
							<td>${amount }</td>
							<td>${totalprice }</td>
						</tr>
						<%
    			}
      		}%>
					</tbody>
				</table>
				<%
      	}
    	DecimalFormat df=new DecimalFormat(".##");
    	String st=df.format(total_amount);
    	pageContext.setAttribute("total_amount", st);
      %>
			</div>
			<div class="card" style="border-color: #FF4400;">
				<div class="card-block">
					<h3>
						应付总额：<span><strong id="totalPrice" class="text-danger">${total_amount }</strong>元</span>
					</h3>
					<p class="card-text"></p>
					<button type="button" class="btn btn-light center-block"
						style="text-align: center;">返回购物车</button>
					<button id="submit" type="button"
						class="btn btn-danger center-block" data-toggle="modal"
						style="text-align: center;">提交订单</button>
				</div>
			</div>


		</div>

		<section class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">支付成功！</h3>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- 模态框主体 -->
					<div class="modal-body">
						<h5>请在您选择的时间内完成取货！</h5>
					</div>

					<!-- 模态框底部 -->
					<div class="modal-footer">
						<a type="button" class="btn btn-danger" href="myHome.action?u_phone=${u_phone }">查看订单</a>
						<a type="button" class="btn btn-warning" href="">继续购物</a>
					</div>
				</div>
			</div>
		</section>
	</form>

	<script type="text/javascript">
	 $("#submit").click(function(){
			$.ajax({
				async:false,
			    cache: false,
		        type: "POST",
		        url: "${pageContext.request.contextPath }/pay.action",
		        contentType: "application/json; charset=utf-8",
		        data: JSON.stringify(json),
		        dataType: "json",
		        success:function (result){
					$("#myModal").modal();
		        }
		    });
	    });
	</script>

</body>
</html>