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
		if(f.PCODE.value==""){
			alert("상품코드가 입력되지 않았습니다.");
			return f.PCODE.focus();
		}
		if(f.PNAME.value==""){
			alert("상품명이 입력되지 않았습니다.");
			return f.PNAME.focus();
		}
		if(f.PCOST.value==""){
			alert("상품단가 입력되지 않았습니다.");
			return f.PCOST.focus();
		}
		f.submit();
	}
	function rewrite(){//수정
		let x = confirm("모든 항목의 정보를 지웠습니다. 다시 입력해주세요.");
		if(x==true) f.reset();
		f.PCODE.focus();
	}
</script>
<body>
	<%@include file="header.jsp" %>
	<section>
		<div>
			<h2>커피등록</h2>
		</div>
		<form method="post" action="insert2pro.jsp" name="f">
			<table style="margin: 0 auto;" width="600" border="1">
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="PCODE" size="20" maxlength="4">4글자 내로 입력하세요 ex)A101</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="PNAME" size="20" maxlength="60"></td>
				</tr>
				<tr>
					<th>상품단가</th>
					<td><input type="text" name="PCOST" size="20">가격만 입력하시오. ex)6500</td>
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