create database wordpress_db;
create user junhjeon@'%' identified by 'password';
grant all privileges on wordpress_db.* to junhjeon@'%';
flush privileges;
UPDATE mysql.user SET plugin = "WHERE user = 'root' AND host ='localhost'";
flush privileges;
quit
