var source, context, analyser, frequencyArray, inputURL,
    trackName, audio, toggle_Play, artist, title, img_url,
    mouseOver, search_results;

var client_id = "8df0d68fcc1920c92fc389b89e7ce20f";

// init variables
toggle_Play = false;
mouseOver = false;

function init_Audio() {
	audio = new Audio();
	audio.crossOrigin = "anonymous";
	audio.controls = true;
	audio.loop = false;
	audio.autoplay = false;
	// Audio Context to convert frequency to array of numbers
	context = new AudioContext();
	analyser = context.createAnalyser();
	source = context.createMediaElementSource(audio);
	source.connect(analyser);
	analyser.connect(context.destination);
  	frequencyArray = new Uint8Array(analyser.frequencyBinCount);
  	canvasUpdater();
}

function textboxAuto_Highlight() {
	$("#user_URL").select();
}

function refresh_canvasSize() {
	canvas.width = window.innerWidth;
	canvas.height = window.innerHeight;
}

function handleSubmit_Button() {
    let userURL = $("#user_URL").val();
    // Remove previous search results
    $( ".resultsContainer ul").empty();
    search_results = [];

    // Check for search query instead of url
    if(userURL.search("soundcloud.com") === -1 || userURL.search("api.soundcloud.com") !== -1){
        fetch('https://api.soundcloud.com/tracks/?client_id=' + client_id + '&q=' + userURL).then(function(response) {
            if (response.status !== 200) {
                alert('Looks like there was a problem. Status Code' + response.status);
                return;
            }
            response.json().then(function(data) {
            if (data[0] == null){
                $('<h3>No Search Results</h3>').appendTo('.resultsContainer ul');
                alert('Sorry! No search results were found. Try searching by track name and/or user.');
            }
            else getSearch_Results(data);
            })
        })
        return;
    }
    let strippedURL = userURL.replace(/http:\/\/|https:\/\//, "").split("/");
    // Check for user and song
    if(strippedURL.length == 3) {
        let soundCloudUserURL = "http://" + strippedURL[0] + "/" + strippedURL[1];
        trackName = strippedURL[2];
        let apiURL = "https://api.soundcloud.com/resolve.json?url=" + soundCloudUserURL + "&client_id=" + client_id;
        getUser_Info(apiURL);
    }
}

// Stores user and track info when a SoundCloud link
// is not used for a query. This function is given
// a list of objects from SoundCloud search results.
function getSearch_Results(tracks) {
    inputURL = tracks[0].stream_url + "?client_id=" + client_id;
    title = tracks[0].title;
    img_url = tracks[0].artwork_url;
    artist = tracks[0].user.username;
    displaySearch_Results(tracks);
    playAudio();
}

function displaySearch_Results(tracks) {
    for (let i=0; i < tracks.length; i++){
        search_results.push(tracks[i].stream_url + "?client_id=" + client_id);

        title = tracks[i].title;
        img_url = tracks[i].artwork_url;
        artist = tracks[i].user.username;
        $('<li onClick="playSearch_Results(this.id)" id="'+ i +'"><img src="'+ img_url + '"></img><h3>'+ title +
        '</h3><p>'+ artist +'</p></li>').appendTo('.resultsContainer ul');
    }
    $("#0").css("background", "rgba(0, 105, 204, 0.6)");
}

// Called when a search resulsts list element is selected. 
// Plays the selected song from the search results and updates 
// the background of the list element for the old and new songs.
function playSearch_Results(id){
    inputURL = search_results[id];
    for (let i=0; i < search_results.length; i++){
        $('#' + i).css("background", "transparent");
    }
    $('#' + id).css("background", "rgba(0, 105, 204, 0.6)");
    playAudio();
}

// Find the given user on SoundCLoud and store their username as well as 
// create an API link for that users tracks.
// *Only called when a SoundCloud link is used to search for a track*
function getUser_Info(url) {
	$.getJSON(url, function(user) {
		let user_id = user.id;
		artist = user.username;
		let tracks = "https://api.soundcloud.com/users/" + user_id + "/tracks.json?client_id=" + client_id + "&limit=200";
		getTrack_Info(tracks);
	});
}

// Search a list of user tracks for the specific track. If found,
// get a stream url, title, and track image from SoundCloud.
// *Only called when a SoundCloud link is used to search for a track*
function getTrack_Info(url) {
	$.getJSON(url, function(tracks) {
		$(tracks).each(function(index) {
			track = tracks[index];
    		if(track.permalink == trackName) {
				inputURL = track.stream_url + "?client_id=" + client_id;
				title = track.title;
				img_url = track.artwork_url;
				playAudio();
				return false;
			}
		});
	});
}

// Handles the play/pause button functionality
function togglePlay() {
	if(toggle_Play) {
		toggle_Play = false;
		$("#toggle").html("&#x23f5;");
		audio.pause();
	} else {
		toggle_Play = true;
		$("#toggle").html("&#10074;&#10074;");
		audio.play();
	}
}

// Sets up and plays the selected track.
// Initializes artwork and artist info for the HTML page.
function playAudio() {
	context.resume()
	
	audio.src = inputURL;
	
	toggle_Play = true;
	document.getElementById("toggle").innerHTML = "&#10074;&#10074;";
	audio.play();
}

// Fast forwards/ rewinds the current time of the track depending
// on the audio slider position.
function sliderTime() {
	audio.currentTime = $('#audioSlider').val() * (audio.duration * .01);
}

// Clears and Updates the HTML canvas (using JS requestAnimationFrame())
// and updates the audio slider/timer.
// Calculates the frequency every call to update the visualizer.
function canvasUpdater() {
    window.requestAnimationFrame(canvasUpdater);
	// Update audio timer and slider
	// Slider
	if(!mouseOver) $("#audioSlider").val((100 / audio.duration) * audio.currentTime);
	// Timer
	let minute = Math.floor(audio.currentTime / 60),
	tenthsSec = Math.floor(audio.currentTime % 60) < 10 ? "0" : "",
	hundredthsSec = Math.floor(audio.currentTime % 60);
	$('#audioTimer').html(minute + ':' + tenthsSec + hundredthsSec);
}