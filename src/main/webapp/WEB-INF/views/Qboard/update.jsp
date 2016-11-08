<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

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
                    <h1 class="page-header">제목</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                
                <!-- 작성 코드 넣기 -->
                
                <!-- 글작성 -->
				<form role="form" action="update" method="post">
					
				<input type="hidden" name="page" value="${cri.page }">
				<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
				<input type="hidden" name="searchType" value="${cri.searchType }">
				<input type="hidden" name="keyword" value="${cri.keyword }">
				
					<div class="box-body">
					
						<div class="form-group">
							<label for="exampleInputEmail1">글번호</label>
							<input type="text" name="qbno" class="form-control" value="${QboardDto.qbno}" 
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">글재목</label>
							<input type="text" name="qname" class="form-control" value="${QboardDto.qname}"> 
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">글내용</label>
							<textarea class="form-control" name="qcontent" rows="3">${QboardDto.qcontent}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">글작성자</label>
							<input type="text" name="qwriter" class="form-control" value="${QboardDto.qwriter}"> 
						</div>
						
						<!-- 파일 드랍 위치 -->
						<div class="form-group">
							<label for="exampleInputEmail1">파일 업로드</label>
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
						
						<button type="submit" class="btn-primary btn-sm" id="savebtn">저장</button>
						<button type="button" class="btn-warning btn-sm" id="canbtn">켄슬</button>
								
					</div>
				
				</form>
					
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>    
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
    
    <script>
    $(document).ready(function() {
        
        var formObj = $("form[role='form']");
		console.log(formObj);
		
		$("#canbtn").on("click", function(){
			self.location = "/Qboard/listPageMap?page=${cri.page}&perPageNum=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
			
		});
		
		formObj.submit(function(event){
			event.preventDefault();
			
			var that = $(this);
			
			var str = "";
			
			$(".uploadedList .delbtn").each(function(index){
				str += "<input type='hidden' name='files[" + index + "]' value='" + $(this).attr("href") + "'>";
			});
			
			that.append(str);
			
			that.get(0).submit();
			/* formObj.submit(); */
		});
        
    });
    
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

	/* 첨부 파일 처리 */
	var qbno = ${QboardDto.qbno};
	var template = Handlebars.compile($("#template").html());

	$.getJSON("/Qboard/QgetAttach/"+qbno,function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
			
		});
	});	

	/* 이미지 파일 표시 */
	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
			
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)){
			
			event.preventDefault();
					
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
					
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});

	$("#popup_img").on("click", function(){
		
		$(".popup").hide('slow');
		
	});	
    
    </script>

    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->

</body>

</html>
