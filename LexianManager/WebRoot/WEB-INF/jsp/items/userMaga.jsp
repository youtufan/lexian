<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.lexianmanager.po.*,java.util.*"%>
<!DOCTYPE html>
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
 
<title>用户管理</title>
</head>
<body>
	<section class="content">
		<div class="btn-group operation">

			<button id="btn_delete" type="button" class="btn btn-success">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>冻结
			</button>
		</div>

		<div class="modal fade" id="StopUser" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">确认要冻结吗？</h4>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button id="freeze" type="button" class="btn btn-danger"
							data-dismiss="modal"  >确认</button>
					</div>
				</div>
			</div>
		</div>

		<table id="users"
			class="table table-striped table-bordered row-border hover order-column"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>用户名</th>
					<th>姓名</th>
					<th>性别</th>
					<th>联系方式</th>
					<th>用户状态</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</section>
</body>
<%
	String usersString = (String) request.getAttribute("usersString");
	pageContext.setAttribute("usersString", usersString);
%>
<script>
	var usersString = '${usersString}';
	var data = new Array();
	var jsonObj = JSON.parse(usersString);//转换为json对象

	for (var i = 0; i < jsonObj.length; i++) {
		var user = new Array();
		user[0] = (jsonObj[i].u_name); //取json中的值
		user[2] = (jsonObj[i].sex);
		user[4] = (jsonObj[i].u_status);
		user[1] = (jsonObj[i].username);
		user[3] = (jsonObj[i].u_phone);
		data.push(user);
	}


	var titles = [ '用户名', '姓名', '性别', '联系方式', '用户状态' ]
	$(function() {
		var table = $('#users').DataTable({
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
		$('#users tbody').on('click', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				table.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});

		$('#btn_delete').click(function() {
			if (table.rows('.selected').data().length) {
				$("#StopUser").modal()
			} else {
				alert('请选择项目');
			}
		});
		$('#freeze').click(function() {
			var rowData=table.row('.selected').data()[3];
			var u_phone=rowData;
			var json = [];
	        var j = {};
	        j.u_phone = u_phone;
	        json.push(j);
	        
	        
			$.ajax({
				async:false,
			    cache: false,
		        type: "POST",
		        url: "${pageContext.request.contextPath }/freeze.action",
		        contentType: "application/json; charset=utf-8",
		        data: JSON.stringify(json),
		        dataType: "json",
		        success:function (result){
		        	var tds = Array.prototype.slice.call($('.selected td'));
		        	tds[4 ].innerHTML = 0;
		        }
		    });
		});
	})
</script>

</body>


</html>