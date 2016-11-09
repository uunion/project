
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


    <title>장애인 정보 서비스</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

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
                    <h1 class="page-header">예약 리스트</h1>
                </div>
                <!-- /.col-lg-12 -->
          		<form method="post" id="frm" role="form" >
  				   <table class="table table-hover">
               		<thead>
               		<tr>
               			<th>예약번호</th>
               			<th>신청자</th>
               			<th>이메일</th>
               			<th>핸드폰</th>
               			<th>예약일</th>
               			<th>예약시간</th>
               			<th>예약확인</th>
               		</tr>
               		</thead>
               		<c:forEach items="${list}" var="list">
               		<tr>
  						<td>${list.rno }</td>
  						<td><a href="/reservation/reservationRead${RpageMaker.makeQuery(RpageMaker.paging.page)}&rno=${list.rno}">${list.rname }</a></td>
  						<td>${list.email }</td>
  						<td>${list.phone }</td>
  						<td>${list.rdate }</td>
  						<td>${list.rtime }</td>
  						<td> <input type="button" class="btn btn-info" value="확인" id="${list.rno }"onclick="check($(this));"></td>
  					</tr>
  					</c:forEach>
  				</table>
  				</form>
					   <div class="text-center">
							<ul class="pagination">
								 <c:if test="${RpageMaker.prev }">
									<li><a href="reservationListAll${RpageMaker.makeQuery(RpageMaker.startPage -1)}">&laquo;</a></li>
								</c:if>
								<c:forEach begin="${RpageMaker.startPage}" end="${RpageMaker.endPage}" var="idx">
									<li
										<c:out value="${RpageMaker.paging.page == idx?'class =active':''}"/>>
										<a href="reservationListAll${RpageMaker.makeQuery(idx)}">${idx}</a>
									</li>
								</c:forEach>
								
								<c:if test="${RpageMaker.next && RpageMaker.endPage > 0 }" >
									<li><a href="reservationListAll${RpageMaker.makeQuery(RpageMaker.endPage +1)}">&raquo;</a></li>
								</c:if> 
							</ul>
						</div> 
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript">
    
	var now;
	var nowTime ;
    
    $(function(){
    });
    function check(obj){
    	var formObj=$("form[role='form']");
		
		now = new Date();
        nowTime = now.getFullYear() + "년" 
        + (now.getMonth()+1) + "월"
        + now.getDate() + "일" 
        + now.getHours() + "시" 
        + now.getMinutes() +"분"
        + now.getSeconds() +"초"
        
        obj.attr('value',"확인됨");
         
        
	}
    </script>
	  <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

</body>

</html>