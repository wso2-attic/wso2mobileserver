var PORTAL_OPTIONS = 'portal.options';

var STORE_SPACE = 'portal.store.space';

var init = function (options) {
    application.put(PORTAL_OPTIONS, options);
};

var options = function () {
    return application.get(PORTAL_OPTIONS);
};

var register = function(user, password, session) {

};

var login = function (user, password, session) {
    var opts = options(),
        carbon = require('carbon');
    session.put(STORE_SPACE, new carbon.user.Space(user.username, opts.storeSpace.space, opts.storeSpace.options));
};

var logout = function (user, session) {
    session.remove(STORE_SPACE);
};

var storeSpace = function() {
    return session.get(STORE_SPACE);
};