<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선수성적관리</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<section>
		<div>
			<h2>선수 조회/수정</h2>
		</div>
		<div>
			<table style="margin: 0 auto;" width="700" border="1">
				<tr>
					<th>선수번호</th>
					<th>이름</th>
					<th>소속팀번호</th>
					<th>연락처</th>
					<th>등번호</th>
					<th>생일</th>
				</tr>
	<%
		sql=" select PLAYER_NO,PLAYER_NAME,TEAM_NO,";
		sql+=" substr(PLAYER_PHONE,1,3)||'-'||substr(PLAYER_PHONE,4,3)||'-'||substr(PLAYER_PHONE,7,4) PLAYER_PHONE,";
		sql+=" BACK_NO,to_char(PLAYER_BIRTH,'mm/dd') PLAYER_BIRTH";
		sql+=" from PLAYER_TBL_09";
		sql+=" order by BACK_NO";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
				<tr>
					<td><%=rs.getInt("PLAYER_NO") %></td>
					<td><a href="update.jsp?PLAYER_NO=<%=rs.getInt("PLAYER_NO")%>"><%=rs.getString("PLAYER_NAME") %></a></td>
					<td><%=rs.getInt("TEAM_NO") %></td>
					<td><%=rs.getString("PLAYER_PHONE") %></td>
				<%	
					if(rs.getInt("BACK_NO")!=0){
				%>	
						<td><%=rs.getInt("BACK_NO") %></td>	
				<%
					}else{
				%>	
						<td></td>	
				<%		
					}
						
				%>
					<td><%=rs.getString("PLAYER_BIRTH") %></td>
				</tr>
	<%		
		}
	%>
			</table>
		</div>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>