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
        
        

<script>

 $(function() {
	$("#Datepicker").datepicker({
		changeMonth : true,
		dayNames : ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		dayNamesMin : ['월', '화', '수', '목', '금', '토', '일'],
		monthNamesShort : ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
		monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
	});
}); 



</script>

</head>

<body>

    <div id="wrapper">
			<!-- 161027 방덕기 헤더파일 작성-->
      		<%@include file="header.jsp"%>
      		<%@include file="sidebar.jsp"%>
      		
   
	 <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원가입</h1>
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
                                            <input class="form-control" name="memberid">
                                            <p class="help-block">아이디를 입력해주세요.</p>
                                        </div>
                                        
                                          <div class="form-group">
                                            <label>비밀번호</label>
                                            <input type="password" class="form-control" name="pwd">
                                            <p class="help-block" >비밀번호는 영문과 숫자를 포함한 최소 8자리 이상으로 해주세요.</p>
                                        </div>
                                        
                                          <div class="form-group">
                                            <label>이름</label>
                                            <input class="form-control" name="name">
                                            <p class="help-block">이름을 입력해주세요.</p>
                                        </div>
                                        
                                         <div class="form-group">
                                            <label>이메일</label>
                                            <input class="form-control" name="email">
                                            <p class="help-block">이메일을 입력해주세요.</p>
                                        </div>
                                        
                                     
                                         <div class="form-group">
                                            <label>생년월일</label>
                                          <!--   <input class="form-control"> -->
                                            <p><input type="text" id="Datepicker"></p>
                                            <p class="help-block">생년월일을 선택해주세요.</p>
                                        </div>
                                        
                                        
                                         <div class="form-group">
                                            <label>핸드폰</label>
                                            <input class="form-control" name="phone">
                                            <p class="help-block">핸드폰번호를 입력해주세요.</p>
                                        </div>
                                        
                                        
                                        
                                    <!--       <div class="form-group">
                                            <label>Text area</label>
                                            <textarea class="form-control" rows="3"></textarea>
                                        </div>
                                         -->
                                        
                                           <div class="form-group">
                                            <label>주소</label>
                                            <input class="form-control" name="addr">
                                            <p class="help-block">주소를 입력해주세요.</p>
                                        </div>
                                        
                                        
                                        
                                        
                                        
                                        
                                     
                                     <!--    <div class="form-group">
                                            <label>File input</label>
                                            <input type="file">
                                        </div> -->
                                       
                                     <!--   
                                        <div class="form-group">
                                            <label>Checkboxes</label>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Checkbox 1
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Checkbox 2
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Checkbox 3
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Inline Checkboxes</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox">1
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox">2
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox">3
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>Radio Buttons</label>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>Radio 1
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Radio 2
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">Radio 3
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Inline Radio Buttons</label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked>1
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">2
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">3
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>Selects</label>
                                            <select class="form-control">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Multiple Selects</label>
                                            <select multiple class="form-control">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div> -->
                                        
                                   
                                        
                                        <button type="submit" class="btn btn-default">회원가입</button>
                                        <button type="reset" class="btn btn-default">다시 작성</button>
                                        <button type="button" class="btn btn-default" onclick="location.href = '/index'">돌아가기</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                          </div></div></div></div>     
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

    <!-- Morris Charts JavaScript -->
    <script src="/resources/vendor/raphael/raphael.min.js"></script>
    <script src="/resources/vendor/morrisjs/morris.min.js"></script>
    <script src="/resources/data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
    
    <script src="/resources/vendor/datepicker/bootstrap-datepicker.js"></script>
    
    

</body>

</html>
