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
</head>
<style>
	body {
	  background: url("./resources/images/erorr.png") no-repeat center center fixed;
	  background-size: 80%;
	}
</style>
<body>
	<%-- <%
		// setStatus(200) 정상적인 페이지를 의미한다.
		// 아래와 같이 지정을 해주지 않으면 컨테이너가 500으로 설정으로 하는 경우가 많다.
		// 우리가 설정한 페이지가 아닌 다른 페이지로 이동하기 떄문
		response.setStatus(200);
		response.setCharacterEncoding("UTF-8");
	%>	
	에러발생<br/>
	<%= exception.getMessage() %> --%>
	<%
		response.setStatus(200);
		response.setCharacterEncoding("UTF-8");
	%>
<main class="container">
	<section>
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-6">
	                     <b>
	                        <h1 class="mt-5">404 에러 발생 <a class = "btn badge bg-info" href ="./GameWeb_Main.jsp">메인화면</a> </h1> 
	                        <p>현재 페이지 작성에 대해 오류가 발생하였습니다.</p>
	                        <p>페이지를 다시 작성해주세요</p>
	                     </b>
                    </div>
                </div>
            </div>
	</section>
</main>

</body>
</html>