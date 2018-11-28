var mysql = require("mysql");
var express = require("express");
var config = require("./config/config.js")
var mysqlController = require("./controllers/mysql.js");
var _ = require("underscore");

var app = express();

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'password',
    database: 'coursePlanner'
});
connection.connect();

require("./config/express.js")(app, config);

app.get('/', function(req, res) {
        res.redirect("login");
    });

//Serving pages
app.get("/login", mysqlController.loginPage);
/*app.get("/register", mysqlController.helper.authenticateAdmin, mysqlController.registerPage);
app.get("/home", mysqlController.helper.authenticate, mysqlController.home);
app.get("/inputQuery", mysqlController.inputQuery);
*/
//test page
app.get("/testPage", mysqlController.testPage);
/*
//Posts
app.post("/login", mysqlController.login);
app.post("/logout", mysqlController.logout);
app.post("/register", mysqlController.helper.authenticateAdmin, mysqlController.register);
*/
app.listen(config.SERVER_PORT);
console.log("mysql server up and running at --> " + config.SERVER_PORT);

