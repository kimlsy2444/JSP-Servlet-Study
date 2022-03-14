<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!-- JSP액션태그 중, useBean태그를 이용하여 아래와 같이 설정하였다. -->
 <!-- 여기서 id는 자바에서 참조 변수와 같은 역할을 한다고 보면 된다. -->
 <!-- class속성은 student의 원본 클래스의 패키즈명.클래스명 지정을 해주어야 한다. -->
 <!-- 이렇게 해주면 자바에서 new 연산자로 객체(인스턴스)를 생성한 것과 동일한 개념이 되는 것이다. -->
<jsp:useBean id="student" class="sec01_exam.Student" scope="page"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빈 예제-1</title>
</head>
<body>
	<h1>빈에 데이터 값들을 지정하였습니다.</h1><br/>
	<!-- 속성(멤버변수)에 '*'는 빈객체의 속성 값을 기본값으로 지정하는 것이다. -->
	<jsp:setProperty property="*" name="student"/>
	<!-- jsp액션 태그중 setProperty를 이용해서 name에는 bean의 id값, property는 빈의 속성(멤버변수)
		 value는 실제  값을 주어 저장하는 것이다
		 중요한것은 setProperty가 student클래스의 setter메서드를 호출하는 태그라는 것이다. -->
	<jsp:setProperty property="name" 		name="student" value="이준성"/>
	<jsp:setProperty property="age" 		name="student" value="26"/>
	<jsp:setProperty property="grade" 		name="student" value="95"/>
	<jsp:setProperty property="studentNum" 	name="student" value="20161663"/>
	
	<h1>빈에서 데이터 가져온 값입니다.</h1>
	<font size ="10" color="blue">
	<!-- 		 중요한것은 getProperty가 student클래스의 getter메서드를 호출하는 태그라는 것이다. -->
		이름 :<jsp:getProperty property="name" 		name="student"/><br/>
		나이 :<jsp:getProperty property="age" 		name="student"/><br/>
		학년 :<jsp:getProperty property="grade" 		name="student"/><br/>
		학번 :<jsp:getProperty property="studentNum" name="student"/>
	</font>
</body>
</html>