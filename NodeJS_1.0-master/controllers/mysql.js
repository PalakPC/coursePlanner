var mysql = require("mysql");
var config = require("../config/config.js");
const bcrypt = require("bcrypt");

var myfinalresponse;
var specified = [];
var filtered = [];
var coursesAlreadyTaken;
var clash;
var thresholdA = 0;
var thresholdB = 0;
var counttillnow = 0;
var sumtillnow = 0;
var this_time_count = 0;

var mysqlController = {

    inputQuery: function(req, res) {
                    var user_count = 0;
                    var spec_courses = [];
                    var final_list = [];
                    var total;
                    var old;
                    specified = [];
                    filtered = [];
                    
                    for (var prop in req.body)
                    {
                        if (req.body[prop] != 'None')
                        {
                            if (user_count >=2 && spec_courses.indexOf(req.body[prop]) <= -1)
                            {
                                spec_courses.push(req.body[prop]);
                                specified.push(req.body[prop]);
                            }
                            user_count++;
                        }
                    }
                    
                    query = mysql.format('select sum(grade) as total, count(*) as old from taken where username = ?', ['pchoudhary32']);
                    config.connection.query(query, function(err, rows, fs) {
                        if(err) {
                            console.log('Something is broken');
                            console.log(err);
                            console.log(fs);
                        }
                        var gpa = rows[0].total / rows[0].old;
                        old = rows[0].old;
                        total = rows[0].total;
                        if (gpa > 3.5) { thresholdA = 3.5; thresholdB = 3.3;}
                        else if (gpa >= 3.0) { thresholdA = 3.7; thresholdB = 3.5;}
                        else { thresholdA = 3.8; thresholdB = 3.6; }
                    });

                    user_count = user_count - 2;
                    var cr_count = req.body.credits / 3;
                    var count = cr_count > user_count ? cr_count : user_count;
                    this_time_count = count;
                    var taken = [];
                    var string = req.session.username;
                    
                    var promise = new Promise(function(resolve, reject){
                        var query = mysql.format('select crn from taken where username = ?', [string]);
                        config.connection.query(query, function(err, rows, fs) {
                            if(err) {
                                reject(err);
                                console.log('Something is broken');
                                console.log(err);
                                console.log(fs);
                            }
                            for (var i = 0; i < rows.length; ++i)
                            {
                                taken.push(rows[i].crn);
                            }
                            resolve(taken);
                        });
                    });
                    var promise2 = new Promise(function(resolve, reject){
                        promise.then(function(result){
                            console.log("promise");
                            query = mysql.format('create view el_courses as select * from courses where crn not in (?)', [result]);
                            config.connection.query(query, function(err, rows, fs) {
                                if(err) {
                                    reject(err);
                                    console.log('Something is broken');
                                    console.log(err);
                                    console.log(fs);
                                }
                            });
                            resolve(result);
                        });
                    });

                    var promise3 = new Promise(function(resolve, reject){
                        promise2.then(function(result){
                            console.log("promise2"); 
                            query = mysql.format('select * from courses where crn in (?)', [result]);
                            config.connection.query(query, function(err, rows, fs) {
                                if(err) {
                                    reject(err);
                                    console.log('Something is broken');
                                    console.log(err);
                                    console.log(fs);
                                }
                                coursesAlreadyTaken = rows;
                                for (var i = 0; i < rows.length; ++i)
                                {
                                    var index= spec_courses.indexOf(rows[i].cname);
                                    if (index > -1)
                                    {
                                        spec_courses.splice(index,1);
                                    }
                                }
                                resolve(spec_courses);
                                filtered = spec_courses;
                            });
                        });
                    });
                                       

                    var promise4 = new Promise(function(resolve, reject){
                        promise3.then(function(result){
                        console.log("promise3");
                            query = mysql.format('create view newview as select * from el_courses where cname in (?)', [spec_courses]);
                            config.connection.query(query, function(err, rows, fs) {
                                if(err) {
                                    reject(err);
                                    console.log('Something is broken');
                                    console.log(err);
                                    console.log(fs);
                                }
                                resolve(rows);
                            });
                        });
                    });
                    
                    var promise5 = new Promise(function(resolve, reject){
                    promise4.then(function(result) {
                        console.log("promise4");
                        query = mysql.format('select distinct c.cname as c1, s.cname as c2, c.Days as days, c.start_time as time, c.gpa from newview c, newview s where c.cname != s.cname and c.Days = s.Days and c.start_time = s.start_time order by c.gpa desc');
                        config.connection.query(query, function(err, rows, fs) {
                            if(err) {
                                reject(err);
                                console.log('Something is broken');
                                console.log(err);
                                console.log(fs);
                            }
                            console.log(rows);
                            clash = rows;
                            for (var i = 1; i < rows.length; ++i)
                            {
                                var index = spec_courses.indexOf(rows[i].c1);
                                if (index > -1)
                                {
                                    spec_courses.splice(index, 1);
                                }
                            }
                            resolve(spec_courses);
                        });
                    });
                    });

                    var specialization = req.session.specialization;
                    var promise6 = new Promise(function(resolve, reject){
                    promise5.then(function(result) {
                        console.log("promise5");
                            query = mysql.format('create view newview1 as select el_courses.cname, el_courses.gpa, el_courses.days, el_courses.start_time from el_courses, specializations where el_courses.crn = specializations.crn and specialization = ?', [specialization]);
                            config.connection.query(query, function(err, rows, fs) {
                                if(err) {
                                    reject(err);
                                    console.log('Something is broken');
                                    console.log(err);
                                    console.log(fs);
                                }
                            resolve(rows);
                            });
                        });
                });
                    
                    var promise7 = new Promise(function(resolve, reject){
                    promise6.then(function(result) {
                        console.log("promise6");
                        query = mysql.format('select * from newview1');
                        spec_courses = [];
                        config.connection.query(query, function(err, rows, fs) {
                            if(err) {
                                reject(err);
                                console.log('Something is broken');
                                console.log(err);
                                console.log(fs);
                            }
                                for(var i = 0; i < rows.length; ++i)
                                {
                                    var index = spec_courses.indexOf(rows[i].cname);
                                    if (index <= -1)
                                    {   
                                        spec_courses.push(rows[i].cname);
                                    }
                                }
                                resolve(spec_courses);
                        });
                        });
                    });

                    var promise8 = new Promise(function(resolve, reject) {
                            promise7.then(function(result){
                        console.log("promise7");
                        query = mysql.format('select c.cname as first, c.gpa as fg, s.cname as second, s.gpa as sg from newview1 c, newview1 s where c.cname != s.cname and c.Days = s.Days and c.start_time = s.start_time order by c.gpa desc');
                        config.connection.query(query, function(err, rows, fs) {
                            if(err) {
                                reject(err);
                                console.log('Something is broken');
                                console.log(err);
                                console.log(fs);
                            }
                            spec_courses = result;
                            console.log(spec_courses);
                            for (var i = 1; i < rows.length; ++i)
                            {
                                console.log(rows[i]);
                                if (rows[i].fg < rows[i].sg)
                                {
                                    var index;
                                    index = spec_courses.indexOf(rows[i].first);
                                    if (index > -1)
                                    {
                                        spec_courses.splice(index, 1);
                                    }
                                }
                                else
                                {
                                    var index;
                                    index = spec_courses.indexOf(rows[i].second);
                                    if (index > -1)
                                    {
                                        spec_courses.splice(index, 1);
                                    }
                                }
                                console.log(spec_courses);
                            }
                            resolve(spec_courses);
                        });
                    });
                    });

                    var promise9 = new Promise(function(resolve, reject){
                    promise8.then(function(result) {
                        console.log("promise8");
                        console.log(result);
                        query = mysql.format('select * from el_courses where cname in (?) order by gpa desc', [result]);
                        config.connection.query(query, function(err, rows, fs) {
                            if(err) {
                                reject(err);
                                console.log('Something is broken');
                                console.log(err);
                                console.log(fs);
                            }
                            resolve(rows);
                        });
                    });
                    });

                    promise9.then(function(result) {
                        console.log("promise9");
                        query = mysql.format('drop view newview');
                        config.connection.query(query, function(err, rows, fs) {
                            if(err) {
                                console.log('Something is broken');
                                console.log(err);
                                console.log(fs);
                            }
                        });
                        query = mysql.format('drop view el_courses');
                        config.connection.query(query, function(err, rows, fs) {
                            if(err) {
                                console.log('Something is broken');
                                console.log(err);
                                console.log(fs);
                            }
                        });
                        query = mysql.format('drop view newview1');
                        config.connection.query(query, function(err, rows, fs) {
                            if(err) {
                                console.log('Something is broken');
                                console.log(err);
                                console.log(fs);
                            }
                        });
                        myfinalresponse = result;
                        result.length = count;
                        //res.json(result);
                        res.redirect('/result');
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
                            bcrypt.compare(password, rows[0].password, function(err, nres) 
                            {
                                if (nres)
                                {
						            req.session.username = username; //set session username for the session. Used for authentication.
						            req.session.specialization = rows[0].specialization;
						            res.redirect('/home');
					            } 
					            else {
						            res.json("incorrect password");
					            }
                            });
			            }
			            else {
				            res.json("user not found");
			            }
		       });
	       },
	
	logout: function(req, res){
		        req.session.destroy();
		        res.status(302).redirect("/login");
	        },

	home: function(req, res){
		res.sendFile("home2.html", {root: "./views/"});
	},
    
    testPage: function(req, res) {
		res.sendFile("query.html", {root: "./views/"});
	},

    registerPage: function(req, res){
		res.sendFile("register.html", {root: "./views/"});
		req.session.lastPage = '/login';
	},
    
    updatePage: function(req, res){
		res.sendFile("update.html", {root: "./views/"});
	},
    
    reportPage: function(req, res){
		res.sendFile("report.html", {root: "./views/"});
	},
    
    resultPage: function(req, res){
		res.sendFile("result.html", {root: "./views/"});
	},

	register: function(req, res){
		var username = req.body.username || "";
		var password = req.body.password || "";
		var specialization = req.body.specialization || "";

		if (username == 'Username'){
			res.json("Please input a valid username");
		//	return;
		}
        else if (specialization == ''){
			res.json("Please select a specialization");
		//	return;
		}
       
        else {
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
                        });
                       
                        res.send("Thanks for registering...");
                    });
                }
        });
        }
	},
    update: function(req, res) {
            var count = 0;
            var mycount = 2;
            var list = [];
            console.log(req.body);
            list.push(req.session.username);
            for (var prop in req.body){
                if(req.body.hasOwnProperty(prop))
                {
                    if(req.body[prop] != "" && req.body[prop] != '')
                        ++count;
                }
                if (count == mycount || count == mycount + 1 || count == mycount+2)
                {
                    if (count == mycount + 2){
                        switch(req.body[prop])
                        {
                            case 'A': list.push(4);
                                      break;
                            case 'B': list.push(3);
                                      break;
                            case 'C': list.push(2);
                                      break;
                            case 'D': list.push(1);
                                      break;
                            case 'F': list.push(0);
                                      break;
                        }
                    }
                    else
                        list.push(req.body[prop]);
                    if (count == mycount + 2)
                    {
                        var promise1 = new Promise(function(resolve, reject){
                            resolve(list);
                        });
                        promise1.then(function(list){
                                console.log(list);
                                var query = mysql.format('insert into taken values (?, ?, ?, ?)', list);
                                config.connection.query(query, function(err, rows, fs) {
                                    if(err) {
                                        console.log('Something is broken');
                                        console.log(err);
                                        console.log(fs);
                                    }
                                });
                        });
                        list = [];
                        list.push(req.session.username);
                        mycount = mycount + 3;
                    }
                }
            }
            res.send("Thanks for adding courses...");
            },

    reporter: function(req, res) {
                  var query = mysql.format('select crn, prof, grade from taken where username = ?;', [req.session.username]);
                  config.connection.query(query, function(err, rows, fs) {
                    if(err) {
                        console.log('Something is broken');
                        console.log(err);
                        console.log(fs);
                    }
                    res.json(rows)
                  });
              },

    reporter2: function(req, res) {
                  var query = mysql.format('select sum(ALL grade) as sum, count(ALL grade) as count from taken where username = ?;', [req.session.username]);
                  config.connection.query(query, function(err, rows, fs) {
                    if(err) {
                        console.log('Something is broken');
                        console.log(err);
                        console.log(fs);
                    }
                    counttillnow = rows[0].count;
                    sumtillnow = rows[0].sum;
                    var gpa = (rows[0].sum / rows[0].count).toFixed(2);
                    res.json(gpa);
                  });
              },
    reporter3: function(req, res) {
                   var newcount = counttillnow + this_time_count;
                   var newsum = sumtillnow;
                   for (var i = 0; i < myfinalresponse.length; ++i)
                   {
                       if (myfinalresponse[i].gpa > thresholdA)
                           newsum = newsum + 4;
                       else if (myfinalresponse[i].gpa > thresholdB)
                           newsum = newsum + 3;
                       else
                           newsum = newsum + 2;
                   }
                   var gpa = (newsum / newcount).toFixed(2);
                    res.json(gpa);
              },
    resulter_recommend: function(req, res) {
                  console.log("here");  
                    res.json(myfinalresponse);
              },
    resulter_taken: function(req, res) {
                  console.log("here");  
                  answer = [];
                  for (var i = 0; i < coursesAlreadyTaken.length; ++i)
                  {
                      var index = specified.indexOf(coursesAlreadyTaken[i].cname);
                      if (index > -1)
                      {
                          answer.push(coursesAlreadyTaken[i]);
                      }
                  }
                  for (var i = 0; i < answer.length; ++i)
                  {
                      delete answer[i].gpa;
                  }

                  res.json(answer);
              },
    resulter_clash: function(req, res) {
                  console.log("here"); 
                  for (var i = 0; i < clash.length; ++i)
                  {
                      delete clash[i].gpa;
                  }
                  var finalData = [];
                  for (var i = 1; i < clash.length; ++i)
                  {
                      var newd = clash[i];
                      var temp = newd.c1;
                      newd.c1 = newd.c2;
                      newd.c2 = temp;
                      var index = false;
                      for(var j = 0; j < finalData.length; ++j)
                      {
                          console.log(finalData[j]);
                          if (finalData[j].c1 === newd.c1 && finalData[j].c2 === newd.c2)
                          {
                              index = true;
                              break;
                          }
                      }

                      if (index == false )
                      {
                          finalData.push(clash[i]);
                      }
                  }
                  console.log(finalData);
                    res.json(finalData);
              },
};
module.exports = mysqlController;
