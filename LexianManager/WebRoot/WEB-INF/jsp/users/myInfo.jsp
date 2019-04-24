<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		
		
		<script src="js/bootstrap.js"></script>
		
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/main.css">
		
		
		<script src="js/jquery-3.3.1.min.js"></script>
		
		<script src="js/bootstrap.js"></script>
		
		
		
		
		
		 <style>
            /*web background*/
            .container{
                display:table;
                height:100%;
            }
 
            /* centered columns styles */
            .row-centered {
                text-align:center;
            }
            .col-centered {
                display:inline-block;
                float:center;
                text-align:justify;
               
                display: flex;
			/*控制元素在主轴的对齐方式*/
			justify-content: center;
			/*控制默认的一行的对齐方式*/
			align-items: center;
			margin: 0 auto;

               
            }
        </style>
        
		<title>我的个人信息</title>
	</head>
	<body>
		
		
		<div class="container">
			<br />
			<div class="col-centered">
			<div class="card" style="width:700px;border-color:#999999;"  >
				<div class="card-body">
					<h4 class="card-title">个人资料</h4>
					
			<div class="form-horizontal">
              <div class="form-group">
                <label for="userName" class="col-sm-4 control-label">用户名:*</label>
                <div class="col-sm-10">
                  <input class="form-control" id="userName" type="text" value=${userInfoVo.u_name}>
                </div>
              </div>
              <div class="form-group">
                <label for="userPhone" class="col-sm-4 control-label">手机号:*</label>
                <div class="col-sm-10">
                  <input class="form-control" id="userPhone" type="text" value=${userInfoVo.u_phone}>
                </div>
              </div>
              <div class="form-group">
                <label for="userSex" class="col-sm-4 control-label">性别:*</label>
                <div class="col-sm-10">
                  <input class="form-control" id="userSex" type="text" value=${userInfoVo.sex}>
                </div>
              </div>
              <div class="form-group">
                <label for="userEmail" class="col-sm-4 control-label">邮箱:*</label>
                <div class="col-sm-10">
                  <input class="form-control" id="userEmail" type="email" value=${userInfoVo.mail}>
                </div>
              </div>
            </div>
					
			<div class="center-block">
				&nbsp;&nbsp;
                
                <button id="btn_edit" type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button> 
                
            </div>
           
			</div>
			</div>
			</div>
		</div>
		<br/><br/><br/><br/><br/><br/>
		
	<!--
    	修改个人信息
    -->
     <div class="modal fade" id="editMyInfo" role="dialog">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">修改个人信息</h4>
            </div>
            <div id="editMyModal" class="modal-body">
              <div class="form-horizontal" >
                <div class="form-group" >
                  <label for="editMyName" class="col-sm-4 control-label">用户名:*</label>
                  <div class="col-sm-10">
                    <input class="form-control" id="editMyName" type="text">
                  </div>
                </div>
<!--                 <div class="form-group">
                  <label for="editMyPhone" class="col-sm-4 control-label">手机号:*</label>
                  <div class="col-sm-10">
                    <input class="form-control" id="editMyPhone" type="number">
                  </div>
                </div> -->
                <div class="form-group">
                  <label for="editMySex" class="col-sm-4 control-label">性别:*</label>
                  <div class="col-sm-10">
                    <input class="form-control" id="editMySex" type="text">
                  </div>
                </div>
                <div class="form-group">
                  <label for="editMyEmail" class="col-sm-4 control-label">邮箱:*</label>
                  <div class="col-sm-10">
                    <input class="form-control" id="editMyEmail" type="text">
                  </div>
                </div>
                
                
              </div>
            </div>
            <div class="modal-footer">
              <div class="center-block">
                <button id="cancelEdit1" type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button id="saveEdit" type="button" class="btn btn-success" data-dismiss="modal">保存</button>
              </div>
            </div>
          </div>
        </div>
      </div>
		
		
	<script>
		
	 $('#btn_edit').click(function () {
      console.log('edit');
     
        $("#editMyInfo").modal();
        var rowData = table.rows('.selected').data()[0];
        var inputs = $("#editMyModal").find('input')
        for (var i = 0; i < inputs.length; i++) {
          $(inputs[i]).val(rowData[i ])
        }
      
    })
		
    $("#saveEdit").click(function() {
      var editMyName = $("#editMyName").val()
      var editMyPhone = $("#editMyPhone").val()
      var editMySex = $("#editMySex").val()  
      var editMyEmail = $("#editMyEmail").val()
      var newRowData = [].concat(editMyName, editMyPhone, editMySex,editMyEmail);

	array=[];
	array.push({"editMyName":editMyName,"editMyPhone":editMyPhone,"editMySex":editMySex,"editMyEmail":editMyEmail});
	
      $.ajax({
          url : "${pageContext.request.contextPath }/updateInfo.action",
          data : JSON.stringify(array),
          dataType : 'text',
          type : "POST",
          contentType:"application/json; charset=utf-8",
          traditional: true,
          success:function(){

              alert("1111");
          },

      });  
     
      for (var i = 0; i < newRowData.length; i++) {
        if (newRowData[i] == '') {
        	alert(FormData[i] + '内容不能为空')
        } 
      }   
    })
    $("#cancelEdit1").click(function() {
     console.log('cancelAdd');
      $("#editMyModal").find('input').val('')
    })
	</script>
	
	</body>
</html>