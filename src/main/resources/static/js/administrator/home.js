let xhttpLectureRoom = new XMLHttpRequest();
xhttpLectureRoom.open('GET', '/administrator/homeLectureRoom');

xhttpLectureRoom.send();
    
xhttpLectureRoom.addEventListener('readystatechange', function(){
    if(this.readyState==4 && this.status==200){
        document.getElementById("lectureRoom").innerHTML=this.responseText.trim();
    }
});


let xhttpNotice = new XMLHttpRequest();
xhttpNotice.open('GET', '/notice/homeNotice');

xhttpNotice.send();
    
xhttpNotice.addEventListener('readystatechange', function(){
    if(this.readyState==4 && this.status==200){
        document.getElementById("homeNotice").innerHTML=this.responseText.trim();
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