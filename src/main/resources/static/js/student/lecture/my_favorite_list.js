//list
getList(1);

function getList(page){
    fetch("/student/lecture/my_favorite/list, {
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $("#myFavoriteList").html(res.trim());
    })
}

//page
$("#myFavoriteList").on("click",".page-button", function(e){
    let page = $(this).attr("data-list-page");
    getList(page);
    e.preventDefault();
});

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
	           if(res.trim()!=0){
					alert('신청되었습니다.');
					getList(1);
	           }else {
	               alert('신청되지 않았습니다.');
	           }
	         })
	         e.preventDefault();
	}
})

//my_favorite_delete
$("#myFavoriteList").on("click","#mfd",function(e){
	let check = window.confirm("삭제하시겠습니까?");
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
					alert('삭제되었습니다.');
					getList(1);
	           }else {
	               alert('삭제 실패했습니다.');
	           }
	         })
	         e.preventDefault();
	}
})