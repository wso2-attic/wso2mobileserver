$(document).ready(function () {
	
    $("#comment-add-button").click(function () {
    	var comment = $("#comment-text").val();
	if(comment.length == 0){
    	   jagg.message({content:"Invalid Comment",type:"error"});
    	   return;
    	}
    	if(comment.length > 450){
            $('#commentAdd-error').show();
            return;
        }
    	jagg.post( "../blocks/comment/comment-add/ajax/comment-add.jag", {
            action:"addComment",
            comment:comment,
            ref: addCommentRef
        }, function (result) { 
        	var jsonResult = JSON.parse(result);
        	if (!result.error) {
            	window.location.reload();
            } else {
                jagg.message({content:result.message,type:"error"});
            } 
        }, "json");
    });

   
    $("#comment-text").charCount({
			allowed: 450,
			warning: 420,
			counterText: 'Characters left: '
		});
    $("#comment-text").val('');
    $("#comment-text").prev().addClass('counter').removeClass('warning').html('Characters left: '+'450');
    
});
