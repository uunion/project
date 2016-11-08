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
	
	<!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
    

</head>

<body>

    <div id="wrapper">

      	<%@include file="../header.jsp"%>
      	<%@include file="../sidebar.jsp"%>

	<!-- 큰 이미지 표시 팝업창 -->
	<div class='popup back' style="display: none;"></div>
	<div id="popup_front" class='popup front' style="display: none;">
		<img id="popup_img">
	</div>

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
							<%-- <textarea class="form-control" name="ncontent" rows="3" 
								readonly="readonly">${noticeDto.ncontent}</textarea> --%>
							<div style="border: 1px groove; margin: 20px;" name="ncontent">${noticeDto.ncontent}</div>
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
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                
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
						<%-- <span class="bg-green">Replies List <small id="nreplycntSmall"> [ ${noticeDto.nreplycnt} ]</small></span> --%>
						<div class="btn btn-danger" id="listrebtn">Replies List <small id="nreplycntSmall"> [ ${noticeDto.nreplycnt} ]</small></div>
					</li>
				</ul>
				
				
				
				<div class="text-center">
					<ul id="pagination" class="pagination pagination-sm no-margin">
					
					</ul>
				</div>
                
                </div>
           </div>
        </div>
        <!-- /#page-wrapper -->
        
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
					<div class="modal-body" data-rno>
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
		

    </div>
    <!-- /#wrapper -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	
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
<li class="replyLi" data-rno={{rno}}>
	<i class="fa fa-comments bg-blue"></i>
	<div class="timeline-item">
		<span class="time">
			<i class="fa fa-clock-o"></i>{{prettifyDate rregdate}}
		</span>
		<h3 class="timeline-header"><strong>{{rno}}</strong> -{{rwriter}}</h3>
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
			formObj.attr("action", "/notice/modifyPage");
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
			
			formObj.attr("action", "/notice/removePage");
			formObj.submit();
		});
		
		$("#listAllBtn").on("click", function(){
			formObj.attr("method", "get");
			formObj.attr("action", "/notice/list");
			formObj.submit();
		});
		
		/* 댓글 목록 이벤트 */
		$("#listrebtn").on("click", function(){
			getPage("/replies/" + nbno + "/1");
		});
		/* $("#repliesDiv").on("click", function(){
			if($(".timeline li").size() > 1) {
				return;
			}
			getPage("/replies/" + nbno + "/1");
		}); */
		
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
			$(".modal-title").html(reply.attr("data-rno"));
		});
		
		/* 댓글 수정 */
		$("#replyModBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var rcontent = $("#rcontent").val();

			$.ajax({
				type : 'put',
				url : '/replies/'+rno,
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
			var rno = $(".modal-title").html();
			var rcontent = $("#rcontent").val();
			
			$.ajax({
				type : 'delete',
				url : '/replies/'+rno,
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
		
		$.getJSON("/notice/getAttach/" + nbno, function(list){
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
	
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- 사이드 메뉴 동작 -->
    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- 사이드 메뉴 동작 -->
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- 사이드 메뉴 동작 -->
    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        
    });
    </script>
   

</body>

</html>
