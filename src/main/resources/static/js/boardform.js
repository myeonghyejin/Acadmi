/**
 * board Form 유효성 검사
 */

 const submitButton = document.getElementById("submitButton")
 
 const title = document.getElementById("title");
 const titleResult = document.getElementById("titleResult");
 
 const name = document.getElementById("name");
 const nameResult = document.getElementById("nameResult");

let checks = [false, false]
 
/* submitButton.addEventListener("click", function(){
	 console.log('submit button click')
	 if(!checks.includes(false)){
        // frm.submit();
        // location.href = "./";
        alert('성공');
    }  
    else{
        alert('필수 사항 입력');
    }  
 });*/
 
 $("#submitButton").click(function(){
	 $("#contactForm").submit();
 })
 
title.addEventListener("blur", function(){
    if(title.value.length != 0){
       checks[1] = true;
    }
    else{
        titleResult.innerHTML = "필수 입력";
        checks[1] = false;
        titleResult.classList.add("redResult");
        titleResult.classList.remove("greenResult");
    }
});

name.addEventListener("blur", function(){
    if(name.value.length != 0){
       checks[2] = true;
    }
    else{
        nameResult.innerHTML = "필수 입력";
        checks[2] = false;
       	nameResult.classList.add("redResult");
        nameResult.classList.remove("greenResult");
    }
});