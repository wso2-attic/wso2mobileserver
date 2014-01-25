var gcm = gcm || {};

(function(){
    gcm.sendViaGCMtoMobile = function(reg_id,code,token,data,minutes,collapseKey){
	var myApp = new Packages.com.mycompany.app.GCMServerBridge;
	if(typeof collapseKey != 'undefined'&& collapseKey != null){
		return myApp.sendDataViaGCM(reg_id,code,token,data,minutes,collapseKey);
	}else{
		return myApp.sendDataViaGCM(reg_id,code,token,data,minutes);	
        }
    };

}());

(function(){
    gcm.setApiKey = function(api_key) { 
        return Packages.com.mycompany.app.GCMServerBridge.setApiKey(api_key);
    };

}());
