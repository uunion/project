var name; 	// default로 undefined
var email; 	// default로 undefined
var domain; // default로 undefined	
var thumbnail;  // default로 undefined

var href= window.location.href;

var clientId ;
var redirectUrl;


if ( href.indexOf('127') !== -1 ){ // 개발서버이다.
	clientId = 'dev (donnot care)';
	redirectUrl = 'http://dev (donnot care)';
}else if ( href.indexOf('mooo.com') !== -1){ // freedns에서 설정한 도메인 및 Google api 콘솔에서 등록한 도메인, 당연히 3개의 도메인 일치해야 한다. 
	clientId = '231705787707-ogeirud225tucsbjsj4ceibpkk2sapus.apps.googleusercontent.com';
	redirectUrl = 'http://projectTest.mooo.com:8080/user/login';
}else{ // 그외
	clientId = 'release';
	redirectUrl = 'http://release';
}


hello.init(
		{google: clientId}, 
		{redirect_uri: redirectUrl} 
	);

var accessToken;
function login(){
	hello('google').login({scope: 'email'}).then(function(auth) {
		hello(auth.network).api('/me').then(function(r) {
			console.log(JSON.stringify(auth));
			accessToken = auth.authResponse.access_token;
			getGoogleMe();
		});
	});
}
	    

function getGoogleMe(){
	hello('google').api('me').then(
			function(json) {
				console.log(JSON.stringify(json));
				name = json.name;
	    		email = json.email;
	    		domain = json.domain;
	    		thumbnail = json.thumbnail;
	    	
	    		var form = $('<form></form>');
	    		                  form.attr('action', '/user/loginPost');
	    		                  form.attr('method', 'post');
	    		                  form.appendTo('body');
	    		                  var uid = $('<input type="hidden" value="'+name+'" name="uid">');
	    		                  var upw = $('<input type="hidden" value="'+email+'" name="upw">');
	    		  				  var email = $('<input type="hidden" value="'+email+'" name="email">');
	    		  				  form.append(uid).append(email).append(upw);
	    		                  form.submit();
	    		  
				loginComplete();// JSNI에 정의 되어있다.
			}, 
			function(e) {
	    		console.log('me error : ' + e.error.message);
	    	});
}
function logout(){
	hello('google').logout().then(
			function() {
				console.log('logout');
			},
			function(e) {
				console.log('Signed out error: ' + e.error.message);
	    	});
}