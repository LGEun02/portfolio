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
</script>
<body>
	<%@include file="header.jsp" %>
	<%
		sql=" select PCODE,PNAME,PCOST";
		sql+=" from coffee_tbl";
		sql+=" where PCODE=?";
		ps=con.prepareStatement(sql);
		ps.setString(1, request.getParameter("PCODE"));
		rs=ps.executeQuery();
		rs.next();
	%>
	<section>
		<div>
			<h2>커피등록</h2>
		</div>
		<form method="post" action="update2pro.jsp" name="f">
			<table style="margin: 0 auto;" width="600" border="1">
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="PCODE" value="<%=rs.getString("PCODE") %>" size="20" maxlength="4">4글자 내로 입력하세요 ex)A101</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="PNAME" value="<%=rs.getString("PNAME") %>" size="20" maxlength="60"></td>
				</tr>
				<tr>
					<th>상품단가</th>
					<td><input type="text" name="PCOST" value="<%=rs.getInt("PCOST") %>" size="20">가격만 입력하시오. ex)6500</td>
				</tr>
			</table>
			<div>
				<input type="submit" value="수정" onclick="check(); return false">&nbsp;&nbsp;
				<input type="button" value="삭제" onclick="location='deletepro.jsp?PCODE=<%=rs.getString("PCODE")%>'">
			</div>
		</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>