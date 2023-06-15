$(document).ready(function(){
	
	let name = $(".table").attr("data-board-name");
	
	if(name == 'qna') {
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
	} else if (name == 'lectureQna') {
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
	} else {
		console.log("댓글 없음");
	}
});

$("#delete").on("click", function(){
	
	let result = confirm('정말 삭제하시겠습니까?');
	let num = $(this).attr("data-board-num");
	let name = $(this).attr("data-board-name");
	let lectureNum = $(this).attr("data-board-lectureNum");
	
	if(result){
		if(name == 'qna'){
			$.ajax({
		        url: "/qna/delete",                         
		        type: "GET",
		        data: {
		            num: num
		        },
		        success: function() {
		            alert("삭제되었습니다.");
		            location.assign("./list");
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
		            alert("삭제되었습니다.");
		            location.assign("./list");
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
		            alert("삭제되었습니다.");
		            location.assign("./list?lectureNum=" + lectureNum);
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
		            alert("삭제되었습니다.");
		            location.assign("./list?lectureNum=" + lectureNum);
		        },
		    });
		} else {
			console.log("삭제 실패");
		}
	}
});

$(document).on("click", "#replyDelete", function() {
	
	let result = confirm('정말 삭제하시겠습니까?');
	let num = $("#replyDelete").attr("data-board-num");
	let name = $(".table").attr("data-board-name");
	let lectureNum = $("#replyDelete").attr("data-board-lectureNum");
	
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
		} else if(name == 'lectureQna'){
			$.ajax({
				url: "/lectureQna/delete",                         
			    type: "GET",
			    data: {
			        num: num
			    },
			    success: function() {
			        alert("삭제되었습니다.");
			        location.assign("./list?lectureNum=" + lectureNum);
			    },
			});
		} else {
			console.log("삭제 실패");
		}	
	}
});


