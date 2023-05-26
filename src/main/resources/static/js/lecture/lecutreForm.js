/**
 * 
 */

const collegeSelect = document.getElementById("collegeNum");
const departmentSelect = document.getElementById("deptNum");
						        
collegeSelect.addEventListener("change", updateDepartments);

 function updateDepartments(){
								
						        departmentSelect.innerHTML = ""; 
						        departmentSelect.disabled = false;
						        const selectedCollege = collegeSelect.value;
						        if (selectedCollege !== "none") {
						            if (selectedCollege == "1") {
						                addOption(departmentSelect, "1", "컴퓨터공학과");
						                addOption(departmentSelect, "2", "정보통신학과");
						                // 나머지 학과 옵션들 추가
						            } else if (selectedCollege == "2") {
						                addOption(departmentSelect, "3", "국어국문학과");
						                addOption(departmentSelect, "4", "영어영문학과");
						                // 나머지 학과 옵션들 추가
						            }
						            departmentSelect.disabled = false; // 학과 Select Box 활성화
						        }
							}
							function addOption(selectElement, value, text) {
								const option = document.createElement("option");
						        option.value = value;
						        option.text = text;
						        selectElement.appendChild(option);
						    }