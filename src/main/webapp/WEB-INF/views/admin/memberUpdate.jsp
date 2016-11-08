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

    <title>장애인 정보 서비스</title>

   
    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    
	<!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/resources/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    
     <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
     <script src="http://code.jquery.com/jquery-1.11.0.js" type="text/javascript" charset="utf-8"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>   
	
	
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script> 

	

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>


    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>


    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    
	

 
	<link rel="stylesheet" type="text/css" href="/resources/vendor/datepicker/datepicker3.css">
 	<script src="/resources/vendor/datepicker/bootstrap-datepicker.js"></script>

    
        

<script type="text/javascript">


$(function() {
	$("#datepicker").datepicker({
		changeMonth : true,
		dayNames : ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		dayNamesMin : ['월', '화', '수', '목', '금', '토', '일'],
		monthNamesShort : ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dateFormat : "yy-mm-dd"
	});
	});
	
	
	
$(document).ready(function() {
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".update").on("click", function() {
		formObj.submit();
	});
	
	
});
	
</script>




	
	<!-- 다음 주소 api -->
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script>
        function openDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
                    
                    var zonecode=data.zonecode;
                    var address=data.address;
                    /* document.getElementById("zip1").value = data.zonecode;
                    document.getElementById("addr1").value = data.address;
                    document.getElementById("addr2").focus();
                     */
                    var addr = zonecode+address;
                    console.log(addr);
                    $('#addr').val(addr);
                }
            }).open();
        }
    </script>
	
</head>

<body>

    <div id="wrapper">
			<!-- 161027 방덕기 헤더파일 작성-->
      		<%@include file="../header.jsp"%>
      		<%@include file="../sidebar.jsp"%>
      		
   
	 <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원 상세정보 수정</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            ----회원가입폼 1027~ 방덕기 수정중-----
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" method="post">
                                     
                                        <div class="form-group">
                                            <label>아이디</label>
                                            <input class="form-control" name="memberid" value="${memberDto.memberid}" readonly="readonly" >
                                        </div>
                                        
                                         <div class="form-group">
                                            <label>비밀번호</label>
                                            <input type="password" class="form-control" name="pwd" value="${memberDto.pwd}" >
                                  
                                        </div>
                                        
                                         
                                        
                                          <div class="form-group">
                                            <label>이름</label>
                                            <input class="form-control" name="name" value="${memberDto.name}" >
                                           
                                        </div>
                                        
                                         <div class="form-group">
                                            <label>이메일</label>
                                            <input class="form-control" name="email" value="${memberDto.email }"  >
                                        </div>
                                        
                                     
                                         <div class="form-group">
                                            <label>생년월일</label>
                                            <p><input class="form-control" id="datepicker" name="birth" value="${memberDto.birth }"  ></p>
                                        </div>
                                        
                                        	
                                        
                                         <div class="form-group">
                                            <label>핸드폰</label>
                                            <input class="form-control" name="phone" value="${memberDto.phone }">
                                            <p class="help-block">핸드폰번호를 입력해주세요.</p>
                                        </div>
                                        
                                        
                                        
                                    <!--       <div class="form-group">
                                            <label>Text area</label>
                                            <textarea class="form-control" rows="3"></textarea>
                                        </div>
                                         -->
                                        
                                           <div class="form-group">
                                            <label>주소</label>
                                            <input class="form-control"  id="addr" name="addr" value="${memberDto.addr }" onclick="openDaumPostcode()"  >
                                     
                                             <input class="form-control" id="deaddr" name="deaddr" value="${memberDto.deaddr}" >
                                             <p class="help-block">상세주소</p>
                                            
                                        </div>
                                        
                                        
                                    
                                        
                                        
                                    </form>
                                    <button type="submit" class="btn update">수정</button>
                                      
                                    <button type="button" class="btn btn-default" onclick="location.href = '/index'">돌아가기</button>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                          </div></div></div></div>     
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->	

    </div>
    <!-- /#wrapper -->

    

</body>

</html>
