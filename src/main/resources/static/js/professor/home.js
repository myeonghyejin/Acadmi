let xhttpLecture = new XMLHttpRequest();

xhttpLecture.open('GET', '/lecture/homeLecture');

xhttpLecture.send();
    
xhttpLecture.addEventListener('readystatechange', function(){
    if(this.readyState==4 && this.status==200){
        document.getElementById("homeLecture").innerHTML=this.responseText.trim();
    }

});

let xhttpNotice = new XMLHttpRequest();
xhttpNotice.open('GET', '/lecture/homeNotice');

xhttpNotice.send();
    
xhttpNotice.addEventListener('readystatechange', function(){
    if(this.readyState==4 && this.status==200){
        document.getElementById("homeNotice").innerHTML=this.responseText.trim();
    }

});

