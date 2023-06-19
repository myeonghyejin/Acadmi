	
	const semiGrades = document.querySelectorAll("[id^='semiGrade']");
	const finalGrades = document.querySelectorAll("[id^='finalGrade']");
	const reportGrades = document.querySelectorAll("[id^='reportGrade']");
	const attendanceGrades = document.querySelectorAll("[id^='attendance']");
	const frm = document.getElementById("frm");
	const btn = document.getElementById("btn");
	let semiCheck=false;
	let finalCheck=false;
	let reportCheck=false;
	let attendanceCheck=false;

	//중간 점수
	semiGrades.forEach(semiGrade => {
		const index = semiGrade.id.slice(9);
		const semiResult = document.getElementById(`semiResult${index}`);
		if(semiGrade.value!=0){
			semiCheck=true;
		}
		semiGrade.addEventListener("blur",function(){
			 if(semiGrade.value>100){
		        semiResult.innerHTML='최대 점수는 100점입니다.';
		        semiCheck=false;
		        semiResult.classList.add("redResult")
		    }else if(semiGrade.value<0){
		        semiResult.innerHTML='최소 점수는 0점입니다.';
		        semiCheck=false;
		        semiResult.classList.add("redResult")
		    }else if(semiGrade.value.length!=0){
		        semiResult.innerHTML='';
		        semiCheck=true;
		        semiResult.classList.remove("redResult")
		    }else{
		        semiResult.innerHTML='중간 점수를 입력해주세요.';
		        semiCheck=false;
		        semiResult.classList.add("redResult")
		    }
		});
	});

	
	//기말 점수
	finalGrades.forEach(finalGrade => {
	    const index = finalGrade.id.slice(10); 
		const finalResult = document.getElementById(`finalResult${index}`);
		if(finalGrade.value!=0){
			finalCheck=true;
		}
		finalGrade.addEventListener("blur",function(){
			if(finalGrade.value>100){
		        finalResult.innerHTML='최대 점수는 100점입니다.';
		        finalCheck=false;
		        finalResult.classList.add("redResult")
		    }else if(finalGrade.value<0){
		        finalResult.innerHTML='최소 점수는 0점입니다.';
		        finalCheck=false;
		        finalResult.classList.add("redResult")
		    }else if(finalGrade.value.length!=0){
		        finalResult.innerHTML='';
		        finalCheck=true;
		        finalResult.classList.remove("redResult")
		    }else{
		        finalResult.innerHTML='기말 점수를 입력해주세요.';
		        finalCheck=false;
		        finalResult.classList.add("redResult")
		    }
		});
	});
	
	//과제 점수
	reportGrades.forEach(reportGrade => {
	    const index = reportGrade.id.slice(11);
	    const reportResult = document.getElementById(`reportResult${index}`);
	    if(reportGrade.value!=0){
			reportCheck=true;
		}
		reportGrade.addEventListener("blur",function(){
			if(reportGrade.value>100){
		        reportResult.innerHTML='최대 점수는 100점입니다.';
		        reportCheck=false;
		        reportResult.classList.add("redResult")
		    }else if(reportGrade.value<0){
		        reportResult.innerHTML='최소 점수는 0점입니다.';
		        reportCheck=false;
		        reportResult.classList.add("redResult")
		    }else if(reportGrade.value.length!=0){
		        reportResult.innerHTML='';
		        reportCheck=true;
		        reportResult.classList.remove("redResult")
		    }else{
		        reportResult.innerHTML='과제 점수를 입력해주세요.';
		        reportCheck=false;
		        reportResult.classList.add("redResult")
		    }
		});
	});
	
	//출석 점수
	attendanceGrades.forEach(attendance => {
	    const index = attendance.id.slice(10); 
	    const attendanceResult = document.getElementById(`attendanceResult${index}`);
	    if(attendance.value!=0){
			attendanceCheck=true;
		}
		attendance.addEventListener("blur",function(){
			if(attendance.value>100){
		        attendanceResult.innerHTML='최대 점수는 100점입니다.';
		        attendanceCheck=false;
		        attendanceResult.classList.add("redResult")
		    }else if(attendance.value<0){
		        attendanceResult.innerHTML='최소 점수는 0점입니다.';
		        attendanceCheck=false;
		        attendanceResult.classList.add("redResult")
		    }else if(attendance.value.length!=0){
		        attendanceResult.innerHTML='';
		        attendanceCheck=true;
		        attendanceResult.classList.remove("redResult")
		    }else{
		        attendanceResult.innerHTML='출석 점수를 입력해주세요.';
		        attendanceCheck=false;
		        attendanceResult.classList.add("redResult")
		    }
		});
	});
	
	
	//form 전송
	btn.addEventListener("click",function(){
	    if(semiCheck&&finalCheck&&reportCheck&&attendanceCheck){
	        frm.submit();
	    }else{
	        alert("점수를 모두 입력해주세요.")
	    }
	});