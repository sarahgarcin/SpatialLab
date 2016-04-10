
$(document).ready(function(){
	
// -------- Variables --------------
	//Your Access Token Here
	var accessToken = "xxx";

// -------- Functions initialization--------------
	getData("cutecats", "cats", "colonne-1"); //envoie "cutecats" comme hastag, "cats" comme nom, et "colonne-1" est l'endroit dans le HTML où ajouter les images
	
	// On click on OK button, get pictures from search in text field
	$(".colonne-2 button").click(function(){
		var tag = $(".colonne-2 input").val();
		$('.instagram .colonne-2 li').remove();
		getData(tag, tag, "colonne-2");
	});
	
	// Function getting recents pictures from hashtag on Instagram
	function getData(tag, name, colonne){
		$.ajax({ 
			type: 'GET', 
			url: "https://api.instagram.com/v1/tags/"+tag+"/media/recent?access_token="+accessToken+"", //url de récupération du json instagram
			data: { get_param: 'value' }, 
			dataType: 'jsonp',
			crossDomain: true, 
			success: function (data) { 
				$.each( data.data, function( i, item ) { // Iterate through each data values
					var imagesURL = item.images.standard_resolution.url; // Get Pictures URL in standard resolution
					var imageLegende = item.caption.text;// Get Caption
					var user = item.user.full_name; // Get User Name
					var userPicture = item.user.profile_picture; // Get User Profile Picture
					// Add picture + profil picture + user name + caption in our HTML
					$('.instagram .'+colonne).append('<li class='+name+'><img src="'+imagesURL+'"><img class="user-picture" src="'+userPicture+'" alt="profile picture"><span class="user">'+user+'</span><p>'+imageLegende+'</p></li>'); 
				});
			},
			error: function() { alert('Failed!'); },
		});
	}

});

