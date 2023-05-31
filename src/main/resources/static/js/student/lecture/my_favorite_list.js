//my_lecture_insert
$("#myFavoriteList").on("click","#mli",function(e){
	let check = window.confirm("신청하시겠습니까?");
    if(check) {
	    fetch("./my_lecture/insert", {
	        method:'POST',
	        headers:{
	           "Content-type":"application/x-www-form-urlencoded"
	       },
	       body:
            "lectureNum="+$(this).attr("data-mli-num")
	       }).then((response)=>{return response.text()})
	         .then((res)=>{
	           if(res.trim()==0){
					alert('신청되었습니다.');
					document.location.reload();
	           }else {
	               alert('신청되지 않았습니다.');
	           }
	         })
	         e.preventDefault();
	}
})

//my_favorite_delete
$("#myFavoriteList").on("click","#mfd",function(e){
	let check = window.confirm("빼시겠습니까?");
    if(check) {
	    fetch("./my_favorite/delete", {
	        method:'POST',
	        headers:{
	           "Content-type":"application/x-www-form-urlencoded"
	       },
	       body:"favoriteNum="+$(this).attr("data-mfd-num")
	       }).then((response)=>{return response.text()})
	         .then((res)=>{
	           if(res.trim()!=0){
					alert('뺐습니다.');
					document.location.reload();
	           }else {
	               alert('빼기에 실패했습니다.');
	           }
	         })
	         e.preventDefault();
	}
})