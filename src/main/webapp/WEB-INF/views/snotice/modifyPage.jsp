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
						<h3 class="box-title">제목</h3>
					</div>
					
					<!-- 글작성 -->
					<form role="form" action="modifyPage" method="post">
						<input type="hidden" name="page" value="${cri.page }">
						<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
						<input type="hidden" name="searchType" value="${cri.searchType}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
					
						<div class="box-body">
						
							<div class="form-group">
								<label for="exampleInputEmail1">NBNO</label>
								<input type="text" name="nbno" class="form-control" value="${noticeDto.nbno}" 
									readonly="readonly">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Nname</label>
								<input type="text" name="nname" class="form-control" value="${noticeDto.nname}"> 
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Ncontent</label>
								<textarea class="form-control" name="ncontent" rows="3">${noticeDto.ncontent}</textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Nwriter</label>
								<input type="text" name="nwriter" class="form-control" value="${noticeDto.nwriter}"> 
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
							
							<button type="submit" class="btn-primary btn-sm" id="savebtn">SAVE</button>
							
						</div>
					
					</form>
					
					<form>
						<div class="box-footer">
							<button class="btn-warning btn-sm" id="canbtn">CANCEL</button>
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

<script type="text/javascript">

	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$("#canbtn").on("click", function(){
			self.location = "/snotice/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
					+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
			
		});
		
		/* $("#canbtn").on("click", function(){ */
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
	var nbno = ${noticeDto.nbno};
	var template = Handlebars.compile($("#template").html());

	$.getJSON("/snotice/getAttach/"+nbno,function(list){
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