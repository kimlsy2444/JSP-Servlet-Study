
function setThumbnail(event){
    document.querySelector("div#image_container").innerHTML = '';
    for(var image of event.target.files){
        var reader = new FileReader();
        reader.onload = function(event){
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");
            document.querySelector("div#image_container").appendChild(img);
        };
        
        console.log(image);
        reader.readAsDataURL(image);
    }
    
}


function setDetailImage(event){
    document.querySelector("div#images_container").innerHTML = '';
    for(var image of event.target.files){
        var reader = new FileReader();
        reader.onload = function(event){
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "col-lg-6");
            document.querySelector("div#images_container").appendChild(img);
        };
        
        console.log(image);
        reader.readAsDataURL(image);
    }
    
}