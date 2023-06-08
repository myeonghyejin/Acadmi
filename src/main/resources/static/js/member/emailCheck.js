const email = document.getElementById("email");
const emailResult = document.getElementById("emailResult");

let check = [false]
 
email.addEventListener("blur", function(){
    if(email.value.length != 0){
       check[1] = true;
    }
    else{
        check[1] = false;
    }
});

$('#submitButton').click(()=>{
    if(check.includes(true)){
        $('#contactForm').submit();
    }else{
		alert('이메일을 작성해주세요')
    }
})

