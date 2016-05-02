// YOUTUPE API References
// https://developers.google.com/youtube/v3/docs/

$(document).ready(function(){
	
	// GET A YOUTUBE ACCESS TOKEN (https://developers.google.com/youtube/v3/getting-started#before-you-start)
		// Connect to your Google account
		// Go to https://console.developers.google.com/apis/credentials
		// Click on the top right button and create a new project
		// Name the project
		// Click on credentials in the left menu
		// Create credentials 
		// Choose API key and Browser Key
		// And click on create
		// Then you need to activate the API you want to use
		// Click on Presentation in the left menu 
		// Click on Youtube Data API
		// Click on Enable
	var accessToken = "Access Token here";
	var tag = "cat";

	$.ajax({ 
		type: 'GET', 
		url: "https://www.googleapis.com/youtube/v3/search?part=snippet&order=date&maxResults=5&q="+tag+"&key="+accessToken,
		dataType: 'jsonp',
		crossDomain: true, 
		success: function (data) { 
			$.each( data.items, function( i, item ){
				console.log(item.id.videoId);
				var id = item.id.videoId;
				var url = "https://www.youtube.com/embed/"+id+"";
				$(".youtube").append('<iframe width="420" height="315" src="'+url+'" frameborder="0"></iframe>');
			});
		},
		error: function() { alert('Failed!'); },
	});
});

