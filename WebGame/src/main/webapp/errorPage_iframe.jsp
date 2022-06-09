<!-- 페이지 지시자를 이용하여 isErrorPage속성을 true로 설정을 해준다. 설정을 해줘야 exception객체를
창조하여 메세지를 활용 할 수가 있다. -->
<%@ page isErrorPage="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style type="text/css">
	body {
  	 display: flex;
     justify-content: center;
     align-items: center;
     height: 100vh;
		
	background-color: black;
	overflow-y: hidden;
	}

</style>
</head>
<body>

	<%
		response.setStatus(200);
		response.setCharacterEncoding("UTF-8");
	%>

	<div >
	<figure>
		<img class="figure-img img-fluid rounded " style="height: auto;" src="./resources/images/error_image.webp" >
	</figure>
	</div>
</body>
</html>