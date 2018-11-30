var express =  require("express");
var mysqlController =  require("../controllers/mysql.js");
var session = require("express-session");
var bodyParser = require("body-parser");

module.exports = function(app, config){
	mysqlController.configure();
	app.use(express.json());
	app.use(bodyParser.urlencoded({extended: true}));
/*	app.use(express.methodOverride());
	app.use(express.static(config.ROOT_PATH + "/views"));
	app.use(express.cookieParser());
*/
    app.use(function(req, res, next) {
            res.set('Cache-Control', 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0');
            next();
    });
	app.use(session({
		secret: "cs6400",
        resave: false,
        saveUninitialized: true
	}));
	
//	app.use(app.router);
};
