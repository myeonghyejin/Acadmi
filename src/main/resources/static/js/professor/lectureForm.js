	
	const collegeNum = document.getElementById("collegeNum")
	const deptNum = document.getElementById("deptNum")
	const category = document.getElementById("category")
	const lectureName = document.getElementById("lectureName")
	const grade = document.getElementById("grade")
	const personal = document.getElementById("personal")
	const completionGrade = document.getElementById("completionGrade")
	const weekday = document.getElementById("weekday")
	const startTime = document.getElementById("startTime")
	const endTime = document.getElementById("endTime")
	
	const collegeResult = document.getElementById("collegeResult")
	const deptResult = document.getElementById("deptResult")
	const categoryResult = document.getElementById("categoryResult")
	const nameResult = document.getElementById("nameResult")
	const gradeResult = document.getElementById("gradeResult")
	const personalResult = document.getElementById("personalResult")
	const completionGradeResult = document.getElementById("completionGradeResult")
	const weekdayResult = document.getElementById("weekdayResult")
	const startTimeResult = document.getElementById("startTimeResult")
	const endTimeResult = document.getElementById("endTimeResult")
	
	
	const frm = document.getElementById("frm");
	const btn0 = document.getElementById("btn0");
	const btn1 = document.getElementById("btn1");
	
	let deptCheck=false;
	if(deptNum.value.length!=0){
		deptCheck=true;
	}
	let categoryCheck=false;
	if(category.value.length!=0){
		categoryCheck=true;
	}
	let nameCheck=false;
	if(lectureName.value.length!=0){
		nameCheck=true;
	}
	let gradeCheck = false;
	if(grade.value.length!=0){
		gradeCheck=true;
	}
	let personalCheck = false;
	if(personal.value.length!=0){
		personalCheck=true;
	}
	let completionGradeCheck = false;
	if(completionGrade.value.length!=0){
		completionGradeCheck=true;
	}
	let weekdayCheck = false;
	if(weekday.value.length!=0){
		weekdayCheck=true;
	}
	let startTimeCheck = false;
	if(startTime.value.length!=0){
		startTimeCheck=true;
	}
	let endTimeCheck = false;
	if(endTime.value.length!=0){
		endTimeCheck=true;
	}

	//강의 이름
	lectureName.addEventListener("blur",function(){
	    if(lectureName.value.length!=0){
	        nameResult.innerHTML='';
	        nameCheck=true;
	        nameResult.classList.remove("redResult")
	    }else{
	        nameResult.innerHTML='강의 이름은 필수입니다.';
	        nameCheck=false;
	        nameResult.classList.add("redResult")
	    }
	});
	
	//학과
	deptNum.addEventListener("blur",function(){
	    if(deptNum.value.length==0 && collegeNum.value.length==0){
	        collegeResult.innerHTML='단과대를 먼저 선택해주세요.';
	        deptCheck=false;
	        collegeResult.classList.add("redResult")
		}else if(deptNum.value.length==0 &&collegeNum.value.length!=0){
	        deptResult.innerHTML='학과 선택은 필수입니다.';
	        collegeResult.innerHTML='';
	        deptCheck=false;
	        deptResult.classList.add("redResult")
	        collegeResult.classList.remove("redResult")
	    }else{
			deptResult.innerHTML='';
			collegeResult.innerHTML='';
	        deptCheck=true;
	        collegeResult.classList.remove("redResult")
	        deptResult.classList.remove("redResult")
		}
	});
	//단과대
	collegeNum.addEventListener("blur",function(){
		if(collegeNum.value.length!=0){
			collegeResult.innerHTML='';
			collegeResult.classList.remove("redResult")
		}
	})
	
	//구분
	category.addEventListener("blur",function(){
	    if(category.value.length!=0){
	        categoryResult.innerHTML='';
	        categoryCheck=true;
	        categoryResult.classList.remove("redResult")
	    }else{
	        categoryResult.innerHTML='구분 선택은 필수입니다.';
	        categoryCheck=false;
	        categoryResult.classList.add("redResult")
	    }
	});
	
	//학년
	grade.addEventListener("change",function(){
	    if(grade.value.length!=0){
	        gradeCheck=true;
	        gradeResult.innerHTML='';
	        gradeResult.classList.remove("redResult")
	    }
	});
	//수강 인원
	personal.addEventListener("change",function(){
	    if(personal.value.length!=0){
	        personalCheck=true;
	        personalResult.innerHTML='';
	        personalResult.classList.remove("redResult")
	    }
	});
	
	//학점
	completionGrade.addEventListener("change",function(){
	    if(completionGrade.value.length!=0){
	        completionGradeCheck=true;
	        completionGradeResult.innerHTML='';
	        completionGradeResult.classList.remove("redResult")
	    }
	});
	
	//강의 요일
	weekday.addEventListener("change",function(){
	    if(weekday.value.length!=0){
	        weekdayCheck=true;
	        weekdayResult.innerHTML='';
	        weekdayResult.classList.remove("redResult")
	    }
	});
	
	//시작 시간 
	startTime.addEventListener("change",function(){
	    if(startTime.value.length!=0){
	        startTimeCheck=true;
	        startTimeResult.innerHTML='';
	        startTimeResult.classList.remove("redResult")
	    }
	});
	
	//종료 시간 
	endTime.addEventListener("click",function(){
		if(startTime.value.length==0){
			endTimeCheck=false;
			startTimeResult.innerHTML='시작 시간을 먼저 선택해주세요.';
	        startTimeResult.classList.add("redResult")
		}
	});
	endTime.addEventListener("change",function(){
		if(endTime.value<startTime.value){
			console.log(startTime.value);
			console.log(endTime.value);
			endTimeCheck=false;
			endTimeResult.innerHTML='시작 시간 이후 시간을 선택해주세요.';
	        endTimeResult.classList.add("redResult")
		}
	    if(endTime.value.length!=0 &&endTime.value>startTime.value){
	        endTimeCheck=true;
	        endTimeResult.innerHTML='';
	        endTimeResult.classList.remove("redResult")
	    }
	});


