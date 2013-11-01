
var policy = policy || {};
var entitlement = entitlement || {}; 

(function(){
	var log = new Log();
	
	var PEPProxy = Packages.org.wso2.carbon.identity.entitlement.proxy.PEPProxy;
	var PEPProxyConfig = Packages.org.wso2.carbon.identity.entitlement.proxy.PEPProxyConfig;
	var Attribute = Packages.org.wso2.carbon.identity.entitlement.proxy.Attribute;
	var AXIOMUtil = Packages.org.apache.axiom.om.util.AXIOMUtil;
	var OMElement = Packages.org.apache.axiom.om.OMElement;
	var QName = Packages.javax.xml.namespace.QName;
	var ProxyConstants = Packages.org.wso2.carbon.identity.entitlement.proxy.ProxyConstants;
	
	
	
	var remoteServiceUrl = "https://localhost:9443/admin/services/";
		
    	policy.init = function() {
		var remoteServiceUserName = "admin@admin.com";
		var remoteServicePassword = "admin";		 
		var client = "basicAuth";

		var appToPDPClientConfigMap = new java.util.HashMap();
	    	var clientConfigMap = new java.util.HashMap();

		clientConfigMap.put("client", client);
        	clientConfigMap.put("serverUrl", remoteServiceUrl);
        	clientConfigMap.put("userName", remoteServiceUserName);
        	clientConfigMap.put("password", remoteServicePassword);
	     
        	appToPDPClientConfigMap.put("EntitlementMediator", clientConfigMap);
        	var config = new PEPProxyConfig(appToPDPClientConfigMap,"EntitlementMediator", null, 100000, 1000);

		pepProxy = new PEPProxy(config);
        	
        	return pepProxy;
    	};

	policy.getDecision = function(resource, action, subject, env){
		var simpleDecision = null;
				
			var subjectAttribute = new Attribute("urn:oasis:names:tc:xacml:1.0:subject-category:access-subject", "urn:oasis:names:tc:xacml:1.0:subject:subject-id", ProxyConstants.DEFAULT_DATA_TYPE, subject);
        	var actionAttribute = new Attribute("urn:oasis:names:tc:xacml:3.0:attribute-category:action", "urn:oasis:names:tc:xacml:1.0:action:action-id", ProxyConstants.DEFAULT_DATA_TYPE, action);
        	var resourceAttribute = new Attribute("urn:oasis:names:tc:xacml:3.0:attribute-category:resource", "urn:oasis:names:tc:xacml:1.0:resource:resource-id", ProxyConstants.DEFAULT_DATA_TYPE, resource);    
			var attributes = new Array();
			attributes[0] = subjectAttribute;
			attributes[1] = actionAttribute;
			attributes[2] = resourceAttribute;
			var decision = pepProxy.getDecision(attributes); 
		    	
	        var decisionElement = AXIOMUtil.stringToOM(decision);
	        simpleDecision = decisionElement.getFirstChildWithName(new QName("Result")).getFirstChildWithName(new QName("Decision")).getText();
	            
	    
	     return simpleDecision;
	}	

	

}());

(function(){
	var log = new Log();	
	var authCookie;
	var configCtx;
	var ConfigurationContextFactory = Packages.org.apache.axis2.context.ConfigurationContextFactory;
	var AuthenticationAdminStub = Packages.org.wso2.carbon.authenticator.stub.AuthenticationAdminStub;
	var EntitlementPolicyAdminServiceStub = Packages.org.wso2.carbon.identity.entitlement.stub.EntitlementPolicyAdminServiceStub;
	var HTTPConstants = Packages.org.apache.axis2.transport.http.HTTPConstants;
	var PolicyDTO = Packages.org.wso2.carbon.identity.entitlement.stub.dto.PolicyDTO;
	var BACKEND_SERVER_URL = "https://localhost:9443/admin/services/";
	var keyStorePath = "/Users/dulitharasangawijewantha/Development/WSO2/Products/wso2mobileserver-1.0.0/repository/resources/security/" +"wso2carbon.jks";
	var remoteIP = "192.168.1.248";

	entitlement.login = function (){
		java.lang.System.setProperty("javax.net.ssl.trustStore", keyStorePath);
	    	java.lang.System.setProperty("javax.net.ssl.trustStorePassword", "wso2carbon");
		configCtx = ConfigurationContextFactory.createConfigurationContextFromFileSystem(null, null);
		var authorized = false;
	    if (authenticate("admin@admin.com", "admin", remoteIP)) {
	    	java.lang.System.out.println("user logged in.");
	        authorized = true;
	    }else {
	    	java.lang.System.out.println("Not allowed to login.");
	        authorized = false;
	    }
	    return authorized;
	} 
 
	var authenticate = function(userName, password, remoteIp) {
	        var serviceURL = null;        
	        var authenticationAdminStub = null;
	        var isAuthenticated = false;	
	        serviceURL = BACKEND_SERVER_URL + "AuthenticationAdmin"; //hard coded URL of the service	
	        java.lang.System.out.println(userName + " " + password + " " + remoteIp);	
	        
	        authenticationAdminStub = new AuthenticationAdminStub(configCtx, serviceURL);
	       
	        //Set session management in enabled state
	        authenticationAdminStub._getServiceClient().getOptions().setManageSession(true);
	
	        //try to login to the system with user information
	        isAuthenticated = authenticationAdminStub.login(userName, password, remoteIp);
	     
	        authCookie = authenticationAdminStub._getServiceClient().getServiceContext().getProperty(HTTPConstants.COOKIE_STRING);
	        return isAuthenticated;
	}

	entitlement.setEntitlementPolicyAdminServiceParameters = function() {
	        var serviceURL = null;
	        var client = null;
	        var option = null;
	        var entitlementPolicyAdminServiceStub = null;
	
	        //set the relevant service URL
	        serviceURL = BACKEND_SERVER_URL + "EntitlementPolicyAdminService";
	
	        entitlementPolicyAdminServiceStub = new EntitlementPolicyAdminServiceStub(configCtx,serviceURL);
	        
	        client = entitlementPolicyAdminServiceStub._getServiceClient();
	        option = client.getOptions();
	        option.setManageSession(true);
	        option.setProperty(HTTPConstants.COOKIE_STRING,authCookie);
	        return entitlementPolicyAdminServiceStub;
	}
	
	entitlement.addPolicy = function(policyString, entitlementPolicyAdminServiceStub, policyId) {
		var policyDTO = new PolicyDTO(); 
	    	policyDTO.setActive(true);
	    	policyDTO.setPromote(true);
	    	
	    	var array = new Array();
		array[0] = policyDTO;
		policyDTO.setPolicy(policyString.trim());
		policyDTO.setPolicyId(policyId);
		entitlementPolicyAdminServiceStub.addPolicies(array);				                                          
		java.lang.System.out.println("Policy added.");			
	}
	entitlement.removePolicy = function(policyId,entitlementPolicyAdminServiceStub){
		entitlementPolicyAdminServiceStub.removePolicy(policyId,true);
	}
	entitlement.readExistingPolicy = function(entitlementPolicyAdminServiceStub, policyId) {
		log.info("Policy Id"+policyId);
        	var policy = null;
        	var policyDTO = entitlementPolicyAdminServiceStub.getPolicy(policyId,true);
		log.info(policyDTO);
        	policy = policyDTO.getPolicy();
        	java.lang.System.out.println("Read Policy:" + policy);
		return policy;
       }
	entitlement.evaluatePolicy = function (requestString, entitlementServiceStub) {
            var response = null;
            response = entitlementServiceStub.getDecision(requestString);
            return response;

    	}
}());

