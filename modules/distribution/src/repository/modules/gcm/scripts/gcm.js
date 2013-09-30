var gcm = gcm || {};

(function(){
    gcm.sendViaGCMtoMobile = function(reg_id,code,token,data,minutes) {
        var log = new Log();
        var myApp = new Packages.com.mycompany.app.GCMServerBridge;
        return myApp.sendDataViaGCM(reg_id,code,token,data,minutes);
    };

}());
