$(document).ready(function(){

	function loadJSON(callback) {

	    var xobj = new XMLHttpRequest();
	    xobj.overrideMimeType("application/json");
	    xobj.open('GET', 'hey.json', true);
	    xobj.onreadystatechange = function() {
	        if (xobj.readyState == 4 && xobj.status == "200") {
	          // .open will NOT return a value but simply returns undefined in async mode so use a callback
	          callback(xobj.responseText);
	        }
	    }
	    xobj.send(null);
	}

	// Call to function with anonymous callback
	loadJSON(function(response) {
		console.log(response);
	  
	  // Do Something with the response e.g.
	  var jsonresponse = JSON.parse(response);

	  // print all the tweets after Parsing it
	  console.log(jsonresponse['tweets']);

	  
	  for(var i=0; i < jsonresponse['tweets'].length; i++){
	  	var json =  JSON.parse(jsonresponse['tweets'][i]);
	  	var element = '<li>'+json.text+'</li>';
	  	$('.tweets').append(element);
	  }

	  var counter = 0;

	  $('.tweets li').each(function(){
	  	counter ++;
	  	var randomX = Math.floor(Math.random()*($(window).width() - 200));
	  	var randomY = Math.floor(Math.random()*($(window).height() - 200));
		  $(this).css({
	  		"left":randomX,
	  		"top":randomY,
	  		"z-index":counter
	  	});
	  });
	  $('.tweets li').last().css({
	  	"background":"#000",
	  	"color": "#FFF"
	  });
	});


});