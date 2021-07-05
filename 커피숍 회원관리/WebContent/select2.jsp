<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피숍 회원관리</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<section>
		<div>
			<h2>커피목록조회</h2>
		</div>
		<div>
			<table style="margin: 0 auto;" width="600" border="1">
				<tr>
					<th>상품코드</th>
					<th>상품명</th>
					<th>상품단가</th>
				</tr>
	<%
		sql+=" select PCODE,PNAME,PCOST";
		sql+=" from coffee_tbl";
		sql+=" order by PCODE";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
				<tr>
					<td><a href="update2.jsp?PCODE=<%=rs.getString("PCODE") %>"><%=rs.getString("PCODE") %></a></td>
					<td><%=rs.getString("PNAME") %></td>
					<td><%=rs.getString("PCOST") %></td>
				</tr>
	<%		
		}
	%>			
			</table>
		</div>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>