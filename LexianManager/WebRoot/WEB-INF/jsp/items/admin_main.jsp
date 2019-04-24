<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>乐鲜生活后台管理系统</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/main.css" />
        <script type="text/javascript" src="js/jquery-3.3.1.min.js" ></script>
        <script type="text/javascript" src="js/bootstrap.min.js" ></script>
        <meta http-equiv="Content-Type" content="text/css; charset=UTF-8">
  <style>
  
        html,body,iframe{width: 100%;height: 500px;padding: 0;margin-bottom: 50px;}
        #wrap{width: 100%;height: 100%;}
        iframe{border: none;
        display:block;border:0px}
 
 

  	 body {
  padding-top: 0;
}
.starter-template {

  text-align:justify;
}
  </style>
  
    </head>
    <body>
 <div class="jumbotron " style="text-align: center; padding-bottom: 20px;">

  <h1 class="display-4">乐鲜生活后台管理</h1>
 
 <hr class="m-y-md">
 <div class="container" style=" padding-right: 0;">
</div>

<!-- 导航栏-->
<div>
  <ul class="nav nav-pills  bg-dark navbar-dark visible-lg visible-md w-100 justify-content-around" role="navigation" >
    <li class="nav-item ">
    <a class="nav-link "  href="#user" data-toggle="tab" target="frame">用户管理</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#shop" data-toggle="tab">门店管理</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#commodity" data-toggle="tab">商品管理</a>
    </li>
    <li class="nav-item">
      <a class="nav-link " href="#order" data-toggle="tab">订单管理</a>
    </li>
  </ul>
</div>
</div>

<!-- 导航栏下分页-->
<div id="myTabContent" class="tab-content">
<div class="tab-pane " id="commodity">
        <iframe id="frame" onload="this.height=frame.document.body.scrollHeight" width=100% height=100%  border:0px src="admin_commodity.action" frameborder=auto></iframe>
    </div>
 <div class="tab-pane " id="order">
        <iframe id="frame" onload="this.height=frame.document.body.scrollHeight" width=100% height=100%  border:0px src="admin_order.action" frameborder=auto></iframe>
    </div>
    <div class="tab-pane " id="shop">
        <iframe id="frame" onload="this.height=frame.document.body.scrollHeight" width=100% height=100%  border:0px src="ShopMaga.action" frameborder=auto></iframe>
    </div>
    <div class="tab-pane " id="user">
        <iframe id="frame" onload="this.height=frame.document.body.scrollHeight" width=100% height=100%  border:0px src="admin_user.action" frameborder=auto></iframe>
    </div>
</div>


 	</body>

</html>