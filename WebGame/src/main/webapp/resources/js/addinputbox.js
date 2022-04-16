cnt = 0;
const add_textbox = () => {
	cnt ++;
    const box = document.getElementById("box");
    const newP = document.createElement('p');
    newP.innerHTML = "<input type='text' name = ('gameMember'+cnt)> <input type='button' value='삭제' onclick='remove(this)'>";
    box.appendChild(newP);
    
}
const remove = (obj) => {
    document.getElementById('box').removeChild(obj.parentNode);
    cnt --;
}

function input_result(ff){
var str = "";
if(cnt == 1){
    str = ff.txt.value;
}else{
    for(i=0 ; i<cnt ; i++){
    str += ff.txt[i].value + " | ";
    }
}
alert(str);
}