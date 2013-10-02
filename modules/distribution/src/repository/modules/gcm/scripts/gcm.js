var gcm = gcm || {};

(function(){
    gcm.sendViaGCMtoMobile = function(reg_id,code,token,data,minutes) {
        var log = new Log();
        var myApp = new Packages.com.mycompany.app.GCMServerBridge;
        return myApp.sendDataViaGCM(reg_id,code,token,data,minutes);
    };

}());

(function(){
    gcm.setApiKey = function(api_key) {
        var log = new Log();  
        return Packages.com.mycompany.app.GCMServerBridge.setApiKey(api_key);
    };

}());
