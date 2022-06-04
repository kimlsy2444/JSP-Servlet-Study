$(document).ready(function(){
   
    // 추가
    var i = 0;
 	var cnt =0;
    $("#btn1").on("click", function() {
	    var n = $( '.class_chk' ).length;
	    console.log(n);
        if(cnt == 6 ||  n == 6 ){
    		alert("최대 인원초과");
            return false;
    	}
        
        cnt++;

        i = $("#div_chk > #id_chk").length;
        $("#div_chk").append("<div id ='id_chk'><input type='text' class='class_chk form-control' name='('gameMember'+cnt)' value='' required></div>");
    });
    
    // 마지막 순번 삭제
    $("#btn2").on("click", function() {
    	if(cnt > 0) {
    		cnt--
        
    	}
        i = $("#div_chk >#id_chk").length - 1;
       /*  console.log(i); */
        $("#div_chk > #id_chk").eq(i).remove();
      
    });

       


});