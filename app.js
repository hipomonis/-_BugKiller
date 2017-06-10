//express_demo.js 文件
var express = require('express');
var app = express();
var path = require("path");
//app.use(express.static(path.join(__dirname, 'assets')));
var serveStatic = require('serve-static');  // 静态文件处理
app.use(serveStatic('assets')); // 路径：public
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", 'ejs');  //模板文件
app.set('views', __dirname+'/views');   //模板文件
//app.use(serveStatic('assets')); // 路径：public
//app.use(express.bodyParser());
    var myid ;
    var myname;
    var film_name;
    var cinema_name;
var mysql  = require('mysql');  
 
var connection = mysql.createConnection({     
  host     : 'localhost',       
  user     : 'root',              
  password : 'a123456',       
  port: '3306',                   
  database: 'is_database', 
}); 

app.get('/', function (req, res) {
   res.send('Hello World');
})
app.get('/index.html', function (req, res) {
   res.sendFile( __dirname + "/" + "index.html" );
})
app.get('/film.html', function (req, res) {
   res.sendFile( __dirname + "/" + "film.html" );
})
app.get('/cinema.html', function (req, res) {
   res.sendFile( __dirname + "/" + "cinema.html" );
})
app.get('/login.html', function (req, res) {
   res.sendFile( __dirname + "/" + "login.html" );
})
app.post('/film', function(req, res) {
    console.log(req.query.id);
    film_name = req.query.id;
    //console.log(req.body.name);
    //console.log(req.body.tel);
    res.sendFile( __dirname + "/" + "cinema.html" );
});
app.post('/cinema', function(req, res) {
    console.log(req.query.id);

    cinema_name = req.query.id;
    //console.log(req.body.name);
    //console.log(req.body.tel);
    res.sendFile( __dirname + "/" + "film.html" );
});
app.post('/user_login', function(req, res) {
    myid = req.body.user_id;
    myname = req.body.user_name;
    // mytel =  req.body.tel;
    // pic_id = req.body.
    console.log("the infos are: %s", myname);
    res.render('continue.ejs', {
         user_name: myname
     });
});
app.post('/submit_r', function(req, res) {
    console.log("订单");
    res.render('reservation.ejs', {

         user_name: myname,
         c_name: cinema_name,
         f_name: film_name
     });
});

app.post('/insert_data', function(req, res) {
    connection.connect();
var  addSql = 'INSERT INTO reservation(id,name,cinema,film) VALUES(?,?,?,?)';
var  addSqlParams = [myid,myname, cinema_name,film_name];
//增
connection.query(addSql,addSqlParams,function (err, result) {
        if(err){
         console.log('[INSERT ERROR] - ',err.message);
         return;
        }        
        // 生成订单信息
       console.log('--------------------------INSERT----------------------------');
       //console.log('INSERT ID:',result.insertId);        
       console.log('INSERT ID:',result);        
       console.log('-----------------------------------------------------------------\n\n');  
       res.sendFile( __dirname + "/" + "success.html" );
});
 
connection.end();
});

var server = app.listen(8081, function () {
 
  var host = server.address().address
  var port = server.address().port
 
  console.log("应用实例，访问地址为 http://%s:%s", host, port)
 
})
