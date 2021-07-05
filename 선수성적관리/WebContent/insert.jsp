<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수성적관리</title>
</head>
<script type="text/javascript">
	function check(){
		if(f.PLAYER_NAME.value==""){
			alert("선수이름이 입력되지 않았습니다.");
			return f.PLAYER_NAME.focus();
		}
		if(f.PLAYER_PHONE.value==""){
			alert("선수연락처가 입력되지 않았습니다.");
			return f.PLAYER_PHONE.focus();
		}
		if(f.PLAYER_BIRTH.value==""){
			alert("선수 생년월일이 입력되지 않았습니다.");
			return f.PLAYER_BIRTH.focus();
		}
		f.submit();
	}
</script>
<body>
	<%@ include file="header.jsp" %>
	<%
		sql="select nvl(max(PLAYER_NO),10000)+1 PLAYER_NO from PLAYER_TBL_09";
		rs=stmt.executeQuery(sql);
		rs.next();
		int PLAYER_NO = rs.getInt("PLAYER_NO");
		
	%>
	<section>
		<div>
			<h2>선수 등록</h2>
		</div>
		<form method="post" action="insertpro.jsp" name="f">
			<table style="margin: 0 auto;" width="400" border="1">
				<tr>
					<th>선수번호</th>
					<td><input type="text" name="PLAYER_NO" value="<%=PLAYER_NO %>" size="20" readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="PLAYER_NAME" size="20" maxlength="20"></td>
				</tr>
				<tr>
					<th>소속팀번호</th>
					<td><input type="text" name="TEAM_NO" size="20"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="PLAYER_PHONE" size="20" maxlength="14"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="PLAYER_BIRTH" size="20"></td>
				</tr>
				<tr>
					<th>메일주소</th>
					<td><input type="text" name="PLAYER_EMAIL" size="20" maxlength="50"></td>
				</tr>
				<tr>
					<th>등번호</th>
					<td><input type="text" name="BACK_NO" size="20"></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="등록" onclick="check(); return false">&nbsp;&nbsp;
				<input type="button" value="조회" onclick="location='select.jsp'">
			</div>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>