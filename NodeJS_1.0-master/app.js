//Node.js server to print the rows of a MySQL table to an HTML page on button click.

var mysql = require("mysql");
var express = require("express");
var config = require("./config/config.js");
var mysqlController = require("./controllers/mysql.js");

var app = express();
app.use(express.static(__dirname + "/views")); 

require("./config/express.js")(app, config);

app.get('/', function(req, res){
		res.redirect("login");
	});

//Serving pages
app.get("/login", mysqlController.loginPage);
app.get("/register", mysqlController.registerPage);
app.get("/update", mysqlController.authenticate, mysqlController.updatePage);
app.get("/report", mysqlController.authenticate, mysqlController.reportPage);
app.get("/home", mysqlController.authenticate, mysqlController.home);
app.get("/result", mysqlController.authenticate, mysqlController.resultPage);
//app.get("/home", mysqlController.home);

//Posts
app.post("/login", mysqlController.login);
app.get("/logout", mysqlController.logout);
app.post("/register", mysqlController.register);
app.post("/update", mysqlController.update);

app.get("/testPage", mysqlController.testPage);
app.get("/reporter", mysqlController.reporter);
app.get("/resulter", mysqlController.resulter);
app.get("/reporter2", mysqlController.reporter2);

app.post("/inputQuery", mysqlController.inputQuery);
app.listen(config.SERVER_PORT);
console.log("Mysql server up and running at --> " + config.SERVER_PORT);
