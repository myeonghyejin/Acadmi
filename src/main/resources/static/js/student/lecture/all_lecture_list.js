//list
getList(1);

function getList(page){
    fetch("/student/lecture/all_lecture/list?page="+page, {
        method:'GET'
    })
    .then((response)=>response.text())
    .then((res)=>{
        $("#allLectureList").html(res.trim());
    })
}

//page
$("#allLectureList").on("click",".page-button", function(e){
    let page = $(this).attr("data-list-page");
    getList(page);
    e.preventDefault();
});

//my_lecture_insert
$("#allLectureList").on("click","#mli",function(e){
	let check = window.confirm("신청하시겠습니까?");
    if(check) {
	    fetch("./my_lecture/insert", {
	        method:'POST',
	        headers:{
	           "Content-type":"application/x-www-form-urlencoded"
	       },
	       body:"lectureNum="+$(this).attr("data-mli-num")
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

//my_favorite_insert
$("#allLectureList").on("click","#mfi",function(e){
	let check = window.confirm("담겠습니까?");
    if(check) {
	    fetch("./my_favorite/insert", {
	        method:'POST',
	        headers:{
	           "Content-type":"application/x-www-form-urlencoded"
	       },
	       body:"favoriteNum="+$(this).attr("data-mfi-num")
	       }).then((response)=>{return response.text()})
	         .then((res)=>{
	           if(res.trim()!=0){
					alert('담았습니다.');
					getList(1);
	           }else {
	               alert('담기에 실패했습니다.');
	           }
	         })
	         e.preventDefault();
	}
})