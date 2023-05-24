/**
 * Join Form에서 검증
 */

 $("#userName").blur(idDuplicateCheck); /*이런식이면 익명함수의 이름만 입력*/
 
 function idDuplicateCheck(){
	 
	 $.ajax({
		 type:"GET",
		 url:"./idDuplicateCheck",
		 data:{
			 userName:$('#userName').val()
		 },
		 success:function(result){
			 console.log(result)
			 if(result){
				 console.log('id 사용 가능')
			 }
			 else{
				 console.log('id 중복')
			 }
		 },
		 error:function(){
			 console.log('error')
		 }
	 })
	 
 }
 
 $("#password").blur(pwCheck);
 
 function pwCheck(){
	 if($("#password").val() == ""){
		 console.log('필수 사항입니다.')
	 }
 }
 
 $("#passwordCheck").blur(pwReCheck);
 
 function pwReCheck(){
	 if($("#password").val() == $("#passwordCheck").val()){
		 console.log('확인')
	 }
 }
 