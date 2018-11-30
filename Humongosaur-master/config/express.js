var express =  require("express");
//var mongoStore =  require("connect-mongo")(express);
var mysqlController =  require("../controllers/mysql.js");

module.exports = function(app, config){
	app.configure(mysqlController.configure);
	app.use(express.json());
	app.use(express.urlencoded());
//	app.use(express.methodOverride());
	app.use(express.static(config.ROOT_PATH + "/views"));
//	app.use(express.cookieParser());

	app.use(express.session({
		secret: "cs6400"
//		store: new mongoStore({
//			url: config.DATABASE_URL,
//			collection: "mongoweb_sesions"})
				}));
	
//	app.use(app.router);
};
