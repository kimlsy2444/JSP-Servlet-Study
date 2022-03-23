<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<!-- 점보트론은 대형전광판이라는 의미를 지니고 있다. 점보트론 안에는 다양한 컴포넌트(택스트,이미지,회사로고 등)가 포함이 가능하다 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>	
	</div>
	<div class = "container">
		<!-- class = "form-horizontal"은 폼요소들이 수평적으로 배치가 되도록 해준다. -->
		<form name = "newProduct "action="./processAddProduct.jsp" class = "form-horizontal" method="post">
			<div class ="form-group row">
			<!-- 화면크기가 768px이상일 때 col-sm-? 이 부분이 적용이 되고, div요소의 block특성에 의해서 100%너비를 가지며
			수직으로 쌓이게 만들어준다. -->
				<lable class ="col-sm-2"><b>상품 코드</b></lable>
				<div class = "col-sm-3">
					<input type="text" name = "productId" class ="form-control" placeholder="상품코드를 입력하세요">
				</div>
			</div>
			
			<div class ="form-group row">
				<lable class ="col-sm-2"><b>상품명</b></lable>
				<div class = "col-sm-3">
					<input type="text" name = "name" class ="form-control" placeholder="상품명을 입력하세요">
				</div>
			</div>
			
			<div class ="form-group row">
				<lable class ="col-sm-2"><b>가격</b></lable>
				<div class = "col-sm-3">
					<input type="text" name = "unitPrice" class ="form-control" placeholder="가격을 입력하세요">
				</div>
			</div>
			
			<div class ="form-group row">
				<lable class ="col-sm-2"><b>상세정보</b></lable>
				<div class = "col-sm-5">
					<textarea name="description" cols="50" rows ="2" class="form-control"></textarea>
				</div>
			</div>
			
			<div class ="form-group row">
				<lable class ="col-sm-2"><b>제조사</b></lable>
				<div class = "col-sm-3">
					<input type="text" name = "manufacturer" class ="form-control" placeholder="제조사를 입력하세요">
				</div>
			</div>
			
			<div class ="form-group row">
				<lable class ="col-sm-2"><b>분류</b></lable>
				<div class = "col-sm-3">
					<input type="text" name = "category" class ="form-control" placeholder="분류할 목록을 입력하세요">
				</div>
			</div>
			
			<div class ="form-group row">
				<lable class ="col-sm-2"><b>재고 수</b></lable>
				<div class = "col-sm-3">
					<input type="text" name = "unitsInStock" class ="form-control" placeholder="제고수량을 입력해주세요">
				</div>
			</div>
			
			<div class ="form-group row">
				<lable class ="col-sm-2"><b>상태</b></lable>
				<div class = "col-sm-3">
					<input type="radio" name = "condition" value = "New">신규 제품
					<input type="radio" name = "condition" value = "Old">재생 제품
					<input type="radio" name = "condition" value = "Refurbished">재생 제품
				</div>
			</div>
			
			
			
			<div class ="form-group row">
			<!-- offset지정은 col의 2만큼 띄워라 -->
				<div class = "col-sm-offset-2 col-sm-10">
					<input type="submit" class = "btn btn-primary" value="등록">
				</div>
			</div>
		</form>
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>