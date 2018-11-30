var express =  require("express");

module.exports = function(app, config){
	app.use(express.json());
	app.use(express.urlencoded());
	app.use(express.static(config.ROOT_PATH + "/views"));
};

