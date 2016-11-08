<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>공지사항 작성</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <!-- 네이버 스마트 에디터 -->
    <script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

	<style>
		.fileDrop {
			width: 80%;
			height: 100px;
			border: 1px dotted gray;
			background-color: lightslategrey;
			margin: auto;
		}
	</style>
	
</head>

<body>

    <div id="wrapper">

      	<%@include file="../header.jsp"%>
      	<%@include file="../sidebar.jsp"%>
      	

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">공지사항 작성</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                
                <!-- 작성 코드 넣기 -->
                <div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">REGISTER PAGE</h3>
					</div>
					
					<!-- 글작성 -->
					<form role="form" id="registerForm" method="post">
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">Nname</label>
								<input type="text" name="nname" class="form-control" placeholder="Enter Nname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Ncontent</label>
								<!-- <textarea class="form-control" name="ncontent" rows="3" placeholder="Enter ..."></textarea> -->
								<!-- 스마트 에디터 입력 위치 -->
								<textarea name="ncontent" id="ir1" rows="5" cols="100"></textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Nwriter</label>
								<input type="text" name="nwriter" class="form-control" placeholder="Enter Nwriter">
							</div>
							
							<!-- 파일 드랍 위치 -->
							<div class="form-group">
								<label for="exampleInputEmail1">File DROP Here</label>
								<div class="fileDrop"></div>
							</div>
							
						</div>
						<!-- /.box-body -->
						
						<div class="box-footer">
							<div>
								<hr>
							</div>
							
							<!-- 파일 표시 위치 -->
							<ul class="mailbox-attachments clearfix uploadedList">
							</ul>
						
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
					 
				</div>
                
                    
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
	
	<!-- 파일 첨부 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<script type="text/javascript" src="/resources/js/upload.js"></script>
	
	<script id="template" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgsrc}}" alt="Attachment">
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a href="{{afullName}}" class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
		</div>
	</li>
	</script>
	
	
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    
    /* 파일 첨부 */
    var template = Handlebars.compile($("#template").html());

    $(".fileDrop").on("dragenter dragover", function(event){
    	event.preventDefault();
    });

    $(".fileDrop").on("drop", function(event){
    	event.preventDefault();
    	
    	var files = event.originalEvent.dataTransfer.files;
    	
    	var file = files[0];
    	
    	var formData = new FormData();
    	
    	formData.append("file", file);
    	
    	$.ajax({
    		url : '/uploadAjax',
    		data : formData,
    		dataType : 'text',
    		processData : false,
    		contentType : false,
    		type : 'POST',
    		success : function(data){
    			
    			var fileInfo = getFileInfo(data);
    			
    			var html = template(fileInfo);
    			
    			$(".uploadedList").append(html);
    		}
    	});
    });

    /* form submit 처리 */
    $("#registerForm").submit(function(event){
    	event.preventDefault();
    	
    	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
    	
    	var that = $(this);
    	
    	var str = "";
    	
    	$(".uploadedList .delbtn").each(function(index){
    		str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("href") + "'>";
    	});
    	
    	that.append(str);
    	
    	that.get(0).submit();
    });
    
    /* 첨부 파일 삭제 */		
    $(".uploadedList").on("click", ".delbtn", function(event){
    	
    	event.preventDefault();
    	
    	var that = $(this);
    	 
    	$.ajax({
    	   url:"/deleteFile",
    	   type:"post",
    	   data: {fileName:$(this).attr("href")},
    	   dataType:"text",
    	   success:function(result){
    		   if(result == 'deleted'){
    			   that.closest("li").remove();
    		   }
    	   }
       });
    });
    
    /* 스마트 에디터 */
    var oEditors = [];

	nhn.husky.EZCreator.createInIFrame({

	    oAppRef: oEditors,
	
	    elPlaceHolder: "ir1",
	
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	
	    fCreator: "createSEditor2"

	});
    
    </script>
   

</body>

</html>
