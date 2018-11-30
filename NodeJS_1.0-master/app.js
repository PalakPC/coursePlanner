//Node.js server to print the rows of a MySQL table to an HTML page on button click.

var mysql = require("mysql");
var express = require("express");
var path = require("path");
var SERVER_PORT = 8888;

var app = express();
app.use(express.static(__dirname + "/views")); 

var connection = mysql.createConnection({
   host: 'localhost',
   user: 'root',
   password: 'password',
   database: 'coursePlanner'
});
connection.connect();

app.get('/', function(req, res) {
   res.redirect("home");
});

app.get("/home", function(req, res, next) {
   res.sendFile("home.html", {root: "./views/"});
});

app.get("/inputQuery", function(req, res) {
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

app.listen(process.env.PORT || SERVER_PORT);
console.log("Mysql server up and running at --> " + SERVER_PORT);
