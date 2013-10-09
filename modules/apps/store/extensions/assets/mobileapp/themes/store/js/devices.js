$(".device-image").each(function(index) {	
	var device = getURLParameter("device");	
	if(device != "null"){
		var deviceId = $(this).data("deviceId");
		if(deviceId != device){
			$(this).fadeTo("slow", 0.1);
		}else{
			$(this).parent().css("cursor", "default");
			$(this).fadeTo("slow", 1);
		}
	}else{
		$(this).css("opacity", 1);
	}
	
	var srcImage = $(this).attr("src");	
	if (!urlExists(srcImage)) {
		$(this).attr("src", "/assets/wso2mobile/img/models/none.png");
	}
});

$(".device-image-modal").each(function(index) {	
	var srcImage = $(this).attr("src");	
	if (!urlExists(srcImage)) {
		$(this).attr("src", "/assets/wso2mobile/img/models/none.png");
	}
});

function urlExists(url){
    var http = new XMLHttpRequest();
    http.open('HEAD', url, false);
    http.send();
    return http.status!=404;
}


$(".device-image-block").click(function(index) {
	var device = getURLParameter("device");
	var deviceId = $(this).data("deviceId");	
	if(device != deviceId){
		var uri = window.location.pathname + window.location.search;	
		location.href = updateQueryStringParameter(uri, 'device', deviceId);
	}
	
	
});

$(".device-image-block-modal").click(function(index) {	
	var deviceId = $(this).data("deviceId");
	performInstalltion(deviceId, appToInstall);	
});


function performInstalltion(device, app){
	jQuery.ajax({
      url: "/store/apps/devices/" + device + "/install", 
      type: "POST",
      dataType: "json",	
      data : {"asset": app}			      
	});
	
	$( document ).ajaxComplete(function() {
		asset.process("mobileapp",app, location.href);
	});
	
}


function updateQueryStringParameter(uri, key, value) {
  var re = new RegExp("([?|&])" + key + "=.*?(&|$)", "i");
  separator = uri.indexOf('?') !== -1 ? "&" : "?";
  if (uri.match(re)) {
    return uri.replace(re, '$1' + key + "=" + value + '$2');
  }
  else {
    return uri + separator + key + "=" + value;
  }
}

function getURLParameter(name) {
    return decodeURI(
        (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]
    );
}
