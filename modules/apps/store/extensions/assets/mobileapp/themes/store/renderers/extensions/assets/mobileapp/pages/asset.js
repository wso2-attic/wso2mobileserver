
var log=new Log('assets.mobil');
var render = function(theme, data, meta, require) {
	log.info('hit');
    require('/renderers/asset.js').render(theme, data, meta, require);
};