var configs = require('/config.json');


var server = require('/modules/server.js');
server.init(configs);

var user = require('/modules/user.js');
user.init(configs);
