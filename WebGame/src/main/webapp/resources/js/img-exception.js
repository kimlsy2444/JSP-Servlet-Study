var fileNo = 0;
var filesArr = new Array();

/* 첨부파일 추가 */
function addFile(obj){
    var maxFileCnt = 5;   // 첨부파일 최대 개수
    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

    // 첨부파일 개수 확인
    if (curFileCnt > remainFileCnt) {
        document.querySelector("input[type=file]").value = "";
        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
        location.reload(true);
        } else {
        for (const file of obj.files) {
            // 첨부파일 검증
            if (validation(file)) {
                // 파일 배열에 담기
                var reader = new FileReader();
                reader.onload = function () {
                    filesArr.push(file);
                };
                reader.readAsDataURL(file);

            } 
        }
    }
    // 초기화
    // document.querySelector("input[type=file]").value = "";

}

/* 첨부파일 검증 */
function validation(obj){
    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
    if (obj.name.length > 100) {
        document.querySelector("input[type=file]").value = "";
        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
        location.reload(true);
        return false;
    } else if (obj.size > (100 * 1024 * 1024)) {
        document.querySelector("input[type=file]").value = "";
        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
        location.reload(true);
        return false;
    } else if (obj.name.lastIndexOf('.') == -1) {
        document.querySelector("input[type=file]").value = "";
        location.reload(true);
        alert("이미지 파일이 아닙니다!!");
        return false;
    } else if (!fileTypes.includes(obj.type)) {
        document.querySelector("input[type=file]").value = "";
        location.reload(true);
        alert("이미지 파일이 아닙니다!!");
        return false;
    } else {
        return true;
    }
}

