<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String cartid = session.getId();
			
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate =  "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName =  "";
	
	// 모든 쿠키로 설정된 내용을 쿠키배열로 받아온다.
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(int i = 0; i<cookies.length; i++){
			Cookie thisCookie = cookies[i];
			String str = thisCookie.getName(); // 쿠키의 Name을 가져오고 있다
			
			// URLDecoder클래스를 이용하여 문자셋을 다시 뭊추어서 가져오고 있는 것이다.
			if(str.equals("Shipping_cartId")){
				shipping_cartId = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			}
			
			if(str.equals("Shipping_name")){
				shipping_name = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			}
			
			if(str.equals("Shipping_shippingDate")){
				shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			}
			
			if(str.equals("Shipping_country")){
				shipping_country = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			}
			
			if(str.equals("Shipping_zipCode")){
				shipping_zipCode = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			}
			
			if(str.equals("Shipping_addressName")){
				shipping_addressName = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			}
			
		}
		
	}
%>   
 
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href ="./resources/css/bootstrap.min.css"/>

<meta charset="UTF-8">
<title>주문 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	
	<!-- alert-info는 사용자에게 무언가를 알려주며 색상은 하늘색으로 표식된다. --> 
	<div class="container col-8 alert alert-info ">
		<div class ="text-center">
			<h1>영수증</h1>
		</div>
		<div class= "row justify-content-between">
			<div class ="col-4" align="left">
				<strong>배송 주소</strong><br/>
				성명 : <% out.println(shipping_name); %><br/>
				우편번호 : <% out.println(shipping_zipCode); %><br/>
				주소 : <% out.println(shipping_addressName); %><br/>
			</div>
			<div class="col-4" align="right">
				<p><em>배송일 :<% out.println(shipping_shippingDate); %> </em>
			</div>
		</div>
		
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">물품</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					int sum = 0;
					ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
					if(cartList == null){
						cartList = new ArrayList<Product>();
					}
					for(int i = 0; i<cartList.size();i++){
						Product product = 	cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity(); // 한물품의 가격
						sum += total; // 소계
				%>
				<tr>
					<td class="text-center"><em><%= product.getPname() %></em></td>
					<td class="text-center"><em><%= product.getQuantity() %></em></td>
					<td class="text-center"><em><%= product.getUnitPrice() %></em></td>
					<td class="text-center"><em><%= total %>원</em></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액 : </strong></td>
					<td class="text-center text-danger"><strong><%= sum %>원</strong></td>
				</tr>
			</table>
				<a href ="./shippingInfo.jsp?cartId=<%= shipping_cartId %>" class ="btn btn-secondary" role="button">이전</a>
				<a href ="./thankCustomer.jsp" class ="btn btn-success" role="button">주문완료</a>
				<a href ="./checkOutCancelled.jsp" class ="btn btn-secondary" role="button">취소</a>
		</div>
	</div>
	
</body>
</html>