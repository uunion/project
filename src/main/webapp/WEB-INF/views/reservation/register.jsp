<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
     

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">2차 프로젝트</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="register"><i class="fa fa-dashboard fa-fw"></i>예약</a>
                        </li>
                        <li>
                            <a href="reservationListAll"><i class="fa fa-dashboard fa-fw"></i>예약 리스트</a>
                        </li>
                         <li>
                            <a href="map"><i class="fa fa-dashboard fa-fw"></i>맵</a>
                        </li>
                       
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Forms</h1>
                </div>
                <!-- /.col-lg-12 -->
            
  				
<form role="form" class="form-horizontal" method="post" name="frm">
  <div class="form-group">
    <label for="inputPName" class="col-sm-2 control-label">신청자</label>
    <div class="col-sm-5">
      <input type="text" class="form-control" id="inputPName" name="fname" placeholder="신청자" disabled>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPRname" class="col-sm-2 control-label">이름</label>
    <div class="col-sm-5">
      <input type="text" class="form-control" id="rname" name="rname" value="${login.uid}">
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
    <div class="col-sm-5">
      <input type="email" class="form-control" id="email" name="email" placeholder="이메일 입력">
    </div>
  </div>	
   <div class="form-group">
    <label for="inputPhone" class="col-sm-2 control-label">휴대폰</label>
    <div class="col-sm-5">
      <input type="text" class="form-control" id="phone" name="phone"placeholder="'-' 없이 입력">
    </div>
  </div>
  
 <div class="form-group">
   <label for="inputfacility" class="col-sm-2 control-label">시설 구분</label>
  <select class="form-control" name=first onchange="firstChange();"size="1" >
  	 <option>시설 선택</option>
 	 <option>주간보호시설</option>
	 <option>단기보호시설</option>
	 <option>복지관</option>
 	 <option>수화통역센터</option>
 	 <option>의료재활시설</option>
 	 <option>재활체육시설</option>
 	 <option>유형별*중증*영유아</option>
 	 <option>공동생활가정</option>
 	 </select>
</div>
 <div class="form-group">
   <label for="inputfacility" class="col-sm-2 control-label">시설 선택</label>
  <select class="form-control" name=second onchange="secondChange();"size=1>
 	 <option></option>
	</select>
</div>
	
 <div class="form-group">
    <label for="fromDate" class="col-sm-2 control-label">예약 날짜</label>
    <div class="col-sm-3">
      <input type="date" min="2016-11-07" class="form-control" id="rdate" name="rdate" placeholder="날짜">
      </div>
 </div>
 
 <div class="form-group">
    <label for="fromDate" class="col-sm-2 control-label">예약 시간</label>
    <div class="col-sm-3">
      <input type="text" class="timepicker" id="timepicker" name="rtime" name="timepicker">
    </div>
  </div>
  
</form>
			<button type="submit" class="btn btn-primary">예약하기</button>
 		    <button type="submit" class="btn btn-danger">취소</button>
           </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    
	  <!-- Bootstrap Core JavaScript -->
	  <script type="text/javascript">
		var now;
		var nowTime ;
	  $(document).ready(function(){
		    //today = 오늘 날짜 저장 
		    //예약할 시 오늘 날짜 전에는 선택이 안되게 
		  	today = new Date();
	        yyyy  = today.getFullYear();
	        mm    = (today.getMonth()+1);
	        dd    = +today.getDate();
	        // 일,월이 10보다 작으면 0을 추가 (1 -> 01)
	        if(dd<10){ dd='0'+dd } if(mm<10){ mm='0'+mm } 
	        today = yyyy+'-'+mm+'-'+dd; 
	  		//input태그에 min속성을 오늘날짜로 
	        $("#rdate").attr("min",today);
	        
		    $('input.timepicker').timepicker({});

	  });
	  $('.timepicker').timepicker({
		    timeFormat: 'h:mm p',
		    interval: 30,
		    minTime: '10',
		    maxTime: '8:00pm',
		    defaultTime: '11',
		    startTime: '09:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
	  
	 	 var formObj=$("form[role='form']");
		 $(".btn-danger").on("click",function(){
			self.location="/reservation/reservationListAll";
		 });
		 $(".btn-primary").on("click",function(){
			 formObj.submit();
			 });
	  
		 function firstChange() {// 대분류 변한 경우
		  var x = document.frm.first.options.selectedIndex;//선택한 인덱스
		  var groups=document.frm.first.options.length;//대분류 갯수
		  var group=new Array(groups);//배열 생성
		  alert(document.frm.first.value); // 셀렉트 값 가져오기
		  for (i=0; i<groups; i++) {
		   group[i]=new Array();
		  }//for
		  // 옵션(<option>) 생성
		  group[1][0]=new Option("주간보호시설 선택!!","");
		  group[1][1]=new Option("여기","ss");
		  group[1][2]=new Option("저기","dw");
		  group[1][3]=new Option("이쪽","lg");
		  group[1][4]=new Option("저쪽","lg");
		  group[2][0]=new Option("단기보호시설 선택!!","");
		  group[2][1]=new Option("여기","여기");
		  group[2][2]=new Option("저기","저기");
		  group[2][3]=new Option("이쪽","이쪽");
		  group[2][4]=new Option("저쪽","저쪽");
		  temp = document.frm.second;//두번 째 셀렉트 얻기(<select name=second>)
		  for (m = temp.options.length-1 ; m > 0 ; m--) {//현재 값 지우기
		   temp.options[m]=null
		  }
		  for (i=0;i<group[x].length;i++){//값 셋팅
		   //예) <option value="ss">삼성</option>
		   temp.options[i]=new Option(group[x][i].text,group[x][i].value);
		  }
		  temp.options[0].selected=true//인덱스 0번째, 즉, 첫번째 선택
		 }//firstChange
		 
		  function secondChange() {//중분류 변한 경우
		  
		  var first = document.frm.first.options.selectedIndex;
		  var x = document.frm.second.options.selectedIndex;
		  var groups=document.frm.second.options.length;
		  var group=new Array(groups);
		  alert(document.frm.second.value);
		  for (i=0; i<groups; i++) {
		    group[i]=new Array();
		  }
		  if(first == 1) {
		
		  }
		  temp = document.frm.third;
		  for (m = temp.options.length-1 ; m > 0 ; m--) {
		   temp.options[m]=null
		  }
		  for (i=0;i<group[x].length;i++){
		   temp.options[i]=new Option(group[x][i].text,group[x][i].value)
		  }
		  temp.options[0].selected=true
		 }//secondChange 
		 

		 
	  </script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

</body>

</html>