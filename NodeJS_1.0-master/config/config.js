var mysql = require("mysql");
var path = require("path");

var dbOptions = {
                    host: 'localhost',
                    user: 'root',
                    password: 'password',
                    database: 'coursePlanner'
                };
module.exports.connection = mysql.createConnection(dbOptions);
module.exports.connection.connect();

module.exports.SERVER_PORT = 8888;
module.exports.ROOT_PATH = path.normalize(__dirname + "/..");
/*module.exports = {
	SERVER_PORT: 8888,
	ROOT_PATH: path.normalize(__dirname + "/..")
};*/
