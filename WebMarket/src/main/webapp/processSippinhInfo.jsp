<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// 이 페이지에서 로직을 처리함에 있어서 로직을 다 수행하고 난뒤 다른 페이지로 이동 하기에
	// 한번 더 문자셋을 맞추기 위해 URLEncoder클래스를 사용하여 제인코딩을 하였다.
	Cookie cartId = new Cookie("Shipping_cartId",URLEncoder.encode( request.getParameter("cartId"),"utf-8"));

	Cookie name = new Cookie("Shipping_name",URLEncoder.encode( request.getParameter("name"),"utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate",URLEncoder.encode( request.getParameter("shippingDate"),"utf-8"));
	Cookie country = new Cookie("Shipping_country",URLEncoder.encode( request.getParameter("country"),"utf-8"));
	Cookie zipCode = new Cookie("Shipping_zipCode",URLEncoder.encode( request.getParameter("zipCode"),"utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName",URLEncoder.encode( request.getParameter("addressName"),"utf-8"));
	
	// 각 쿠기에 유효시간을 설정하는 코드
	cartId.setMaxAge(24*60);
	name.setMaxAge(24*60);
	shippingDate.setMaxAge(24*60);
	country.setMaxAge(24*60);
	zipCode.setMaxAge(24*60);
	addressName.setMaxAge(24*60);
	
	// 응답객체에 탑재함
	
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	//주문 정보 확인을 위해서 orderConfirmation.jsp 파일로 강제이동
	response.sendRedirect("orderConfirmation.jsp");
	
	
%>