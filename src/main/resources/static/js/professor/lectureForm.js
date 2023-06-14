	
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
	    }else if(deptNum.value.length==0){
	        deptResult.innerHTML='학과 선택은 필수입니다.';
	        collegeResult.innerHTML='';
	        deptCheck=false;
	        deptResult.classList.add("redResult")
	        collegeResult.classList.remove("redResult")
	    }else{
			deptResult.innerHTML='';
	        deptCheck=true;
	        deptResult.classList.remove("redResult")
		}
	});
	
	//구분
	category.addEventListener("blur",function(){
	    if(category.value.length!=0){
	        categoryResult.innerHTML='';
	        categoryCheck=true;
	        nameResult.classList.remove("redResult")
	    }else{
	        categoryResult.innerHTML='구분 선택은 필수입니다.';
	        categoryCheck=false;
	        categoryResult.classList.add("redResult")
	    }
	});
	
	//학년
	grade.addEventListener("blur",function(){
	    if(grade.value.length!=0){
	        gradeCheck=true;
	    }
	});
	//수강 인원
	personal.addEventListener("blur",function(){
	    if(personal.value.length!=0){
	        personalCheck=true;
	    }
	});
	
	//학점
	completionGrade.addEventListener("blur",function(){
	    if(completionGrade.value.length!=0){
	        completionGradeCheck=true;
	    }
	});
	
	//강의 요일
	weekday.addEventListener("blur",function(){
	    if(weekday.value.length!=0){
	        weekdayCheck=true;
	    }
	});
	
	//시작 시간 
	startTime.addEventListener("blur",function(){
	    if(startTime.value.length!=0){
	        startTimeCheck=true;
	    }
	});
	
	//종료 시간 
	endTime.addEventListener("blur",function(){
	    if(endTime.value.length!=0){
	        endTimeCheck=true;
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
	    }
	});