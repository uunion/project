<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<div id="fb-root"></div>

<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
</head>
<body>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naver_id_login"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->



 
<a id="fb-auth" title="페이스북 아이디로 로그인" href="javascript:;">로그인 버튼</a>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
 
 <!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("1H0_nxSqDaNdk9YBqLcA", "http://localhost:8080/index");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
<!-- // 네이버아이디로로그인 초기화 Script -->

<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
<script type="text/javascript">
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		// naver_id_login.getProfileData('프로필항목명');
		// 프로필 항목은 개발가이드를 참고하시기 바랍니다.
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		 alert(naver_id_login.getProfileData('id')); 
	}

	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
</script>
<!-- //네이버아디디로로그인 Callback페이지 처리 Script -->





 
<SCRIPT language=javascript>

 
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
 
</SCRIPT>

</html>
