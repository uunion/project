<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>

<%@include file="../include/header.jsp" %>

	<!-- Main content -->
	<section class="content">
		<div class="row">
		<!-- left column -->
			<div class="col-md-12">
			<!-- general form elements -->
				
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
								<textarea class="form-control" name="ncontent" rows="3" placeholder="Enter ..."></textarea>
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
				
			</div><!-- /.col (left) -->
		</div><!-- /.row -->
	</section><!-- /.content -->
	
<%@include file="../include/footer.jsp" %>

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

</script>
