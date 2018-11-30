//Node.js server to print the rows of a MySQL table to an HTML page on button click.

var mysql = require("mysql");
var express = require("express");
var config = require("./config/config.js");
var mysqlController = require("./controllers/mysql.js");

var app = express();
app.use(express.static(__dirname + "/views")); 

//var connection = mysql.createConnection(config.dbOptions);
//connection.connect();

require("./config/express.js")(app, config);
/*
app.get('/', function(req, res) {
   res.redirect("home");
});

app.get("/home", function(req, res, next) {
   res.sendFile("home.html", {root: "./views/"});
});
*/
/*app.get("/inputQuery", function(req, res) {
   connection.query('create view newview as (select * from courses where prof = \'Gavrilovska\')', function(err, rows, fs) {
      if(err) {
         console.log('Something is broken');
         console.log(err);
         console.log(fs);
      }
   });
   connection.query('select * from newview', function(err, rows, fs) {
      if(err) {
         console.log('Something is broken');
         console.log(err);
         console.log(fs);
      }
      console.log(rows);
      res.json(rows);
   });
   connection.query('drop view newview', function(err, rows, fs) {
      if(err) {
         console.log('Something is broken');
         console.log(err);
         console.log(fs);
      }
   });
});
*/

app.get('/', function(req, res){
		res.redirect("login");
	});

//Serving pages
app.get("/login", mysqlController.loginPage);
app.get("/register", mysqlController.registerPage);
app.get("/home", mysqlController.authenticate, mysqlController.home);

//Posts
app.post("/login", mysqlController.login);
app.post("/logout", mysqlController.logout);
app.post("/register", mysqlController.register);

app.get("/testPage", mysqlController.testPage);

app.get("/inputQuery", mysqlController.inputQuery);
app.listen(config.SERVER_PORT);
console.log("Mysql server up and running at --> " + config.SERVER_PORT);
