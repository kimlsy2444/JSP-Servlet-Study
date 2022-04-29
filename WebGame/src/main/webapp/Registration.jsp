<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 아래와 같이 태그라이브러리를 사용하기 위해서 taglib지시자를 사용하는 코드 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<% 
	request.setCharacterEncoding("utf-8");
	//로그인 정보를 가져오는 코드
	String gameCode = request.getParameter("gameCode");
	int flag = 0;

%>    

<!-- jstl태그라이브러리의 sql태그를 이용하여 DB에 접속하는 코드 -->
<sql:setDataSource var="dataSource" 
	 url="jdbc:mysql://localhost:3306/WebGameDB"
	 driver="com.mysql.jdbc.Driver"
	 user="root" password="1234" />

<!-- sql쿼리문을 실행하는 코드. executeQuery() 기능과 유사하다. -->
<sql:query dataSource="${dataSource}" var="resultSet">
	select * from GameInfo where gameCode=? 
	<sql:param value="<%=gameCode %>" /> 
</sql:query>


<c:forEach var="row" items="${resultSet.rows}">
	<% 
	 flag++;
		request.setAttribute("gameCode", gameCode);
		//id값으로 세션을 설정하고 있다.
		session.setAttribute("gameCode", gameCode);
		
		if(gameCode.equals("ad9538")){
			response.sendRedirect("./Admin/Admin_Main.jsp"); 
			break;
		}
		
		pageContext.forward("GameWeb_Registration.jsp");
	%>
			
</c:forEach>
<% if (flag == 0){
	%>
<c:redirect url="Code_failed.jsp?error=1" />
	
<% }%>

