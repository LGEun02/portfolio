<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피숍 회원관리</title>
</head>
<script>
	function check(){
		if(f.CUSTNO.value==""){
			alert("회원번호가 입력되지 않았습니다.");
			return f.CUSTNO.focus();
		}
		if(f.CUSTNAME.value==""){
			alert("회원성명이 입력되지 않았습니다.");
			return f.CUSTNAME.focus();
		}
		if(f.GENDER[0].checked==false&&f.GENDER[1].checked==false){
			alert("성별이 선택되지 않았습니다.");
			return ;
		}
		if(f.PHONE.value==""){
			alert("회원전화가 입력되지 않았습니다.");
			return f.PHONE.focus();
		}
		if(f.ADDRESS.value==""){
			alert("주소가 입력되지 않았습니다.");
			return f.ADDRESS.focus();
		}
		if(f.JOINDATE.value==""){
			alert("가입일자가 입력되지 않았습니다.");
			return f.JOINDATE.focus();
		}
		if(f.GRADE.value==""){
			alert("고객등급이 입력되지 않았습니다.");
			return f.GRADE.focus();
		}
		if(f.CITY.value==""){
			alert("거주도시가 입력되지 않았습니다.");
			return f.CITY.focus();
		}
		f.submit();
	}
	function rewrite(){//수정
		let x = confirm("모든 항목의 정보를 지웠습니다. 다시 입력해주세요.");
		if(x==true) f.reset();
		f.CUSTNAME.focus();
	}
</script>
<body>
	<%@include file="header.jsp" %>
	<%
		sql="select nvl(max(CUSTNO),10000)+1 CUSTNO, to_char(sysdate,'yyyy-mm-dd') JOINDATE from member_tbl";
		rs=stmt.executeQuery(sql);
		rs.next();
	%>
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		<form method="post" action="insertpro.jsp" name="f">
			<table style="margin: 0 auto;" width="600" border="1">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="CUSTNO" value="<%=rs.getInt(1) %>" size="20" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="CUSTNAME" size="20" maxlength="20"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						&nbsp;<input type="radio" name="GENDER" size="20" value="F">여자&nbsp;
						&nbsp;<input type="radio" name="GENDER" size="20" value="M">남자&nbsp;
					</td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="PHONE" size="20" maxlength="13"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="ADDRESS" size="20" maxlength="60"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="JOINDATE" value="<%=rs.getString(2) %>" size="20" readonly></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="GRADE" size="20" maxlength="1"></td>
				</tr>
				<tr>
					<th>거주도시</th>
					<td><input type="text" name="CITY" size="20" maxlength="2">숫자 두자리 입력 ex)20</td>
				</tr>
			</table>
			<div>
				<input type="submit" value="등록" onclick="check(); return false">&nbsp;&nbsp;
				<input type="button" value="다시쓰기" onclick="rewrite();">
			</div>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>