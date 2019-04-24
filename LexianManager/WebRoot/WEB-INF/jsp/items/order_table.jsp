<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/main.css" />
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<meta http-equiv="Content-Type" content="text/css; charset=UTF-8">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap-table.min.css">
<link rel="stylesheet" href="css/bootstrap-table.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery.dataTables.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.content {
	margin: 50px auto;
	border: 1px solid #ccc;
}

.operation {
	margin: 10px;
}

.operation>button {
	margin: 10px;
}

#books_length {
	float: left;
	margin-left: 20px;
}

#books_filter {
	float: right;
	margin-right: 20px;
}

#books {
	margin: 5px;
}

.center-block {
	display: block;
	width: 21%;
	margin: auto;
}
</style>


</head>
<body style="overflow-x: hidden">
	<section class="content" style="margin: 0;">
		<div class="btn-group operation">

			<!-- 功能按键-->
			<button id="btn_delivery" type="button" class="btn bg-info"
				data-target="#myModal">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>发货
			</button>

			<button id="btn_delete" type="button" class="btn btn-success">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
			</button>

		</div>

		<!-- 发货模态框-->
		<div class="modal fade" id="deliveryModel" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">确认发货</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="saveEdit" type="button" class="btn btn-success"
							data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 删除订单模态框-->
		<div class="modal fade" id="deleteOrder" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">确认要删除吗？</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="delete" type="button" class="btn btn-danger"
							data-dismiss="modal">删除</button>
					</div>
				</div>
			</div>
		</div>

		<table id="orders"
			class="table table-striped table-bordered row-border hover order-column"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>订单编号</th>
					<th>用户ID</th>
					<th>取货门店</th>
					<th>订单总金</th>
					<th>支付类型</th>
					<th>配送类型</th>
					<th>订单状态</th>

				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</section>
</body>
<%
	String ordersString = (String) request.getAttribute("ordersString");
	pageContext.setAttribute("ordersString", ordersString);
%>
<script>
	var ordersString = '${ordersString}';
	var data = new Array();
	var jsonObj = JSON.parse(ordersString);//转换为json对象

	for (var i = 0; i < jsonObj.length; i++) {
		var order = new Array();
		order[0] = (jsonObj[i].o_no); //取json中的值
		order[2] = (jsonObj[i].sto_no);
		order[4] = (jsonObj[i].paymenttype);
		order[1] = (jsonObj[i].u_id);
		order[3] = (jsonObj[i].totalamount);
		order[5] = (jsonObj[i].deliverytype);
		order[6] = (jsonObj[i].o_states);
		data.push(order);
	}
	var titles = [ '订单编号', '用户ID', '取货门店', '订单总金', '支付类型', '配送类型', '订单状态' ]
	$(function() {
		var table = $('#orders').DataTable({
			data : data,
			"pagingType" : "full_numbers",
			"bSort" : true,
			"language" : {
				"sProcessing" : "处理中...",
				"sLengthMenu" : "显示 _MENU_ 项结果",
				"sZeroRecords" : "没有匹配结果",
				"sInfo" : "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				"sInfoEmpty" : "显示第 0 至 0 项结果，共 0 项",
				"sInfoFiltered" : "(由 _MAX_ 项结果过滤)",
				"sInfoPostFix" : "",
				"sSearch" : "搜索:",
				"sUrl" : "",
				"sEmptyTable" : "表中数据为空",
				"sLoadingRecords" : "载入中...",
				"sInfoThousands" : ",",
				"oPaginate" : {
					"sFirst" : "首页",
					"sPrevious" : "上页",
					"sNext" : "下页",
					"sLast" : "末页"
				},
				"oAria" : {
					"sSortAscending" : ": 以升序排列此列",
					"sSortDescending" : ": 以降序排列此列"
				}
			},
			"columnDefs" : [ {
				"searchable" : false,
				"orderable" : true,
				"targets" : 0
			} ],
			"order" : [ [ 1, 'asc' ] ]
		});
		table.on('order.dt search.dt', function() {
			table.column(0, {
				search : 'applied',
				order : 'unapplied'
			}).nodes().each(function(cell, i) {
				cell.innerHTML = i + 1;
			});
		}).draw();

		$('#orders tbody').on('click', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).toggleClass('selected');
			} else {
				table.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});

		$('#btn_delivery').click(function() {
			console.log('edit');
			if (table.rows('.selected').data().length) {
				$("#deliveryModel").modal()

			} else {
				alert('请选择项目');
			}
		});
		$("#saveEdit").click(function() {
			//实现发货
			if(table.row('.selected').data()[6] == "已付款"){
				var o_no=table.row('.selected').data()[0];
				var json = [];
		        var j = {};
		        j.o_no = o_no;
		        json.push(j);
		        
				$.ajax({
					async:false,
				    cache: false,
			        type: "POST",
			        url: "${pageContext.request.contextPath }/delivery.action",
			        contentType: "application/json; charset=utf-8",
			        data: JSON.stringify(json),
			        dataType: "json",
			        success:function (result){
			        	var tds = Array.prototype.slice.call($('.selected td'));
			        	tds[6 ].innerHTML = "已发货";
			        }
			    });
			}else{
				alert('订单'+table.row('.selected').data()[6]);
			}

		})

		$('#btn_delete').click(function() {
			if (table.rows('.selected').data().length) {
				$("#deleteOrder").modal()
			} else {
				alert('请选择项目');
			}
		});
		$('#delete').click(function() {
			table.row('.selected').remove().draw(false);
		});
	})
</script>

</html>
</body>


</html>
