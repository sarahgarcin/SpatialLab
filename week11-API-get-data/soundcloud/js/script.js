
$(document).ready(function(){
// Soundcloud API Reference:
// https://developers.soundcloud.com/docs/api/reference
	
	// GET YOUR CLIENT ID:
		// Go to http://soundcloud.com/you/apps
		// Register a new application
		// Name your app and click on register
		// Save your app
		// Get the client ID and add it here
	var clientID = "Your client ID";
	var tag = "love";

	$.ajax({ 
		type: 'GET', 
		url: "http://api.soundcloud.com/tracks.json?client_id="+clientID+"&q="+tag+"&limit=5", //url de récupération du json instagram
		dataType: 'json',
		//crossDomain: true, 
		success: function (data) { 
			console.log(data);
			$.each( data, function( i, item ){
				var image = item.artwork_url;
				var wave = item.waveform_url;
				var id = item.id;
				var iframe = "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/"+id+"&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true";
				$(".soundcloud ul").append('<li><iframe width="100%" height="450" scrolling="no" frameborder="no" src="'+iframe+'"></iframe><img src="'+image+'"/><img src="'+wave+'"/></li>');

			});
		},
		error: function() { alert('Failed!'); },
	});
});
