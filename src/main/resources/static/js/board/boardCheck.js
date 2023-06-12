let check = [false]
 
$("#title").on("blur", function(){
	if($("#title").val() != ''){
       check[1] = true;
    }
    else{
       check[1] = false;
    }
})

$(".submitButton").on("click", function(){
    if(check.includes(true)){
        $('#contactForm').submit();
    }else{
		alert('제목을 작성해주세요')
    }
});

