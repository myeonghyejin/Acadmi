//my_lecture_delete
$("#myLectureList").on("click","#mld",function(e){
	let check = window.confirm("취소하시겠습니까?");
    if(check) {
	    fetch("./my_lecture/delete", {
	        method:'POST',
	        headers:{
	           "Content-type":"application/x-www-form-urlencoded"
	       },
	       body:
            "lectureNum="+$(this).attr("data-mld-num")
	       }).then((response)=>{return response.text()})
	         .then((res)=>{
	           if(res.trim()!=0){
					alert('취소되었습니다.');
					document.location.reload();
	           }else {
	               alert('취소되지 않았습니다.');
	           }
	         })
	         e.preventDefault();
	}
})