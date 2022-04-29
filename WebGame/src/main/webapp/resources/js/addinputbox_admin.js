document.write('<script type="text/javascript" src="./resources/js/form-validation.js"></script>');

cnt = 0;
const add_textbox = () => {

	    if(cnt == 17){
		alert("입력 가능 코드 초과");
        return false;

	}
	
    const box = document.getElementById("box");
    const newP = document.createElement('p');
    newP.innerHTML = "<input type='text'class='form-control'  name = ('gameMember'+cnt)  value='' required> <input type='button'class ='btn btn-outline-danger' value='삭제' onclick='remove(this)'>";
    box.appendChild(newP);
	cnt ++;
    
}
const remove = (obj) => {
    document.getElementById('box').removeChild(obj.parentNode);
    cnt --;
}