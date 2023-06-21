let xhttpLecture = new XMLHttpRequest();

xhttpLecture.open('GET', '/student/homeLecture');

xhttpLecture.send();
    
xhttpLecture.addEventListener('readystatechange', function(){
    if(this.readyState==4 && this.status==200){
        document.getElementById("homeLecture").innerHTML=this.responseText.trim();
    }

});


let xhttpNotice = new XMLHttpRequest();
xhttpNotice.open('GET', '/notice/homeStudentNotice');

xhttpNotice.send();
    

xhttpNotice.addEventListener('readystatechange', function(){
    if(this.readyState==4 && this.status==200){
        document.getElementById("homeLectureNotice").innerHTML=this.responseText.trim();
    }

});


let xhttpImportant = new XMLHttpRequest();
xhttpImportant.open('GET', '/notice/homeImportant');

xhttpImportant.send();
    
xhttpImportant.addEventListener('readystatechange', function(){
    if(this.readyState==4 && this.status==200){
        document.getElementById("homeImportant").innerHTML=this.responseText.trim();
    }

});

