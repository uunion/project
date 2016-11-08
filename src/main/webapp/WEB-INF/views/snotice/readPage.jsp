<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>

<style type="text/css">
.popup {
	position: absolute;
}
.back {
	background-color: gray;
	opacity: 0.5;
	width: 100%;
	height: 300%;
	overflow: hidden;
	z-index: 1101;
}
.front {
	z-index: 1110;
	opacity: 1;
	boarder: 1px;
	margin: auto;
}
.show {
	position: relative;
	max-width: 1200px;
	max-height: 800px;
	overflow: auto;
}
</style>

<%@include file="../include/header.jsp" %>

	<!-- 큰 이미지 표시 팝업창 -->
	<div class='popup back' style="display: none;"></div>
	<div id="popup_front" class='popup front' style="display: none;">
		<img id="popup_img">
	</div>
	
	<!-- Main content -->
	<section class="content">
		<div class="row">
		<!-- left column -->
			<div class="col-md-12">
			<!-- general form elements -->
				
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">READ NOTICE</h3>
					</div>
					
					<!-- 글작성 -->
					<form role="form" method="post">
					
						<input type="hidden" name="nbno" value="${noticeDto.nbno}">
						<input type="hidden" name="page" value="${cri.page}">
						<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
						<input type="hidden" name="searchType" value="${cri.searchType}">
						<input type="hidden" name="keyword" value="${cri.keyword}">
					
					</form>
					
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">Nname</label>
							<input type="text" name="nname" class="form-control" value="${noticeDto.nname}" 
								readonly="readonly">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Ncontent</label>
							<textarea class="form-control" name="ncontent" rows="3" 
								readonly="readonly">${noticeDto.ncontent}</textarea>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Nwriter</label>
							<input type="text" name="nwriter" class="form-control" value="${noticeDto.nwriter}" 
								readonly="readonly">
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
						
						<button type="submit" class="btn btn-warning" id="modifyBtn">Modify</button>
						<button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
						<button type="submit" class="btn btn-primary" id="listAllBtn">LIST ALL</button>
					</div> 
					 
				</div>
				
			</div><!-- /.col (left) -->
		</div><!-- /.row -->
		
		<!-- 댓글 등록 -->
		<div class="row">
			<div class="col-md-12">
			
				<div class="box box-success">
					<div class="box-header">
						<h3 class="box-title">ADD NEW REPLY</h3>
					</div>
					<div class="box-body">
						<label for="newReplyWriter">Writer</label>
						<input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter">
						<label for="newRcontent">Rcontent</label>
						<input class="form-control" type="text" placeholder="REPLY TEXT" id="newRcontent">
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<button type="submit" class="btn btn-primary" id="replyAddBtn">ADD REPLY</button>
					</div>
				</div>
				
				<!-- The time line -->
				<ul class="timeline">
					<!-- timeline time label -->
					<li class="time-label" id="repliesDiv">
						<span class="bg-green">Replies List <small id="nreplycntSmall"> [ ${noticeDto.nreplycnt} ]</small></span>
					</li>
				</ul>
				
				<div class="text-center">
					<ul id="pagination" class="pagination pagination-sm no-margin">
					
					</ul>
				</div>
			
			</div>
		</div>
		
	</section><!-- /.content -->
	
	<!-- 댓글 수정 삭제 모달창 -->
	<!-- Modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content -->
			<div class="modla-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rbno>
					<p><input type="text" id="rcontent" class="form-control"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
<%@include file="../include/footer.jsp" %>

<!-- 첨부 파일 템플릿 -->
<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{afullName}}'>
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
	<div class="mailbox-attachment-info">
		<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	</div>
</li>
</script>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rbno={{rbno}}>
	<i class="fa fa-comments bg-blue"></i>
	<div class="timeline-item">
		<span class="time">
			<i class="fa fa-clock-o"></i>{{prettifyDate rregdate}}
		</span>
		<h3 class="timeline-header"><strong>{{rbno}}</strong> -{{rwriter}}</h3>
		<div class="timeline-body">{{rcontent}}</div>
		<div class="timeline-footer">
			<a class="btn btn-primary btn-xs"
				data-toggle="modal" data-target="#modifyModal">Modify</a>
		</div>
	</div>
</li>
{{/each}}
</script>

