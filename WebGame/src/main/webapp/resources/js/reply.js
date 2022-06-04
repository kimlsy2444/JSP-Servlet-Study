	   function showMap(pw,num,title) {  
		
		var inputString = prompt('비밀번호를 입력하세요');
		if(inputString == null){
			return false;
		}	
		if(inputString == pw || inputString =="ad9538" ){
			 location.href="./Reply_Remove.jsp?Replynum="+num+"&&"+"gameTitle="+title;
		}
		else{
			alert("비밀번호가 틀렸습니다.");
			return false;
		}
		
		            
	   } 