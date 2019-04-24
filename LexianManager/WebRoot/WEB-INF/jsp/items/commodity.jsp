<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>乐鲜生活</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/main.css" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style4.css" rel="stylesheet" type="text/css" media="all" />


<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/css; charset=UTF-8">

<style>
div>input {
	
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
	bottom: 5px;
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

figure, .card {
	margin-left: 100px;
	margin-top: 50px;
}

h2，h1 {
	margin-left: 70px;
	margin-top: 70px;
}

.top {
	margin-top: 35px;
	margin-left: 50px;
}

body {
	background: #EFEFEF;
}

span {
	font-size: larger;
}
</style>
</head>

<%
	String u_phone = (String) session.getAttribute("loginedUser");
	pageContext.setAttribute("u_phone", u_phone);
%>

<body>

	<div class="header ">
		<div class="container">
			<div class="head">
				<div class=" logo">
					<a href="index.jsp"><img src="img/logo.jpg" alt=""></a>
				</div>
			</div>
		</div>
		<div class="header-top" style="height: 60px;">
			<div class="container">
				<div class="col-sm-5 col-md-offset-2 header-login float-right ">
					<ul>
						<li><a href="index.jsp">首页</a></li>
						<li><a href="myHome.jsp">我的个人中心</a></li>
					</ul>
				</div>
				<div class="clearfix "></div>
			</div>

		</div>
	</div>
	<div class="row">
		<div class=col-lg-4>
			<figure class="figure "> <img
				src="${comDetail.getCommodityInfoVo().getPictureurl() }"
				class="img-responsive" alt="Responsive image" alt="A ."
				style="width: 600px; margin-left: 0;"> <figcaption
				class="figure-caption">lamer.</figcaption> </figure>
		</div>

		<div class="card card-inverse "
			style="margin-left: 200px; width: 800px; height: 200%;">
			<div class="card-block">
				<div class=" row top">
					<div class="col-lg-6">
						<h1 id="name">${comDetail.getCommodityInfoVo().getCom_name() }</h2>
					</div>
				</div>
				<div class=" row top">
					<div class="col-lg-6">

						<h3>
							价格：<span class="text-danger">¥</span><span
								class="cprice text-danger" id="price"></span>
							</h2>
					</div>
				</div>


				<div class=" row top">
					<div class="infotab">
						<ul class="nav nav-tabs nav-justified">
							<li class="nav-item col-lg-6"><a class="nav-link active"
								data-toggle="tab" href="#Info">商品详情</a></li>
							<li class="nav-item col-lg-6"><a class="nav-link"
								data-toggle="tab" href="#Comment">门店信息</a></li>

						</ul>
					</div>
				</div>

				<div class="tab-content">
					<div id="Info" class="container tab-pane active">
						<br>
						<!--
     	商品简介
     -->
						${comDetail.getCommodityInfoVo().getCom_name() }

					</div>
					<div id="Comment" class="container tab-pane fade">
						<br>
						<!--
      	门店
      -->

						<c:forEach items="${comDetail.getStoList()}" var="store"
							varStatus="status">
      门店${ status.index + 1} ${store.getSto_add() }  ${store.getSto_name() } 
    </br>
						</c:forEach>

						<button type="button" class="btn btn-danger btn-lg"
							data-toggle="modal" data-target="#myModal">查看门店</button>

					</div>

				</div>

				<div class="row top">

					<div class="col-lg-6">
						<h4>选择门店</h4>
						<hr class="m-lg-12">

						<c:forEach items="${comDetail.commodity_storeList}" var="com_sto"
							varStatus="status">

							<input type="radio" name="paixu" id="${com_sto.sto_no }"
								style="display: none;" value="${com_sto.com_price }"
								onchange="showPrice(this) ">
							<label for="${com_sto.getSto_no() }" style="cursor: pointer;">门店${ status.index + 1}
							</label>
						</c:forEach>
						<script>
							function showPrice(obj) {
								document.getElementById("price").innerHTML = obj.value;
								document.getElementById("listprice").value = obj.value;
								document.getElementById("sto_no").value = obj.id;
							}
						</script>
						<!-- <input type="submit" value="提交"/> -->


						<!--                <input type="radio" name="paixu" id="paixu1" checked="checked"style="display: none;" value="1">
                <label for="paixu1" style="cursor:pointer ;">门店一</label>
                <input type="radio" name="paixu" id="paixu2"style="display: none;">
                <label for="paixu2" style="cursor:pointer">门店二</label>
                <input type="radio" name="paixu" id="paixu3"style="display: none;">
                <label for="paixu3" style="cursor:pointer">门店三</label>  -->
					</div>
				</div>
			</div>

			<div class="row top">

				<div class="input-group input-group-sm col-lg-4 " style="">
					<span class="input-group-btn">
						<button class="btn btn-warning btn-lg" id="btn_decre"
							type="button" onclick="decre()">-</button>
					</span> <input type="text" value="1" style="width: 60px;" id="am"
						name="am" style="display: inline;"> <span
						class="input-group-btn">
						<button class="btn btn-warning btn-lg" id="btn_incre"
							type="button" onclick="add()">+</button>
					</span>
					<%--  ${comDetail.getCommodityInfoVo().getCom_no() } --%>
				</div>
				<form action="insertTrolley.action" name="commodity">
					<input type="hidden" name="u_phone" value="${u_phone }" /> <input
						type="hidden" name="com_no"
						value="${comDetail.commodityInfoVo.com_no }" /> <input
						type="hidden" name="amount" id="amount" value="1" /> <input
						type="hidden" name="sto_no" id="sto_no" /> <input type="hidden"
						name="listprice" id="listprice" /> <input type="submit"
						class="btn btn-danger btn-lg col-lg-4" value="加入购物车" />
				</form>

			</div>



		</div>
	</div>

	<div class="modal  bd-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true" id="myModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">

					<h4 class="modal-title">门店地址</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
					</button>
				</div>

				<div class="modal-body"
					style="height: 1000px; width: 700px; margin: 0">

					<div id="container" style="height: 1000px; width: 700px;"></div>

				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
	<script type="text/javascript"
		src="http://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
	<script type="text/javascript"
		src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
	<script type="text/javascript">
		var dom = document.getElementById("container");
		var myChart = echarts.init(dom);
		var app = {};
		option = null;
		var data = [

		{
			name : '桂林',
			value : 59
		},

		{
			name : '大庆',
			value : 279
		} ];
		var geoCoordMap = {

			'桂林' : [ 110.28, 25.29 ],

			'大庆' : [ 125.03, 46.58 ]
		};

		var convertData = function(data) {
			var res = [];
			for (var i = 0; i < data.length; i++) {
				var geoCoord = geoCoordMap[data[i].name];
				if (geoCoord) {
					res.push({
						name : data[i].name,
						value : geoCoord.concat(data[i].value)
					});
				}
			}
			return res;
		};

		option = {
			title : {
				text : '门店地址',
				subtext : 'store',
				sublink : 'http://www.pm25.in',
				left : 'center'
			},
			tooltip : {
				trigger : 'item'
			},
			bmap : {
				center : [ 104.114129, 37.550339 ],
				zoom : 5,
				roam : true,
				mapStyle : {
					styleJson : [ {
						'featureType' : 'water',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#d1d1d1'
						}
					}, {
						'featureType' : 'land',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#f3f3f3'
						}
					}, {
						'featureType' : 'railway',
						'elementType' : 'all',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'highway',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#fdfdfd'
						}
					}, {
						'featureType' : 'highway',
						'elementType' : 'labels',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'arterial',
						'elementType' : 'geometry',
						'stylers' : {
							'color' : '#fefefe'
						}
					}, {
						'featureType' : 'arterial',
						'elementType' : 'geometry.fill',
						'stylers' : {
							'color' : '#fefefe'
						}
					}, {
						'featureType' : 'poi',
						'elementType' : 'all',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'green',
						'elementType' : 'all',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'subway',
						'elementType' : 'all',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'manmade',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#d1d1d1'
						}
					}, {
						'featureType' : 'local',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#d1d1d1'
						}
					}, {
						'featureType' : 'arterial',
						'elementType' : 'labels',
						'stylers' : {
							'visibility' : 'off'
						}
					}, {
						'featureType' : 'boundary',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#fefefe'
						}
					}, {
						'featureType' : 'building',
						'elementType' : 'all',
						'stylers' : {
							'color' : '#d1d1d1'
						}
					}, {
						'featureType' : 'label',
						'elementType' : 'labels.text.fill',
						'stylers' : {
							'color' : '#999999'
						}
					} ]
				}
			},
			series : [ {
				name : 'pm2.5',
				type : 'scatter',
				coordinateSystem : 'bmap',
				data : convertData(data),
				symbolSize : function(val) {
					return val[2] / 10;
				},
				label : {
					normal : {
						formatter : '{b}',
						position : 'right',
						show : false
					},
					emphasis : {
						show : true
					}
				},
				itemStyle : {
					normal : {
						color : 'purple'
					}
				}
			}, {

				type : 'effectScatter',
				coordinateSystem : 'bmap',
				data : convertData(data.sort(function(a, b) {
					return b.value - a.value;
				}).slice(0, 6)),
				symbolSize : function(val) {
					return val[2] / 10;
				},
				showEffectOn : 'render',
				rippleEffect : {
					brushType : 'stroke'
				},
				hoverAnimation : true,
				label : {
					normal : {
						formatter : '{b}',
						position : 'right',
						show : true
					}
				},
				itemStyle : {
					normal : {
						color : 'purple',
						shadowBlur : 10,
						shadowColor : '#333'
					}
				},
				zlevel : 1
			} ]
		};
		;
		if (option && typeof option === "object") {
			myChart.setOption(option, true);
		}

		function decre() {
			if (document.getElementById("am").value == 1) {
				$("#btn_decre").attr("disabled", true);
			} else {

				var valu = document.getElementById("am").value;

				valu--;
				document.getElementById("am").value = valu;

			}
			document.getElementById("amount").value = document
					.getElementById("am").value;
		}

		function add() {
			if (document.getElementById("am").value == 1) {
				$('#btn_decre').removeAttr("disabled");
			}

			var val = document.getElementById("am").value;

			val++;
			document.getElementById("am").value = val;
			document.getElementById("amount").value = document
					.getElementById("am").value;
		}
	</script>
	<!--过渡-->
	<div class="container">
		<div class="brand">
			<div class="clearfix"></div>
		</div>
	</div>
	<!--页脚-->
	<div class="footer">
		<center>
			<div class="footer-bottom">
				<p style="color: white;">乐鲜生活电子商城</p>
			</div>
		</center>
	</div>
	<!--页脚-->
</body>
</html>