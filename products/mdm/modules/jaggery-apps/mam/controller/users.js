var userModule = require('/modules/user.js').user;
var user = new userModule(db);

var groupModule = require('/modules/group.js').group;
var group = new groupModule(db);


configuration = function(appController) {
	context = appController.context();
	try {
        var users = user.getUsersByType({type:context.contextData.user.role});
        log.info("Users >>>>>>>"+stringify(users));
	} catch(e) {
		log.info(e);
		var users = [];
	}	
	
	
	try {
		var groups = group.getAllGroups({});
	} catch(e) {
		log.info(e);
		var groups = [];
	}
	
	context.title = context.title + " | Configuration";
	context.page = "configuration";
	context.jsFile = "users/configuration.js";
	context.data = {
		configOption : "users",
		users : users,
		groups : groups
	};
	return context;
};


add = function(appController) {
	context = appController.context();

	try {
		var groups = group.getGroupsByType({type:context.contextData.user.role});	
	} catch(e) {		
		var groups = [];
	}
	

	context.title = context.title + " | Add User";
	context.page = "configuration";
	context.jsFile = "users/add.js";
	context.data = {
		configOption : "users",
		groups : groups,
		tenantId : session.get("mamConsoleUser").tenantId
	};
	return context;

};



assign_groups = function(appController) {

	var username = request.getParameter('user');

	try {
		var groups = user.getUserRoles({
			username : username
		});
	} catch(e) {
		log.info(e);
		var groups = [];
	}
	context = appController.context();
	
	context.title = context.title + " | Assign Users to group";
	context.page = "configuration";
	context.jsFile = "users/assign_groups.js";
	context.data = {
		configOption : "policies",
		groups : groups,
		tenantId : session.get("mamConsoleUser").tenantId,
		username : username

	};
	return context;
};