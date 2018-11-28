//var User = require("../models/user.js");
var mysql = require("mysql");
var childProcess = require("child_process");
var url = require("url");
var queryString = require("querystring");

var mysqlController = {
    testPage: function(req, res) {
		        res.sendfile("testPage.html", {root: "./views/"});
	          },
};

module.exports = mysqlController;
