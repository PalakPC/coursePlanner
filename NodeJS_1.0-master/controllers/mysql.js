var mysql = require("mysql");
var config = require("../config/config.js");
const bcrypt = require("bcrypt");

var mysqlController = {

    inputQuery: function(req, res) {
                    config.connection.query('create view newview as (select * from courses where prof = \'Gavrilovska\')', function(err, rows, fs) {
                        if(err) {
                            console.log('Something is broken');
                            console.log(err);
                            console.log(fs);
                        }
                    });
                    config.connection.query('select * from newview', function(err, rows, fs) {
                        if(err) {
                            console.log('Something is broken');
                            console.log(err);
                            console.log(fs);
                        }
                        res.json(rows);
                    });
                    config.connection.query('drop view newview', function(err, rows, fs) {
                        if(err) {
                            console.log('Something is broken');
                            console.log(err);
                            console.log(fs);
                        }
                    });
                },

    configure: function() {
                   config.connection.query('select * from users where username = "admin"', function(err, rows, fs) {
			           if (err) {
                           console.log('Something is broken');
                           console.log(err);
                           console.log(fs);
			           }
			           if (rows.length == 0) {
                            bcrypt.hash("password", 10, function(err, hash) {
                                var query = mysql.format('insert into users values (?, ?, ?)', ["admin", hash, "systems"]);
                    
                                config.connection.query(query, function(err, rows, fs) {
                                if(err) {
                                    console.log('Something is broken');
                                    console.log(err);
                                    console.log(fs);
                                }
                                });
                            });
					   }
				   });
			   },
    authenticate: function(req, res, next) {
	                  var isAuthenticated = false;
			          if (req.session.username) {
				           isAuthenticated = true;
			          }
			          if (isAuthenticated) {
				           next();
			          } 
			          else {
				           console.log("Authentication error");
				           //res.send("Authentication error");
				           return res.redirect('/login');
			          }
		         },

    loginPage: function(req, res) {
		           res.sendFile("login_page.html", {root: "./views/"});
		           req.session.lastPage = '/login';
	           },

	login: function(req, res) {
               var username = req.body.username || "";
		       var password = req.body.password || "";
               var query = mysql.format('select * from users where username = ?', [username]);

		       config.connection.query(query, function(err, rows, fs) {
                        if (err) {
                            console.log('Something is broken');
                            console.log(err);
                            console.log(fs);
                        }
			            if (rows.length == 1) {
                            var pw = rows[0].password;
                            console.log(pw);
                            console.log(password);
                            bcrypt.compare(password, rows[0].password, function(err, nres) 
                            {
                                if (nres)
                                {
						            req.session.username = username; //set session username for the session. Used for authentication.
						            req.session.specialization = rows[0].specialization;
						            res.redirect('/home');
					            } 
					            else {
						            res.redirect('/login');
					            }
                            });
			            }
			            else {
				            res.redirect('/login');
			            }
		       });
	       },
	
	logout: function(req, res){
		        req.session.destroy();
		        res.status(302).redirect("/login");
	        },

	home: function(req, res, next){
		res.sendFile("home.html", {root: "./views/"});
	},
    
    testPage: function(req, res) {
		res.sendFile("query.html", {root: "./views/"});
	},

    registerPage: function(req, res){
		res.sendFile("register.html", {root: "./views/"});
		req.session.lastPage = '/login';
	},

	register: function(req, res, next){
		var username = req.body.username || "";
		var password = req.body.password || "";
		var specialization = req.body.specialization || "";

		if (username == 'Username'){
			res.send("Please input a valid username");
			return;
		}
        
        var query = mysql.format('select * from users where username = ?', [username]);
        config.connection.query(query, function(err, rows, fs) {
                if (err) {
                    console.log('Something is broken');
                    console.log(err);
                    console.log(fs);
                }
                if (rows.length) {
                    res.send("This username is already taken...");
                }
                else
                {
                    bcrypt.hash(password, 10, function(err, hash) {
                        var query = mysql.format('insert into users values (?, ?, ?)', [username, hash, specialization]);
                    
                        config.connection.query(query, function(err, rows, fs) {
                        if(err) {
                            console.log('Something is broken');
                            console.log(err);
                            console.log(fs);
                        }
                        res.send("Thanks for registering...");
                        });
                    });
                }
        });
	},
};
module.exports = mysqlController;
