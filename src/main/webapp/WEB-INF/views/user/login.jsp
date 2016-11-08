<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
  <meta name="google-signin-client_id" content="231705787707-ogeirud225tucsbjsj4ceibpkk2sapus.apps.googleusercontent.com">
  <title>AdminLTE 2 | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.5 -->
  <link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../resources/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../resources/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
<!--  <a id="kakao-login-btn"></a>
	<a href="http://alpha-developers.kakao.com/logout"></a>
		<div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div> -->
	<button onclick='login()'>Google LogIn</button>
	<button onclick='logout()'>Google Logout</button>
	<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div>
	<a href="#" onclick="signOut();">Sign out</a>
  --> <div class="login-logo">
    <a href="/"><b>로그인</b></a>
  	
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

   
	<form action="/user/loginPost" method="post">
		<div class="form-group has-feedback">
			<input type="text" name="uid" class="form-control" placeholder="USER ID"/>
			<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
		</div>
		<div class="form-group has-feedback">
			<input type="password" name="upw" class="form-control" placeholder="Password"/>
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		</div>
		<div class = "row">
			<div class="col-xs-8">
				<div class="checkbox icheck">
					<label>
						<input type="checkbox" name="useCookie">Remember Me
					</label>
				</div>
				</div>
				<div class="col-xs-4">
					<button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
			</div>
		</div>
	</form>

    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.1.4 -->

<script src="../resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript" src="../resources/js/hello.js"></script>
<script type="text/javascript" src="../resources/js/google_oauth.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- Bootstrap 3.3.5 -->
<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../resources/plugins/iCheck/icheck.min.js"></script>

<!-- <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<script type="text/javascript">

  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
  /*   //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('8d403ba42d6c66ee257d9ece222b3847');
    // 카카오 로그인 버튼을 생성합니다.
   function getKakaotalkUserProfile(){
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						alert(JSON.stringify(res.properties.nickname));
					      alert(JSON.stringify(res.id));
						 $("#kakao-profile").append(res.properties.nickname);
						$("#kakao-profile").append($("<img/>",{"src":res.properties.profile_image,"alt":res.properties.nickname+"님의 프로필 사진"}));
					},
					fail: function(error) {
						console.log(error);
					}
				});
    }
  function createKakaotalkLogin(){
		$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
		var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"로그인"});
		loginBtn.click(function(){
			Kakao.Auth.login({
				persistAccessToken: true,
				persistRefreshToken: true,
				success: function(authObj) {
					getKakaotalkUserProfile();
					getKakaotalkUserProfile();
					createKakaotalkLogout();
				},
				fail: function(err) {
					console.log(err);
				}
			});
		});
		$("#kakao-logged-group").prepend(loginBtn)
	}
	function createKakaotalkLogout(){
		$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
		var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"});
		logoutBtn.click(function(){
			Kakao.Auth.logout();
			createKakaotalkLogin();
			$("#kakao-profile").text("");
		});
		$("#kakao-logged-group").prepend(logoutBtn);
	}
	if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
		createKakaotalkLogout();
		getKakaotalkUserProfile();
	}else{
		createKakaotalkLogin();
	} */
   
/*    function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	    var form = $('<form></form>');
	                  form.attr('action', '/user/loginPost');
	                  //form.attr('method', 'post');
	                  form.appendTo('body');
	                  var uid = $('<input type="hidden" value="'+profile.getName()+'" name="uid">');
	                  var upw = $('<input type="hidden" value="'+profile.getEmail()+'" name="upw">');
	  				  var email = $('<input type="hidden" value="'+profile.getEmail()+'" name="uemail">');
	  				  form.append(uid).append(email).append(upw);
	                  //form.submit();
	}
   function signOut() {
	      var auth2 = gapi.auth2.getAuthInstance();
	      auth2.signOut().then(function () {
	        console.log('User signed out.');
	   });
  }   
 */
</script>
</body>
</html>
