# MYSQL 학습

## 목차

1. 섹션2: 데이터베이스 개요
2. 섹션3: 데이터베이스와 테이블 만들기
3. 섹션4: 데이터 삽입하기
4. 섹션5: CRUD 명령
5. 섹션6: CRUD 도전과제
6. 섹션7: 문자열 함수
7. 섹션8: 선택사항 정교화하기
8. 섹션9: 집계함수

## mysql 세팅

```javascript
// 서버 세팅 
var express = require("express");
var app = express();
var port = 3403;
var server = app.listen(port, function(){
	console.log("서버가 가동되었습니다" + port);
});

// ejs 세팅(views)
var ejs = require("ejs");
app.set("views", __dirname + "/views");
app.set("view engine", "ejs");
app.engine("ejs", ejs.renderFile);

// 폴더 경로 셋팅
app.use(express.static('./'));

// session 세팅
var session = require("express-session");
app.use(session({
	secret : "abcdefg",
	resave : false,
	saveUninitialized : false
}));

// router 세팅
require("./router/memberController")(app);
require("./router/memberTestController")(app);


// mysql 아래 명령어를 db상에서 반드시 실행해야한다.  
// ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
const mysql = require("mysql");
const conn_info = {
	host : "localhost",
	port : 3306,
	user : "root",
	password : "root",
	database : "_node_db_test",
    multipleStatements: true    // 여러 쿼리를 ;를 기준으로 한번에 보낼 수 있게 해줌.
};
```
