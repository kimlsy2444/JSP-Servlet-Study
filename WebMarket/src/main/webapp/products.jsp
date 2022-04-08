<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"></jsp:useBean> --%>
<!DOCTYPE html>
<%	
	request.setCharacterEncoding("utf-8");
	DecimalFormat dFormat = new DecimalFormat("###,###");
%>
<html>
<head>
<!-- CDN 방식은 더이상 사용하지 않는다.(인터넷이 되는 곳 허용) -->
<link rel = "stylesheet" href ="./resources/css/bootstrap.min.css"/>

<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
<%-- 	
	<% 
		ProductRepository dao = ProductRepository.getInstance();
		
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%> 
--%>
	
	<div class="container">
		<div class="row" align="center">
		<!-- DB연동 하는 부분 -->
		<%@ include file ="dbconn.jsp" %> 
	
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from product";
			// Connection 객체로 부터 쿼리를 주고 PreparedStatement 얻고있다.
			pstmt = conn.prepareStatement(sql); 
			
			// 쿼리문의 결과를 받아오고 있다.
			rs = pstmt.executeQuery();
			
			while(rs.next()){
		%>
		<div class="col-md-4">
			<img alt = "사진" src="c:/upload/<%= rs.getString("p_fileName") %>"
				 style="width: 100%">
				 
			 	<h3><%=rs.getString("p_name")%></h3>
				<p> <%=rs.getString("p_description")%></p>
				<p> <%= dFormat.format(Integer.parseInt(rs.getString("p_unitprice"))) %>원</p>	
				
				
				<p><a href ="./product.jsp?id=<%= rs.getString("p_id")%>"class ="btn btn-secondary"
				role="button">상세정보 &raquo;</a></p>	
			 </div>
			<%
				}
				if (rs !=null) rs.close();
				if (pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			%>
			
		 </div>
		
		 <hr>
	</div>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>