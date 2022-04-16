<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script>
    $(document).ready(function (){

        var testForm = $("#testForm")
        var index = 0

        $("#insertButton").on("click", function (){
            if(index == 5){
                alert("5개 까지만 됩니다.")
                return false;
            }

            var newDiv = document.createElement("div")
            newDiv.setAttribute("class", "newDiv")

            var newInput = document.createElement("input")
            newInput.setAttribute("id", "newInput"+index)
            newInput.setAttribute("id", "newInput"+index)
            newInput.setAttribute("type", "text")
            newInput.setAttribute("value", newInput.id)

            var removeInput = document.createElement("span")
            removeInput.setAttribute("class", "removeInput")
            removeInput.textContent = "지우자"

            newDiv.append(newInput)
            newDiv.append(removeInput)
            testForm.append(newDiv)

            index+=1
            $("#showIndex").text(index)

        })

        $(document).on("click", ".removeInput", function () {
            $(this).parent(".newDiv").remove()
            resetIndex()
        })

        function resetIndex(){
            index = 0
            testForm.children('div').each(function (){
                var target = $(this).children(index, 'input[type=text]')
                target.attr("id", "newInput"+index)
                target.attr("value", target.attr("id"))
                index+=1
            })
            $("#showIndex").text(index)
        }

        $("#readInputs").on("click", function () {
            var result = ""
            testForm.children('div').each(function (){
                var target = $(this).children(index, 'input[type=text]')
                result+=target.attr("id")+":"+target.val()+", "
            })
            alert(result)
        })



        $("#insertButton").trigger("click")
        $("#insertButton").trigger("click")
        $("#showIndex").text(index)

    });

</script>



<body>
	<div>
    총 갯수 : <span id="showIndex"></span> / 5
</div>

    <span id="insertButton" style="font-size: larger">복사하기</span>
    <span id="readInputs" style="font-size: larger">읽기</span>
    <div id="testForm">
    </div>
</body>
</html>