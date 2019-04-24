<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

#Commoditys_length {
	float: left;
	margin-left: 20px;
}

#Commoditys_filter {
	float: right;
	margin-right: 20px;
}

#Commoditys {
	margin: 5px;
}

.center-block {
	display: block;
	width: 21%;
	margin: auto;
}
</style>

<title>测试</title>
</head>
<body>
	<section class="content">
		<div class="btn-group operation">
			<button id="btn_add" type="button" class="btn bg-primary">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
			</button>
			<button id="btn_edit" type="button" class="btn bg-info">
				<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
			</button>
			<button id="btn_delete" type="button" class="btn btn-success">
				<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
			</button>
		</div>
		<div class="modal fade" id="addCommodity" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">添加商品</h4>
					</div>
					<div id="addCommodityModal" class="modal-body">
						<div class="form-horizontal">
							<div class="form-group">
								<label for="CommodityID" class="col-sm-4 control-label">商品编号:*</label>
								<div class="col-sm-10">
									<input class="form-control" id="CommodityID" type="text">
								</div>
							</div>
							<div class="form-group">
								<label for="CommodityName" class="col-sm-4 control-label">商品名称:*</label>
								<div class="col-sm-10">
									<input class="form-control" id="CommodityName" type="text">
								</div>
							</div>
							<div class="form-group">
								<label for="CommodityType" class="col-sm-4 control-label">商品类别:*</label>
								<div class="col-sm-10">
									<input class="form-control" id="CommodityType" type="text">
								</div>
							</div>
							<div class="form-group">
								<label for="CommodityN" class="col-sm-4 control-label">商品简介:*</label>
								<div class="col-sm-10">
									<input class="form-control" id="CommodityN" type="text">
								</div>
							</div>
							<div class="form-group">
								<label for="CommodityPic" class="col-sm-4 control-label">商品主图片:*</label>
								<div class="col-sm-10">
									<input class="form-control" id="CommodityPic" type="text">
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div class="center-block">
							<button id="cancelAdd" type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
							<button id="addCommodityInfo" type="button"
								class="btn btn-success" data-dismiss="modal">保存</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="editCommodityInfo" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">修改商品信息</h4>
					</div>
					<div id="editCommodityModal" class="modal-body">
						<div class="form-horizontal">
							<div class="form-group">
								<label for="editCommodityID" class="col-sm-4 control-label">商品编号:*</label>
								<div class="col-sm-10">
									<input class="form-control" id="editCommodityID" type="text">
								</div>
							</div>
							<div class="form-group">
								<label for="editCommodityName" class="col-sm-4 control-label">商品名称:*</label>
								<div class="col-sm-10">
									<input class="form-control" id="editCommodityName" type="text">
								</div>
							</div>
							<div class="form-group">
								<label for="editCommodityType" class="col-sm-4 control-label">商品类别:*</label>
								<div class="col-sm-10">
									<input class="form-control" id="editCommodityType" type="text">
								</div>
							</div>
							<div class="form-group">
								<label for="editCommodityN" class="col-sm-4 control-label">商品简介:*</label>
								<div class="col-sm-10">
									<input class="form-control" id="editCommodityN" type="text">
								</div>
							</div>
							<div class="form-group">
								<label for="editCommodityPic" class="col-sm-4 control-label">商品主图片:*</label>
								<div class="col-sm-10">
									<input class="form-control" id="editCommodityPic" type="text">
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
		<div class="modal fade" id="deleteCommodity" role="dialog">
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
		<!-- 表格-->
		<table id="commodity"
			class="table table-striped table-bordered row-border hover order-column"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>商品编号</th>
					<th>商品名称</th>
					<th>商品类别</th>
					<th>商品简介</th>
					<th>商品主图片</th>

				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</section>

</body>
<%
	String commoditysString = (String) request.getAttribute("commoditysString");
	pageContext.setAttribute("commoditysString", commoditysString);
