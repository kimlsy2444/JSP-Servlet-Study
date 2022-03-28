<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href ="./resources/css/bootstrap.min.css"/>
<!-- 외부 자바 스크립트 파일을 가져오기 위해 아래와 가이 코드르 입력하도록한다. -->
<script type="text/javascript" src="./resources/js/validation.js"></script>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<!-- 점보트론은 대형전광판이라는 의미를 지니고 있다.점보트론 안에는 다양한 컴포넌트(텍스트,이미지,회사로고 등)가 포함이 가능하다. -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>	
	</div>
	<div class="container">
		<!-- class = "form-horizontal"은 폼요소들이 수평적으로 배치가 되도록 해준다. -->
		<form name = "newProduct"action="./processAddProduct.jsp" class = "form-horizontal" 
			  method="post" enctype="multipart/form-data">
			  
			<div class ="form-group row">
			<!-- 화면크기가 768px이상일 때 col-sm-? 이 부분이 적용이 되고, div요소의 block특성에 의해서 100%너비를 가지며
			수직으로 쌓이게 만들어준다. -->
				<lable class ="col-sm-2"><b>상품 코드</b></lable>
				<div class = "col-sm-3">
				<!-- id 속성을 추가한것은 유효성 검사를 위해서 이 doucument에서 자바스크립트 파일에서 참조하기 위함이다. -->
				
					<input type="text" id ="productId" name = "productId" class ="form-control" placeholder="상품코드를 입력하세요">
				</div>
			</div>
			
			<div class ="form-group row">
				<lable class ="col-sm-2"><b>상품명</b></lable>
				<div class = "col-sm-3">
					<input type="text" id ="name" name = "name" class ="form-control" placeholder="상품명을 입력하세요">
				</div>
			</div>
			
			<div class ="form-group row">
				<lable class ="col-sm-2"><b>가격</b></lable>
				<div class = "col-sm-3">
					<input type="text"  id ="unitPrice" name = "unitPrice" class ="form-control" placeholder="가격을 입력하세요">
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
					<input type="text" id ="unitsInStock"  name = "unitsInStock" class ="form-control" placeholder="제고수량을 입력해주세요">
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
			
				<!-- 상품 이미지 업로드 부분 -->
			<div class="form-group row">
				<label class="col-sm-2"><b>이미지</b></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">									
				</div>				
			</div>	
			
			
				<div class="form-group row">
				<!-- offset지정은 col의 2만큼 띄워라 -->
				<div class="col-sm-offset-2 col-sm-10">
					<!-- 타입을 button으로 바꾸는 이유는 submit타입을 주게 되면 유효성 검사하다가 오류가
					발생해도 action속성 값으로 페이지 이동이 일어나기 때문이다. -->
					<input type="button" class="btn btn-primary" value="등록" 
						   onclick="CheckAddProduct()">				
				</div>				
			</div>		
		</form>	
	</div>
</body>
</html>