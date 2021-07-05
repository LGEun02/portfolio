<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 회원&예매 관리 프로그램</title>
</head>
<script>
function check(){
	/*
	const : final과 같이 값 변경불가
	let : 값 변경가능
	^ : []안의 값으로 시작 {}의 자리만 가능 $:여기까지(끝까지)적용
	*/
	//아이디 값 데이터 정규화 공식
	const regID = /^[a-zA-Z0-9]{4,12}$/; //4자리에서 12자리까지. 소문자 대문자 숫자가능	
	
	//패스워드 값 데이터 정규화 공식
	const regPass = /^[a-zA-Z0-9]{4,15}$/; //4자리에서 15자리까지. 소문자 대문자 숫자가능	
	
	//이름 정규화 공식
	const regName = /^[가-힝a-zA-Z]{2,}$/; //2자리 이상. 한글, 소문자, 대문자 가능
	
	//전화번호 정규화 공식
	const regTel = /^\d{3}-\d{3,4}-\d{4}$/; //3자리\3~4자리\4자린
	
	if(!f.me_id.value){
		alert("회원아이디를 입력해주세요.");			
		f.me_id.focus();
		return false;
	}
	//아이디 유효성 검사
	if ( !(regID.test(f.me_id.value)) ) {//test() : 공식에 맞으면 참		
		alert("아이디는 4~12자의 대소문자와 숫자로만 입력 가능합니다.");
		return f.me_id.select(); //select() : value의 값 블록 설정
	}
	
	if(!f.me_pass.value){
		alert("회원비밀번호를 입력해주세요.");
		f.me_pass.focus();
		return false;
	}
	//비밀번호 유효성 검사
	if ( !(regPass.test(f.me_pass.value)) ) {			
		alert("비밀번호는 4~15자의 대소문자와 숫자로만 입력 가능합니다.");
		return f.me_pass.select();
	}
	
	if(!f.me_name.value){
		alert("회원이름을 입력해주세요.");
		return f.me_name.focus();
	}
	
	//이름에 특수 문자가 들어간 경우
	if ( !(regName.test(f.me_name.value)) ) {			
		alert("이름이 잘못되었습니다.");
		return f.me_name.select();
	}
	
	if(f.gender[0].checked == false && f.gender[1].checked == false){
		alert("성별을 입력해주세요.");
		return;
	}
	
	if(!f.birth.value){
		alert("생년월일을 입력해주세요.");
		return f.birth.focus();
	}
	
	if(!f.address.value){
		alert("주소를 입력해주세요.");
		return f.address.focus();
	}
	 
	if(!f.tel.value){
		alert("전화번호를 입력해주세요.");
		return f.tel.focus();
	}
	//전화번호 유효성 체크
	if ( !(regTel.test(f.tel.value)) ) {			
		alert("전화번호가 잘못되었습니다.");
		return f.tel.select();
	}				
	f.submit();
}	
</script>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		<form action="insertpro.jsp" method="post" name="f">
			<table style="margin:0 auto" border="1" width="700">
				<tr>
					<th>회원아이디</th>
					<td><input type="text" name="me_id" size="12" maxlength="12">&nbsp 4~12자의 영문 대소문자와 숫자로만 입력</td>
				</tr>			
				<tr>
					<th>회원비밀번호</th>
					<td><input type="text" name="me_pass" size="15" maxlength="15">&nbsp 4~15자의 영문 대소문자와 숫자로만 입력</td>
				</tr>			
				<tr>
					<th>회원이름</th>
					<td><input type="text" name="me_name" size="10" maxlength="20"></td>
				</tr>			
				<tr>
					<th>성별</th>
					<td>
						&nbsp;&nbsp;<label><input type="radio" name="gender" value="M">남자</label>
						&nbsp;&nbsp;<label><input type="radio" name="gender" value="F">여자</label>
					</td>
				</tr>			
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="birth" size="10">(예)1999-10-10</td>
				</tr>			
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" size="30"></td>
				</tr>			
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel" id="tel" size="13" maxlength="13">(예)010-1234-5678</td>
				</tr>			
				<tr>
					<th colspan="2">
						<input type="submit" value="회원등록" onclick="check(); return false">						
						<input type="reset" value="다시쓰기">
					</th>
					
				</tr>			
			</table>
		</form>		
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>