%>
<script>
  var data = [[ '三体', '刘慈欣', '39.00', '重庆商品简介', '982513213516']]
  var commoditysString = '${commoditysString}';
  var data=new Array();
  var jsonObj =  JSON.parse(commoditysString);//转换为json对象
  
  for(var i=0;i<jsonObj.length;i++){
  		var commodity=new Array();
  		commodity[0]=(jsonObj[i].com_no);  //取json中的值
  		commodity[2]=(jsonObj[i].cat_id);
  		commodity[4]=(jsonObj[i].pictureurl);
  		commodity[1]=(jsonObj[i].com_name);
  		commodity[3]=(jsonObj[i].introduce);
  		commodity[5] = (jsonObj[i].com_id);
  		data.push(commodity);
  }
  var titles = ['书名', '商品名称', '商品类别', '商品简介', '商品主图片']
  $(function () {
    var table = $('#commodity').DataTable({
      data: data,
      "pagingType": "full_numbers",
      "bSort": true,
      "language": {
        "sProcessing": "处理中...",
        "sLengthMenu": "显示 _MENU_ 项结果",
        "sZeroRecords": "没有匹配结果",
        "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
        "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
        "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
        "sInfoPostFix": "",
        "sSearch": "搜索:",
        "sUrl": "",
        "sEmptyTable": "表中数据为空",
        "sLoadingRecords": "载入中...",
        "sInfoThousands": ",",
        "oPaginate": {
            "sFirst": "首页",
            "sPrevious": "上页",
            "sNext": "下页",
            "sLast": "末页"
        },
        "oAria": {
            "sSortAscending": ": 以升序排列此列",
            "sSortDescending": ": 以降序排列此列"
        }
      },
      "columnDefs": [{
        "searchable": false,
        "orderable": true,
        "targets": 0
      }],
      "order": [[1, 'asc']]
    });
    table.on('order.dt search.dt', function() {
      table.column(0, {
        search: 'applied',
        order: 'unapplied'
      }).nodes().each(function(cell, i) {
        cell.innerHTML = i + 1;
      });
    }).draw();
    $('#commodity tbody').on('click', 'tr', function () {
      if ( $(this).hasClass('selected') ) {
        $(this).removeClass('selected');
      }
      else {
        table.$('tr.selected').removeClass('selected');
        $(this).addClass('selected');
      }
    });
    $("#cancelAdd").on('click', function() {
      console.log('cancelAdd');
      $("#addCommodityModal").find('input').val('')
    })
    $("#addCommodityInfo").on('click', function() {
      console.log('addCommodityInfo'); 
      if (data.length) {
        if ($("#addCommodityModal").find('input').val() !== '') {
          var CommodityID = $("#CommodityID").val()
          var CommodityName = $("#CommodityName").val()
          var CommodityType = $("#CommodityType").val()
          var CommodityN = $("#CommodityN").val()
          var CommodityPic = $("#CommodityPic").val()
          var addCommodityInfos = [].concat(CommodityID, CommodityName, CommodityType, CommodityN, CommodityPic);
          for (var i = 0; i < addCommodityInfos.length; i++) {
            if (addCommodityInfos[i] === '') {
              alert(titles[i] + '内容不能为空')
            }
          }
          var json = []
	      var j = {};
	      j.com_no = CommodityID;
	      j.com_name = CommodityName;
	      j.cat_id = CommodityType;
	      j.introduce = CommodityN;
	      j.pictureurl = CommodityPic;
	      json.push(j);
			$.ajax({
		        type: "POST",
		        url: "${pageContext.request.contextPath }/add_commodity.action",
		        contentType: "application/json; charset=utf-8",
		        data: JSON.stringify(json),
		        dataType: "json",
		        success:function (result){
		        	alert("新增成功!");
		        },
		        error:function (result){
		        	alert("新增失败!");
		        }
		    });
          table.row.add([CommodityID, CommodityName, CommodityType, CommodityN, CommodityPic]).draw();
          $("#addCommodityModal").find('input').val('')
        }
      } else {
        alert('请输入内容')
      }
    })
    $("#addCommoditysInfo").click();    
    $("#btn_add").click(function(){
      console.log('add');
      $("#addCommodity").modal()
    });
    $('#btn_edit').click(function () {
      console.log('edit');
      if (table.rows('.selected').data().length) {
        $("#editCommodityInfo").modal()
        var rowData = table.rows('.selected').data()[0];
        var inputs = $("#editCommodityModal").find('input')
        for (var i = 0; i < inputs.length; i++) {
          $(inputs[i]).val(rowData[i ])
        }
      } else {
        alert('请选择项目');
      }
    });
    $("#saveEdit").click(function() {
      var editCommodityID = $("#editCommodityID").val()
      var editCommodityName = $("#editCommodityName").val()
      var editCommodityType = $("#editCommodityType").val()
      var editCommodityN = $("#editCommodityN").val()
      var editCommodityPic = $("#editCommodityPic").val()
      var newRowData = [].concat(editCommodityID, editCommodityName, editCommodityType, editCommodityN, editCommodityPic);
      var tds = Array.prototype.slice.call($('.selected td'))
      for (var i = 0; i < newRowData.length; i++) {
        if (newRowData[i] !== '') {
          tds[i ].innerHTML = newRowData[i];
        } else {
          alert(titles[i] + '内容不能为空')
        }
      }
      var json = []
      var j = {};
      j.oldcom_no = table.row('.selected').data()[0];
      j.com_no = editCommodityID;
      j.com_name = editCommodityName;
      j.cat_id = editCommodityType;
      j.introduce = editCommodityN;
      j.pictureurl = editCommodityPic;
      json.push(j);
		$.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath }/edit_commodity.action",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify(json),
	        dataType: "json",
	        success:function (result){
	        	alert("修改成功!");
	        },
	        error:function (result){
	        	alert("修改失败!");
	        }
	    });
    })
    $("#cancelEdit").click(function() {
      console.log('cancelAdd');
      $("#editCommodityModal").find('input').val('')
    })
    $('#btn_delete').click(function () {
      if (table.rows('.selected').data().length) {
        $("#deleteCommodity").modal()
      } else {
        alert('请选择项目');
      }
    });
    $('#delete').click(function () {
		var com_no = table.row('.selected').data()[0];
		var json = [];
        var j = {};
        j.com_no = com_no;
        json.push(j);
        
        
		$.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath }/delete_commodity.action",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify(json),
	        dataType: "json",
	        success:function (result){
	        	alert("删除成功!");
	        },
	        error:function (result){
	        	alert("删除失败!");
	        }
	    });
      table.row('.selected').remove().draw(false);
    });
  })
</script>

</body>


</html>

