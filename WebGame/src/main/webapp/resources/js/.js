cnt = 0;
const add_textbox = () => {
	

	
	    if(cnt == 3){
		alert("최대 인원초과");
        return false;

	}
	
    const box = document.getElementById("box");
    const newP = document.createElement('p');
    newP.innerHTML = "<input type='text' name = ('gameMember'+cnt)> <input type='button' value='삭제' onclick='remove(this)'>";
    box.appendChild(newP);
	cnt ++;
    
}
const remove = (obj) => {
    document.getElementById('box').removeChild(obj.parentNode);
    cnt --;
}