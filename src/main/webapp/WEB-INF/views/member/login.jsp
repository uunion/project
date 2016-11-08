<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <title>Helper HomePage</title>

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
    
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


 	



</head>

<body>
<form action="/member/loginPost" method="post">

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Helper</h3>
                    </div>
                     
                    <div class="panel-body">
                       
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="ID" name="memberid" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="pwd" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="useCookie" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button type="submit" class="btn btn-lg btn-success btn-block">Login</button>
                                
                              	
                              	
                               <button type="button" class="btn btn-lg btn-primary btn-block"  onlogin="checkLoginState();"  >Facebook Login</button>
                               <div id="status">
								</div>
                               	
                               	<a id="fb-auth" title="페이스북 아이디로 로그인" href="javascript:;">로그인 버튼</a>
                          
                                 <button type="button" class="btn btn-lg btn-danger btn-block"  onclick="" >Google Login</button>
                                 
                              
                                 <button type="button" class="btn btn-lg btn-green btn-block"  onclick="" >Naver Login</button>
                       
                                 
                            </fieldset>
                       
                    </div>
                     
                </div>
            </div>
        </div>
    </div>

</form>
	


	
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

</body>

<script type="text/javascript">

 
window.fbAsyncInit = function(){
    FB.init({ appId: '827228793985134', 
        status: true, 
        cookie: true,
        xfbml: true,
        oauth: true});
}
 
function updateButton(response) {
    var button = document.getElementById('fb-auth');
     
    if (response.authResponse) {
       
      FB.api('/me', function(response) {
        if(confirm('facebookID:'+response.email+' 로 로그인하시겠습니까?')==true){
        // 확인을 선택했을 경우의 처리. 이 예제에서는 페이스북으로부터 넘겨받은 값들을 post로 다른 페이지에 전달하고 있음. form 생성 및 서브밋은 jquery로..
                                                                var $form = $('<form></form>');
                $form.attr('action', 'http://localhost:8080/index');
                /* $form.attr('method', 'post'); */
                $form.attr('target', 'ifrm');  // 타겟은 임의로 지정함
                $form.appendTo('body');
                 
                var fuid = $('<input type="hidden" value="'+response.email+'" name="fuid">');
                var fname = $('<input type="hidden" value="'+response.name+'" name="fname">');
                var fsex = $('<input type="hidden" value="'+response.sex+'" name="fsex">');
                var ffirst_name = $('<input type="hidden" value="'+response.first_name+'" name="ffirst_name">');
                var flast_name = $('<input type="hidden" value="'+response.last_name+'" name="flast_name">');
                var flocale = $('<input type="hidden" value="'+response.locale+'" name="flocale">');
                var fbirthday = $('<input type="hidden" value="'+response.birthday+'" name="fbirthday">');
                 
                 console.log(fuid);
                console.log(fsex);
                console.log(flocale);
                console.log($form); 
                
                
                
                $form.append(fuid).append(fname).append(fsex).append(ffirst_name).append(flast_name).append(flocale).append(fbirthday);
                $form.submit();
          }else{
        // 취소를 선택했을 경우의 처리(아래는 페이스북 로그아웃 처리)
                                                  FB.logout(function(response) {
                     
              });
          }
      });
       
       
    } else {
         FB.login(function(response) {
            if (response.authResponse) {
                FB.api('/me', function(response) {
                 
                });    
            } else {
                 
            }
        }, {scope:'email'});    
    }
  }
 
document.getElementById('fb-auth').onclick = function() {
     
    FB.Event.subscribe('auth.statusChange', updateButton);  
    FB.getLoginStatus(updateButton);
};
     
(function() {
  var e = document.createElement('script'); e.async = true;
  e.src = document.location.protocol 
    + '//connect.facebook.net/ko_KR/all.js';
  document.getElementById('fb-root').appendChild(e);
}());
 
</script>
	

</html>
