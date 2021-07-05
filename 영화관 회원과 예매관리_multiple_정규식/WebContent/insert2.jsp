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
		if(!f.me_id.value){//f.me_id.value == ""
			alert("회원아이디를 입력해주세요.");
			return f.me_id.focus();
		}
		if(!f.me_pass.value){
			alert("비밀번호를 입력해주세요.");
			return f.me_pass.focus();
		}//value=="" : 1번째 option '영화제목을 선택하시오.'임
		if(!f.mo_name.value){
			alert("영화제목을 선택해주세요.");
			return ;
		}
		if(!f.rm_date.value){
			alert("예매일시를 입력해주세요.");
			return f.rm_date.focus();
		}
		f.submit();
	}
	
</script>
<body>
	<%@ include file="header.jsp" %>
	<%
		sql="select to_char(sysdate,'yyyy-mm-dd') from dual";
		rs=stmt.executeQuery(sql);
		rs.next();
		String rm_date = rs.getString(1);
		
		sql="select mo_name from movie_3";
		rs=stmt.executeQuery(sql);
		if(!rs.next()){//값이 없으면
	%>
			<script type="text/javascript">
				alert("등록된 영화가 없습니다.");
			</script>
	<%		
		}
	%>
	<section>
		<div>
			<h2>영화예매</h2>
		</div>
		<form method="post" action="insert2pro.jsp" name="f">
			<table style="margin:0 auto;" width="400" border="1">
				<tr>
					<th>회원아이디</th>
					<td><input type="text" name="me_id" size="15" maxlength="12"></td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td><input type="password" name="me_pass" size="15" maxlength="15"></td>
				</tr>
				<tr>
					<th>영화제목</th>
					<td>
						<select multiple="multiple" name="mo_name">
							<option value="" disabled="disabled">영화제목을 선택하시오.</option><!-- 보이지만 클릭안됨 -->
					<%
						do{
							%>
							<option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
							<%
						}while(rs.next());
					//do~while인 이유 : 위에서 확인차 next()를 했기 때문에 이미 값을 지정하고 있음. 또 next() 하면 그 다음값으로 넘어가기 때문에 먼저 출력후 다음 여부 확인
					%>
						</select>
					</td>
				</tr>
				<tr>
					<th>예매일시</th>
					<td><input type="text" name="rm_date" value="<%=rm_date %>" size="20">자동입력</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="영화예매" onclick="check(); return false">
						<input type="button" value="조회" onclick="location='select.jsp'">
					</th>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>