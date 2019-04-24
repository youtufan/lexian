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

  .operation > button {
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
		
        <title>门店管理</title>
    </head>
    <body>
    	<section class="content">
            <div class="btn-group operation">
      <!--
      	添加新增按钮
      -->      	
      <button id="btn_add" type="button" class="btn bg-primary">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
      </button>
     
      <!--
      	添加修改按钮
      -->
                <button id="btn_edit" type="button" class="btn bg-info">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button>
                
            
    <!--
        添加查看门店商品详细信息按钮
      -->
      <button id="btn_goods" type="button" class="btn bg-primary">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>查看门店商品详情
      </button>
      </div>
    <!--
    	添加门店信息
    -->
      <div class="modal fade" id="addShop" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">添加门店</h4>
          </div>
          <div id="addShopModal" class="modal-body">
            <div class="form-horizontal">
              <div class="form-group">
                <label for="shopName" class="col-sm-4 control-label">门店名称:*</label>
                <div class="col-sm-10">
                  <input class="form-control" id="shopName" type="text">
                </div>
              </div>
              <div class="form-group">
                <label for="shopAddress" class="col-sm-4 control-label">门店地址:*</label>
                <div class="col-sm-10">
                  <input class="form-control" id="shopAddress" type="text">
                </div>
              </div>
              <div class="form-group">
                <label for="shopStates" class="col-sm-4 control-label">门店状态:*</label>
                <div class="col-sm-10">
                  <input class="form-control" id="shopStates" type="text">
                </div>
              </div>
             
              
            </div>
          </div>
          <div class="modal-footer">
            <div class="center-block">
              <button id="cancelAdd" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
              <button id="addShopsInfo" type="button" class="btn btn-success" data-dismiss="modal">保存</button>
            </div>
          </div>
        </div>
      </div>
    </div>
     
    <!--
    	修改门店信息
    -->
     <div class="modal fade" id="editShopInfo" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">修改门店信息</h4>
            </div>
            <div id="editShopModal" class="modal-body">
              <div class="form-horizontal">
                <div class="form-group">
                  <label for="editShopName" class="col-sm-4 control-label">门店名称:*</label>
                  <div class="col-sm-10">
                    <input class="form-control" id="editShopName" type="text">
                  </div>
                </div>
                <div class="form-group">
                  <label for="editShopAddress" class="col-sm-4 control-label">门店地址:*</label>
                  <div class="col-sm-10">
                    <input class="form-control" id="editShopAddress" type="text">
                  </div>
                </div>
                <div class="form-group">
                  <label for="editShopStates" class="col-sm-4 control-label">门店状态:*</label>
                  <div class="col-sm-10">
                    <input class="form-control" id="editShopStates" type="text">
                  </div>
                </div>
                 
                
                
              </div>
            </div>
            <div class="modal-footer">
              <div class="center-block">
                <button id="cancelEdit" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="saveEdit" type="button" class="btn btn-success" data-dismiss="modal">保存</button>
              </div>
            </div>
          </div>
        </div>
      </div>
 
    <table id="shop" class="table table-striped table-bordered row-border hover order-column" cellspacing="0" width="100%">
      <thead>
        <tr>
          <th>门店编号</th>
          <th>门店名称</th>
          <th>门店地址</th>
          <th>门店状态</th>
          
          
        </tr>
      </thead>
      <tbody></tbody>
    </table>
    
    <div id="shopDetail"></div>
  </section>
</body>
<script>
 /*  var data = [['三体', '123456789', '重庆出版社']] */
 var storesString = '${shopjson}';
	var data = new Array();
	var jsonObj = JSON.parse(storesString);//转换为json对象

	for (var i = 0; i < jsonObj.length; i++) {
		var store = new Array();
		store[0] = (jsonObj[i].sto_no); 
		store[1] = (jsonObj[i].sto_name); //取json中的值
		store[2] = (jsonObj[i].sto_add);
		store[3] = (jsonObj[i].sto_states);
		data.push(store);
	}
  var titles = ['门店编号','门店名称', '门店地址', '门店状态']
  $(function () {
    var table = $('#shop').DataTable({
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
        cell.innerHTML = i+1 ;
      });
    }).draw();
    $('#shop tbody').on('click', 'tr', function () {
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
      $("#addShopModal").find('input').val('')
    })
    $("#addShopsInfo").on('click', function() {
      console.log('addShopsInfo'); 
      if (data.length) {
        if ($("#addShopModal").find('input').val() !== '') {
          var shopName = $("#shopName").val()
          console.log(shopName);
          var shopAddress = $("#shopAddress").val()
          var shopStates = $("#shopStates").val()
          var addShopInfos = [].concat(shopName, shopAddress, shopStates);
          for (var i = 0; i < addShopInfos.length; i++) {
            if (addShopInfos[i] === '') {
              alert(titles[i] + '内容不能为空')
            }
          }
          table.row.add([shopName, shopAddress, shopStates]).draw();
          
            array=[];
      		array.push({"ShopName":addShopInfos[0],"ShopAddress":addShopInfos[1],"ShopStates":addShopInfos[2]});
      	
            $.ajax({
                url : "${pageContext.request.contextPath }/addSto.action",
                data : JSON.stringify(array),
                dataType : 'text',
                type : "POST",
                contentType:"application/json; charset=utf-8",
                traditional: true,
                success:function(){

                    alert("111");
                },

            });  
          
          $("#addShopModal").find('input').val('')
        }
      } else {
        alert('请输入内容')
      }
    })
    $("#addShopsInfo").click();    
    $("#btn_add").click(function(){
      console.log('add');
      $("#addShop").modal()
    });
    
    
    $('#btn_edit').click(function () {
      console.log('edit');
      if (table.rows('.selected').data().length) {
        $("#editShopInfo").modal()
        var rowData = table.rows('.selected').data()[0];
        var inputs = $("#editShopModal").find('input')
        for (var i = 1; i <= inputs.length; i++) {
          $(inputs[i-1]).val(rowData[i ])
        }
      } else {
        alert('请选择项目');
      }
    });
    $("#saveEdit").click(function() {
      var ShopId=table.rows('.selected').data()[0][0];
      var editShopName = $("#editShopName").val()
      var editShopAddress = $("#editShopAddress").val()
      var editShopStates = $("#editShopStates").val()      
      var newRowData = [].concat(ShopId,editShopName, editShopAddress, editShopStates);

	array=[];
	array.push({"ShopId":ShopId,"editShopName":editShopName,"editShopAddress":editShopAddress,"editShopStates":editShopStates});
	
      $.ajax({
          url : "${pageContext.request.contextPath }/updataSto.action",
          data : JSON.stringify(array),
          dataType : 'text',
          type : "POST",
          contentType:"application/json; charset=utf-8",
          traditional: true,
          success:function(){

              alert("111");
          },

      });  
      var tds = Array.prototype.slice.call($('.selected td'))
      for (var i = 0; i < newRowData.length; i++) {
        if (newRowData[i] !== '') {
          tds[i].innerHTML = newRowData[i];
        } else {
          alert(titles[i] + '内容不能为空')
        }
      }   
    })
    $("#cancelEdit").click(function() {
      console.log('cancelAdd');
      $("#editShopModal").find('input').val('')
    })
    
     $('#btn_goods').click(function () {
      
      if (table.rows('.selected').data().length) {
      	<!--获取门店id,调用门店对应商品的表-->
      	var sto_no=table.rows('.selected').data()[0][0];
       window.location.href("${pageContext.request.contextPath }/goodTable.action?sto_no"+sto_no);
/*           location.href='shopGoods-table.jsp'; */
      } else {
        alert('请选择项目');
      }
    });
    
  })
</script>

</body>


</html>