//form 전송
	//임시등록
	btn0.addEventListener("click",function(){
		const buttonType = "0";
		const input = document.createElement("input");
    	input.type = "hidden";
    	input.name = "buttonType";
    	input.value = buttonType;
    	frm.appendChild(input);
	    if(nameCheck&&deptCheck&&categoryCheck){
			 document.body.appendChild(frm);
	        frm.submit();
	    }else{
	        alert("필수 항목을 모두 입력해주세요.")
	        if(!nameCheck){
				nameResult.innerHTML='강의 이름은 필수입니다.';
	        	nameResult.classList.add("redResult")
			}
			if(!deptCheck){
				deptResult.innerHTML='학과 선택은 필수입니다.';
	        	deptResult.classList.add("redResult")
			}
			if(!categoryCheck){
				categoryResult.innerHTML='구분 선택은 필수입니다.';
	        	categoryResult.classList.add("redResult")
			}
	    }
	});
	//등록
	btn1.addEventListener("click",function(){
		const buttonType = "1";
		const input = document.createElement("input");
    	input.type = "hidden";
    	input.name = "buttonType";
    	input.value = buttonType;
    	frm.appendChild(input);
	    if(nameCheck&&deptCheck&&categoryCheck&&gradeCheck&&personalCheck&&completionGradeCheck&&weekdayCheck&&startTimeCheck&&endTimeCheck){
			 document.body.appendChild(frm);
	        frm.submit();
	    }else{
	        alert("모든 항목을 입력해주세요.")
	        if(!nameCheck){
				nameResult.innerHTML='강의 이름을 입력해주세요.';
	        	nameResult.classList.add("redResult")
			}
			if(!deptCheck){
				deptResult.innerHTML='학과를 선택해주세요.';
	        	deptResult.classList.add("redResult")
			}
			if(!categoryCheck){
				categoryResult.innerHTML='구분를 선택해주세요.';
	        	categoryResult.classList.add("redResult")
			}
			if(!gradeCheck){
				gradeResult.innerHTML='학년를 선택해주세요.';
	        	gradeResult.classList.add("redResult")
			}
			if(!personalCheck){
				personalResult.innerHTML='수강 인원을 선택해주세요.';
	        	personalResult.classList.add("redResult")
			}
			if(!completionGradeCheck){
				completionGradeResult.innerHTML='학점을 선택해주세요.';
	        	completionGradeResult.classList.add("redResult")
			}
			if(!weekdayCheck){
				weekdayResult.innerHTML='요일을 선택해주세요.';
	        	weekdayResult.classList.add("redResult")
			}
			if(!startTimeCheck){
				startTimeResult.innerHTML='시작 시간을 선택해주세요.';
	        	startTimeResult.classList.add("redResult")
			}
			if(!endTimeCheck){
				if(endTime.value==0){
				endTimeResult.innerHTML='종료 시간을 선택해주세요.';
	        	endTimeResult.classList.add("redResult")
	        	}
	        	if(endTime.value<startTime.value){
				endTimeResult.innerHTML='시작 시간 이후 시간을 선택해주세요.';
			    endTimeResult.classList.add("redResult")
			    }
			}
	    }
	});