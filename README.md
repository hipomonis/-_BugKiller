本电影系统：
  前端由常经纬同学开发，许朴同学参与部分的修改
  服务器为nodejs，由许朴搭建
  mysql因为使用图形化界面，没有太多特别的代码，因此不上传了
 
 系统项目代码使用方法：
 
 
  1.安装nodejs，安装mysql，并分别配置好环境变量
  
  
  2.在mysql中新建数据库，具体信息为：
                        host     : 'localhost',       
                        user     : 'root',              
                        password : 'a123456',       
                        port: '3306',                   
                        database: 'is_database', 
     在新建的is_database数据库中新建表：reservation(id,name,cinema,film)
                                    id字段数据类型为int，其他字段数据类型为varchar(45)（字符串）
   确认数据库在运行
   
   
  3.在项目根目录下按shift+鼠标右键，在此处打开cmd命令行，执行node app.js
    命令行输出“应用实例，访问地址为 http://:::8081” 时，意思是服务器开始运行
    
    
  4.在浏览器打开http://localhost:8081/index.html ,页面成功显示则表示前后端运行成功
  
  
  5.点击页面左上角login（登录），进入登录页面，输入userid,username,userpassword完成登录
  
  
  6.登录成功会跳出continue页面，点击继续则回到主页面index，可以在主页面中选择电影，选择影院。
  
  
  7.选完了之后点击提交订单按钮，将会输出订单信息，点击确认后弹出预订成功页面。此时订单数据已经写入数据库。
