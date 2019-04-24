<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="js/jquery-3.3.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="js/bootstrap.js"></script>


<script src="js/bootstrap-table.min.js" type="text/javascript"></script>
<script src="js/bootstrap-table-locale-all.js" type="text/javascript"></script>

<script src="js/bootstrap-table-zh-CN.js"></script>
<script src="js/bootstrap-table-export.js"></script>
<script src="js/bootstrap-table-editable.js"></script>
<script src="js/bootstrap-table-editable.min.js"></script>
<script src="js/jquery.dataTables.min.js"></script>

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

<title>商品详细信息</title>
</head>
<body>
	<section class="content">
	<div class="btn-group operation">

		<button id="btn_edit" type="button" class="btn bg-info">
			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
		</button>
		<button id="btn_back" type="button" class="btn bg-info">
			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>返回
		</button>
	</div>

	<div class="modal fade" id="editGoodInfo" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">修改商品信息</h4>
				</div>
				<div id="editGoodModal" class="modal-body">
					<div class="form-horizontal">
						
						<div class="form-group">
							<label for="editGoodName" class="col-sm-4 control-label">商品名称:*</label>
							<div class="col-sm-10">
								<input class="form-control" id="editGoodName" type="text">
							</div>
						</div>
						<div class="form-group">
							<label for="editGoodprice" class="col-sm-4 control-label">商品价格:*</label>
							<div class="col-sm-10">
								<input class="form-control" id="editGoodPrice" type="text">
							</div>
						</div>
						<div class="form-group">
							<label for="editGoodNum" class="col-sm-4 control-label">商品数量:*</label>
							<div class="col-sm-10">
								<input class="form-control" id="editGoodNum" type="text">
							</div>
						</div>
						<div class="form-group">
							<label for="editGoodStates" class="col-sm-4 control-label">商品状态:*</label>
							<div class="col-sm-10">
								<input class="form-control" id="editGoodStates" type="number">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="center-block">
						<button id="cancelEdit" type="button" class="btn btn-default"
							data-dismiss="modal">取消</button>
						<button id="saveEdit" type="button" class="btn btn-success"
							data-dismiss="modal">保存</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<table id="goods"
		class="table table-striped table-bordered row-border hover order-column"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>商品ID</th>
				<th>商品名称</th>
				<th>商品价格</th>
				<th>商品数量</th>
				<th>商品状态</th>

			</tr>
		</thead>
		<tbody></tbody>
	</table>
	</section>
</body>
<script>
	var commodityString = '${jsonStr1}';
	var data = new Array();
	var jsonObj = JSON.parse(commodityString);//转换为json对象

	for (var i = 0; i < jsonObj.length; i++) {
		var commodity = new Array();
		commodity[0] = (jsonObj[i].com_no); //取json中的值
		commodity[1] = (jsonObj[i].com_name);
		commodity[2] = (jsonObj[i].com_price);
		commodity[3] = (jsonObj[i].com_amount);
		commodity[4] = (jsonObj[i].type);
		data.push(commodity);
	}
	/* 	var data = [ [ '三体', '刘慈欣', '39.00', '重庆出版社', '1' ] ] */
	var titles = [ '商品ID', '商品名称', '商品价格', '商品数量', '商品状态' ]
	$(function() {
		var table = $('#goods').DataTable({
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
				cell.innerHTML = i+1;
			});
		}).draw();
		$('#goods tbody').on('click', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				table.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});

		$('#btn_edit').click(function() {
			console.log('edit');
			if (table.rows('.selected').data().length) {
				$("#editGoodInfo").modal()
				var rowData = table.rows('.selected').data()[0];
				var inputs = $("#editGoodModal").find('input')
				for (var i = 0; i < inputs.length; i++) {
					$(inputs[i]).val(rowData[i+1])
				}
			} else {
				alert('请选择项目');
			}
		});
		$("#saveEdit")
				.click(
						function() {
							var GoodId=table.rows('.selected').data()[0][0];
							var editGoodName = $("#editGoodName").val()
							var editGoodPrice = $("#editGoodPrice").val()
							var editGoodNum = $("#editGoodNum").val()
							var editGoodStates = $("#editGoodStates").val()
							var newRowData = [].concat(
									GoodId,editGoodName, editGoodPrice, editGoodNum,
									editGoodStates);
							var tds = Array.prototype.slice
									.call($('.selected td'))
							for (var i = 0; i < newRowData.length; i++) {
								if (newRowData[i] !== '') {
									tds[i].innerHTML = newRowData[i];
								} else {
									alert(titles[i] + '内容不能为空')
								}
							}

							array = [];
							array.push({
								"GoodId":GoodId,
								"editGoodName" : editGoodName,
								"editGoodPrice" : editGoodPrice,
								"editGoodNum" : editGoodNum,
								"editGoodStates" : editGoodStates
							});

							$.ajax({
										url : "${pageContext.request.contextPath }/updateCom.action",
										data : JSON.stringify(array),
										dataType : 'text',
										type : "POST",
										contentType : "application/json; charset=utf-8",
										traditional : true,
										success : function() {

											alert("111");
										},

									});
						})
		$("#cancelEdit").click(function() {
			console.log('cancelAdd');
			$("#editGoodModal").find('input').val('')
		})
		$('#btn_back').click(function() {

							window.location.replace("${pageContext.request.contextPath }/ShopMaga.action");

						})
	})
</script>

</html>
</body>


</html>