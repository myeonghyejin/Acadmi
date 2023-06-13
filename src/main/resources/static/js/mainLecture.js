let xhttp = new XMLHttpRequest();

xhttp.open('GET', '/lecture/mainLecture');

xhttp.send();
    
xhttp.addEventListener('readystatechange', function(){
    if(this.readyState==4 && this.status==200){
        console.log(this.responseText);
        document.getElementById("mainLecture").innerHTML=this.responseText.trim();
    }

});