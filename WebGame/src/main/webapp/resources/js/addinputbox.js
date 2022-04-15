
cnt=0;
const add_textbox = () => {
    const box = document.getElementById("box");
    const newP = document.createElement('p');
    newP.innerHTML = "<input type='text'name=gameMembers > <input type='button' value='삭제' onclick='remove(this)'>";
    // newP.innerHTML = "<input class = 'form-control' type='text'name='gameMembers'  > <button class =' btn btn-outline-dark'  value='삭제' onclick='remove(this)'> 삭제</button";

    box.appendChild(newP);
    cnt++;
}
const remove = (obj) => {
    document.getElementById('box').removeChild(obj.parentNode);
    cnt--;
}

function input_result(ff){
    var str = "";
    if(cnt == 1){
        str = ff.gameMembers.value;
    }else{
        for(i=0 ; i<cnt ; i++){
            str += ff.gameMembers[i].value + " | ";
        }
    }
 
location.href("processAddGameInfo.jsp?gameMembers="+str);
}






 // location.href("processAddGameInfo.jsp?gameMembers="+str);
