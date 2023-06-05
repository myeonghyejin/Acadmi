$(document).ready(function(){

    $.ajax({
        url: "/qna/replyDetail",
        type: "GET",
        data: {
            ref: $(".replyDetail").attr("data-num-id"),
            step: 1
        },
        success: function(result) {
            $(".replyDetail").html(result);
        },
    });
})

$(document).ready(function(){

    $.ajax({
        url: "/lectureQna/replyDetail",                         
        type: "GET",
        data: {
            ref: $(".replyDetail").attr("data-num-id"),
            step: 1
        },
        success: function(result) {
            $(".replyDetail").html(result);
        },
    });
})

$("#delete").on("click", function(){
	
	let result = confirm('정말 삭제하시겠습니까?');
	let num = $(this).attr("data-board-num");
	let name = $(this).attr("data-board-name");
	
	if(result){
		if(name == 'qna'){
			$.ajax({
		        url: "/qna/delete",                         
		        type: "GET",
		        data: {
		            num: num
		        },
		        success: function() {
		            alert("삭제되었습니다.")
		            location.assign("./list")
		        },
		    });
		} else if(name == 'notice'){
			$.ajax({
		        url: "/notice/delete",                         
		        type: "GET",
		        data: {
		            num: num
		        },
		        success: function() {
		            alert("삭제되었습니다.")
		            location.assign("./list")
		        },
		    });
		} else if(name == 'lectureNotice'){
			$.ajax({
		        url: "/lectureNotice/delete",                         
		        type: "GET",
		        data: {
		            num: num
		        },
		        success: function() {
		            alert("삭제되었습니다.")
		            location.assign("./list")
		        },
		    });
		} else if(name == 'lectureQna'){
			$.ajax({
		        url: "/lectureQna/delete",                         
		        type: "GET",
		        data: {
		            num: num
		        },
		        success: function() {
		            alert("삭제되었습니다.")
		            location.assign("./list")
		        },
		    });
		} 
	}
})


