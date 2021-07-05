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
			<h2>경기결과조회</h2>
		</div>
		<div>
			<table style="margin: 0 auto;" width="700" border="1">
				<tr>
					<th>경기번호</th>
					<th>득점</th>
					<th>경고수</th>
					<th>퇴장수</th>
				</tr>
	<%
		sql=" select MATCH_NO, sum(PLAYER_SCORE),sum(YELLOW_CARD),sum(RED_CARD)";
		sql+=" from RECOED_TBL_09";
		sql+=" group by MATCH_NO";
		sql+=" order by MATCH_NO";
		rs=stmt.executeQuery(sql);
		
		while(rs.next()){
	%>
				<tr>
					<td><%=rs.getInt("MATCH_NO") %></td>
					<td><%=rs.getInt("sum(PLAYER_SCORE)") %></td>
					<td><%=rs.getInt("sum(YELLOW_CARD)") %></td>
					<td><%=rs.getInt("sum(RED_CARD)") %></td>
				</tr>
	<%		
		}
	%>
			</table>
		</div>
		<table style="margin: 0 auto;" width="700" >
	<% 	
		sql=" select PLAYER_NO,PLAYER_NAME,tosc";
		sql+=" from PLAYER_TBL_09 natural join (select PLAYER_NO,sum(PLAYER_SCORE) tosc,";
				sql+=" sum(YELLOW_CARD) YELLOW_CARD ,sum(RED_CARD) RED_CARD,";
				sql+=" rank() over (order by sum(PLAYER_SCORE) desc) rank";
				sql+=" from RECOED_TBL_09";
				sql+=" group by  PLAYER_NO)";		
		sql+=" where rank=1";
		sql+=" order by YELLOW_CARD,RED_CARD";
		rs=stmt.executeQuery(sql);
		while(rs.next()){
	%>			
			
				<tr align="left">
					<td width="200">최우수 선수 <%=rs.getInt("PLAYER_NO") %></td>
					<td><%=rs.getString("PLAYER_NAME") %></td>
					<td><%=rs.getInt("tosc") %>골</td>
				</tr>
	<%
		}
	%>			
			</table>
		
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>