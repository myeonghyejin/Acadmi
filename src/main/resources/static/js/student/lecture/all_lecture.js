//page
$("#allLectureList").on("click",".page-link", function(e){
    let page = $(this).attr("data-all-page");
    getList(page);
    e.preventDefault();
});

//my_lecture_insert
$("#allLectureList").on("click", "#mli", function(e) {
    let check = window.confirm("신청하시겠습니까?");
    if (check) {
        const lectureNum = $(this).attr("data-mli-num");
        const semester = $(this).attr("data-semester");
        const year = $(this).attr("data-year");
        const weekday = $(this).attr("data-weekday");
        const startTime = $(this).attr("data-start-time");
        const endTime = $(this).attr("data-end-time");
        const completionGrade = $(this).attr("data-completion-grade");
        
        console.log($(this).attr("data-year"));
		console.log($(this).attr("data-semester"));

        fetch("./my_lecture/insert", {
            method: 'POST',
            headers: {
                "Content-type": "application/x-www-form-urlencoded"
            },
            body: "lectureNum=" + lectureNum + "&semester=" + semester + "&year=" + year + "&weekday=" + weekday + "&startTime=" + startTime + "&endTime=" + endTime + "&completionGrade=" + completionGrade
        }).then((response) => {
            return response.text();
        }).then((res) => {
            if (res.trim() == 1) {
                alert('신청되었습니다.');
                document.location.reload();
            } else if (res.trim() == 2) {
                alert('이미 수강한 강의와 요일/시간이 겹칩니다.');
            } else if (res.trim() == 3) {
				alert('이수 가능한 학점을 초과하였습니다.');
			} else {
				alert('신청되지 않았습니다.');
			}
        });
        e.preventDefault();
    }
});

//my_favorite_insert
$("#allLectureList").on("click","#mfi",function(e){
	let check = window.confirm("담겠습니까?");
    if(check) {
	    fetch("./my_favorite/insert", {
	        method:'POST',
	        headers:{
	           "Content-type":"application/x-www-form-urlencoded"
	       },
	       body:"lectureNum="+$(this).attr("data-mfi-num")
	       }).then((response)=>{return response.text()})
	         .then((res)=>{
	           if(res.trim()!=0){
					alert('담았습니다.');
					document.location.reload();
	           }else {
	               alert('담기에 실패했습니다.');
	           }
	         })
	         e.preventDefault();
	}
})