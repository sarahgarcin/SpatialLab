

// -------- Variables --------------
//Access Token
var accessToken = "xxx";

// Get recent pictures from a localization on instragram
function getLocation(latitude, longitude){
	$.ajax({ 
		type: 'GET', 
		url: "https://api.instagram.com/v1/media/search?lat="+latitude+"&lng="+longitude+"&access_token="+accessToken, //json url 
		data: { get_param: 'value' }, 
		dataType: 'jsonp',
		crossDomain: true, 
		success: function (data) { 
			$.each( data.data, function( i, item ) { // Iterate through each data value
				console.log(data.data);
				var imagesURL = item.images.standard_resolution.url; // Get Url of pictures in standard resolution
				// Add images to HTML
				$('.instagram .colonne-1').append('<li><img src="'+imagesURL+'" alt="ville"></li>'); 
			});
		},
		error: function() { alert('Failed!'); },
	});
}

// We are using Google Map Javascript APi to transform an adress to a latitude and longitude
// https://developers.google.com/maps/documentation/javascript/examples/geocoding-simple
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 8,
    center: {lat: -34.397, lng: 150.644}
  });
  var geocoder = new google.maps.Geocoder();

  $(document).ready(function(){
	  $('#submit').click(function(){
	  	$('.instagram .colonne-1 li').remove();
	    geocodeAddress(geocoder, map, function(callback){
	    	var lat = callback.lat;
	    	var lng = callback.lng;
	    	getLocation(lat, lng);
	    });
	  });
  });
}


function geocodeAddress(geocoder, resultsMap, callback) {
  var address = document.getElementById('address').value;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
      var lat = results[0].geometry.location.lat();
      var lng = results[0].geometry.location.lng();
      callback({lat,lng});
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}

