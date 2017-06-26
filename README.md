本电影系统：
  前端由常经纬同学开发，许朴同学参与部分的修改
  
  服务器为nodejs，由许朴搭建
  
  数据库由李衍光同学搭建
  
  服务器用到的模块包已经通过npm命令安装在node_model压缩包中，下载解压在项目代码根目录下即可用
  
  
 
 系统项目代码使用方法：
 
 
  1.安装nodejs，安装mysql，并分别配置好环境变量，例如：
  

      服务器：node-v6.10.3-x64
      windows下环境变量配置：（例如）
      G:\nodejs_anzhuang\nodejs\;

      数据库：mysql-5.7.17
      windows下环境变量配置：（例如）
      C:\Program Files\MySQL\MySQL Utilities 1.6\;


  2.在mysql中新建数据库，具体信息为：
                          host     : 'localhost',       
                          user     : 'root',              
                          password : 'a123456',       
                          port: '3306',                   
                          database: 'is_database', 

     在新建的is_database数据库中新建表：reservation(id,name,cinema,film)
      id字段数据类型为int，其他字段数据类型为varchar(45)（字符串）
   确认数据库正在运行
   
   
  3.在项目根目录下按shift+鼠标右键，在此处打开cmd命令行，执行node app.js
    命令行输出“应用实例，访问地址为 http://:::8081” 时，意思是服务器开始运行
    
    
  4.在浏览器打开http://localhost:8081/index.html ,页面成功显示则表示前后端运行成功
  
  
  5.点击页面左上角login（登录），进入登录页面，输入userid,username,userpassword完成登录
  
  
  6.登录成功会跳出continue页面，点击继续则回到主页面index，可以在主页面中选择电影，选择影院。
  
  
  7.选完电影，影院之后点击‘提交订单’按钮，将会在网页上输出订单信息，点击确认后弹出预订成功页面。此时订单数据已经写入数据库。
  
  8.可打开数据库查看订单信息。
