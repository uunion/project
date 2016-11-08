<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>공지사항</title>

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

</head>

<body>

    <div id="wrapper">

      	<%@include file="../header.jsp"%>
      	<%@include file="../sidebar.jsp"%>
      	

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원 관리</h1>
                </div>
                <!-- 검색 영역 --> 
					<%-- <div class="box-body">
						
						<select name="searchType">
							<option value="n"
								<c:out value="${cri.searchType == null?'selected':''}" />>
								---</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't'?'selected':''}" />>
								Nname</option>
							<option value="c"
								<c:out value="${cri.searchType eq 'c'?'selected':''}" />>
								Ncontent</option>
							 <option value="w"
								<c:out value="${cri.searchType eq 'w'?'selected':''}" />>
								Nwriter</option>
							<option value="tc"
								<c:out value="${cri.searchType eq 'tc'?'selected':''}" />>
								Nname OR Ncontent</option>
							<option value="cw"
								<c:out value="${cri.searchType eq 'cw'?'selected':''}" />>
								Ncontent OR Nwriter</option>
							<option value="tcw"
								<c:out value="${cri.searchType eq 'tcw'?'selected':''}" />>
								Nname OR Ncontent OR Nwriter</option>
						</select>
						
						<input type="text" name="keyword" id="keywordInput"
							value="${cri.keyword }">
						<button id="searchBtn">Search</button>
						<button id="newBtn">New Notice</button>
						
					</div> --%>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                
                    <!-- list -->
                    <div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">회원 목록</h3>
					</div>
					
					<!-- 글작성 -->
					<table class="table table-striped">
						<tr>
							<th>회원번호</th>
							<th>회원아이디</th>
							<th>회원이름</th>
							<th>회원이메일</th>
							<th>관리자 권한</th>
						</tr>
						
						<c:forEach items="${list}" var="memberDto">
						
						<tr>
							<td>${memberDto.mno}</td>
							<td>${memberDto.memberid}</td>
							<td>${memberDto.name}</td>
							<td>${memberDto.email}</td>
							
							<td>
							    <c:if test="${memberDto.admin == 1 }">
                        		  관리자
                        
								</c:if>
						
								<c:if test="${memberDto.admin == 0}">
								회원
								</c:if> 
                 
							
							</td>
							
						</tr>
						
						</c:forEach>
						
					</table>
					
					
					<div class="text-center"><!-- 페이징 -->
	
						<ul class="pagination">
						
							<c:if test="${pageMaker.prev }">
								<li>
									<a href="list${pageMaker.makeSearch(pageMaker.startPage -1)}">	
									&laquo;</a>
								</li>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var = "idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
								<li>
									<a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">
									&raquo;</a>
								</li>
							</c:if>
							
						</ul>
					
					</div><!-- 패이징 E -->
					<!-- ./list -->
					 
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

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
        
        var result = "${msg}";
    	
    	if(result == "SUCCESS"){
    		alert("처리가 완료되었습니다.")
    	}
        
        $("#searchBtn").on(
    			"click",
    			function(event) {
    				
    				self.location = "list"
    					+ "${pageMaker.makeQuery(1)}"
    					+ "&searchType="
    					+ $("select option:selected").val()
    					+ "&keyword=" + $("#keywordInput").val();
    				
    			});		
    		
    		$("#newBtn").on("click", function(evt) {
    			self.location = "register";
    		});
        
    });
    </script>
   

</body>

</html>