<script type="text/javascript">

	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		
		console.log(formObj);
		
		$("#modifyBtn").on("click", function(){
			formObj.attr("action", "/snotice/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$("#removeBtn").on("click", function(){
			
			var replyCnt = $("#nreplycntSmall").html().replace(/[^0-9]/g,"");
			
			 if(replyCnt > 0){
				alert("댓글이 달린 게시물은 삭제할 수 없습니다.");
				return;
			}
			 
			var arr = [];
			$(".uploadedList li").each(function(index){
				arr.push($(this).attr("data-src"));
			});
			
			if(arr.length > 0){
				$.post("/deleteAllFiles", {files:arr}, function(){
					
				});
			}
			
			formObj.attr("action", "/snotice/removePage");
			formObj.submit();
		});
		
		$("#listAllBtn").on("click", function(){
			formObj.attr("method", "get");
			formObj.attr("action", "/snotice/list");
			formObj.submit();
		});
		
		/* 댓글 목록 이벤트 */
		$("#repliesDiv").on("click", function(){
			if($(".timeline li").size() > 1) {
				return;
			}
			getPage("/replies/" + nbno + "/1");
		});
		
		/* 댓글 페이징 */
		$(".pagination").on("click", "li a", function(event){
			event.preventDefault();
			replyPage = $(this).attr("href");
			getPage("/replies/"+nbno+"/"+replyPage);
		});
		
		/* 댓글 등록 */
		$("#replyAddBtn").on("click", function(){
			var rwriterObj = $("#newReplyWriter");
			var rcontentObj = $("#newRcontent");
			var rwriter = rwriterObj.val();
			var rcontent = rcontentObj.val();
			
			$.ajax({
				type : 'post',
				url : '/replies/',
				headers : {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "POST"},
				dataType : 'text',
				data : JSON.stringify({nbno:nbno, rwriter:rwriter, rcontent:rcontent}),
				success : function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다");
						replyPage = 1;
						getPage("/replies/"+nbno+"/"+replyPage );
						rwriterObj.val("");
						rcontentObj.val("");
					}
				}
			});
		});
		
		/* 댓글 버튼 이벤트 처리 */
		$(".timeline").on("click", ".replyLi", function(){
			var reply = $(this);
			
			$("#rcontent").val(reply.find('.timeline-body').text());
			$(".modal-title").html(reply.attr("data-rbno"));
		});
		
		/* 댓글 수정 */
		$("#replyModBtn").on("click", function(){
			var rbno = $(".modal-title").html();
			var rcontent = $("#rcontent").val();

			$.ajax({
				type : 'put',
				url : '/replies/'+rbno,
				headers : {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "PUT" },
				data : JSON.stringify({rcontent:rcontent}),
				dataType : 'text',
				success : function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다");
						getPage("/replies/"+nbno+"/"+replyPage );
					}
				}
			});
		});
		
		/* 댓글 삭제 */
		$("#replyDelBtn").on("click", function(){
			var rbno = $(".modal-title").html();
			var rcontent = $("#rcontent").val();
			
			$.ajax({
				type : 'delete',
				url : '/replies/'+rbno,
				header : {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "DELETE" },
				dataType : 'text',
				success : function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다");
						getPage("/replies/"+nbno+"/"+replyPage );
					}
				}
			});
		});
		
		function getPage(pageInfo){
			
			$.getJSON(pageInfo, function(data){
				printData(data.list, $("#repliesDiv"), $("#template"));
				printPaging(data.pageMaker, $(".pagination"));
				
				$("#modifyModal").modal('hide');
				$("#nreplycntSmall").html("[ " + data.pageMaker.totalCount + " ]");
			});
		}
		
		/* 첨부 파일 처리 */
		var nbno = ${noticeDto.nbno};
		var template = Handlebars.compile($("#templateAttach").html());
		
		$.getJSON("/snotice/getAttach/" + nbno, function(list){
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
				imgTag.addClass('show');
			}
		});
		
		$("#popup_img").on("click", function(){
		
			$(".popup").hide('slow');
			
		})
		
	});

</script>

<script>

	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year+"/"+month+"/"+date;
	});
	
	var printData = function (replyArr, target, templateObject){
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	};
	
	var nbno = ${noticeDto.nbno};
	var replyPage = 1;
	
	function getPage(pageInfo){
		$.getJSON(pageInfo, function(data){
			printData(data.list, $("#repliesDiv"), $("#template"));
			printPaging(data.pageMaker, $(".pagination"));
		});
	}
	
	var printPaging = function(pageMaker, target){
		var str = "";
		
		if(pageMaker.prev){
			str += "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
		}
		for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active':'';
			str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
		if(pageMaker.next){
			str += "<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
		}
		target.html(str);
	};
	
	

</script>