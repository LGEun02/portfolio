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
			<h2>회원목록조회/수정</h2>
		</div>
		<div>
			<table style="margin: 0 auto;" width="800" border="1">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>성별</th>
					<th>회원전화</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주도시</th>
				</tr>
	<%
		sql=" select CUSTNO,CUSTNAME,decode(GENDER,'M','남자','F','여자') GENDER,";
		sql+=" PHONE,ADDRESS,to_char(JOINDATE,'yyyy-mm-dd') JOINDATE,";
		sql+=" decode(GRADE,'A','VIP','B','일반','C','직원') GRADE,CITY";
		sql+=" from member_tbl";
		sql+=" order by CUSTNO";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
				<tr>
					<td><a href="update.jsp?CUSTNO=<%=rs.getInt("CUSTNO") %>"><%=rs.getInt("CUSTNO") %></a></td>
					<td><%=rs.getString("CUSTNAME") %></td>
					<td><%=rs.getString("GENDER") %></td>
					<td><%=rs.getString("PHONE") %></td>
					<td><%=rs.getString("ADDRESS") %></td>
					<td><%=rs.getString("JOINDATE") %></td>
					<td><%=rs.getString("GRADE") %></td>
					<td><%=rs.getString("CITY") %></td>
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