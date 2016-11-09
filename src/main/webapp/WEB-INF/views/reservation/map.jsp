<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>장애인 정보 서비스</title>
       <style type="text/css">
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 500px;
        width: 700px;
      }
.controls {
  margin-top: 10px;
  border: 1px solid transparent;
  border-radius: 2px 0 0 2px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  height: 32px;
  outline: none;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pac-input {
  background-color: #fff;
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
  margin-left: 12px;
  padding: 0 11px 0 13px;
  text-overflow: ellipsis;
  width: 300px;
}

#pac-input:focus {
  border-color: #4d90fe;
}

.pac-container {
  font-family: Roboto;
}

#type-selector {
  color: #fff;
  background-color: #4d90fe;
  padding: 5px 11px 0px 11px;
}

#type-selector label {
  font-family: Roboto;
  font-size: 13px;
  font-weight: 300;
}

    </style>

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

	<div id = "wrapper">
	      
	      
    
      		<%@include file="../header.jsp"%>
      		<%@include file="../sidebar.jsp"%>

        <!-- Page Content -->
        
        <div id="page-wrapper">
		  	<input id="pac-input" class="controls" type="text" placeholder="Search Box">
			<div id="map"></div>
		</div>
    </div>
    <!-- /#wrapper -->
 <script type="text/javascript">
    var map;
    function initAutocomplete() {
    	    map = new google.maps.Map(document.getElementById('map'), {
    	    center: {lat: 37.494791 , lng: 126.887394},
    	    zoom: 17,
    	    mapTypeId: google.maps.MapTypeId.ROADMAP
    	  });
		
    	/*   google.maps.event.addListener(map, 'click', function(event) {
    		    placeMarker(event.latLng);
    		  }); */
    	  var input = document.getElementById('pac-input');
    	  var searchBox = new google.maps.places.SearchBox(input);
    	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    	  map.addListener('bounds_changed', function() {
    	    searchBox.setBounds(map.getBounds());
    	  });
    	  var markers = [];
    	  searchBox.addListener('places_changed', function() {
    	    var places = searchBox.getPlaces();

    	    if (places.length == 0) {
    	      return;
    	    }
    	    markers.forEach(function(marker) {
    	      marker.setMap(null);
    	    });
    	    markers = [];

    	    var bounds = new google.maps.LatLngBounds();
    	    places.forEach(function(place) {
    	      var icon = {
    	        url: place.icon,
    	        size: new google.maps.Size(71, 71),
    	        origin: new google.maps.Point(0, 0),
    	        anchor: new google.maps.Point(17, 34),
    	        scaledSize: new google.maps.Size(25, 25)
    	      };
    	      markers.push(new google.maps.Marker({
    	        map: map,
    	        icon: icon,
    	        title: place.name,
    	        position: place.geometry.location
    	      }));

    	      if (place.geometry.viewport) {
    	        bounds.union(place.geometry.viewport);
    	      } else {
    	        bounds.extend(place.geometry.location);
    	      }
    	    });
    	    map.fitBounds(bounds);
    	  });
    	}
    
/* function placeMarker(location) {
	  var marker = new google.maps.Marker({
	      position: location, 
	      map: map
	  });

} */
</script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCg6oSNDC661DJTwl0y1pvv5OeXMj_Xmw8&libraries=places&callback=initAutocomplete"
    		async defer></script>
    <!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>
</body>
</html>
