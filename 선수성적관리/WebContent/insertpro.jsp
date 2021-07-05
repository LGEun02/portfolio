<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<%
try{
	sql="insert into PLAYER_TBL_09 values(?,?,?,?,?,?,?)";
	ps=con.prepareStatement(sql);
	ps.setInt(1, Integer.parseInt(request.getParameter("PLAYER_NO")));
	ps.setString(2, request.getParameter("PLAYER_NAME"));
	ps.setInt(3, Integer.parseInt(request.getParameter("TEAM_NO")));
	ps.setString(4, request.getParameter("PLAYER_PHONE"));
	ps.setString(5, request.getParameter("PLAYER_BIRTH"));
	ps.setString(6, request.getParameter("PLAYER_EMAIL"));
	ps.setString(7, request.getParameter("BACK_NO"));
	//ps.setInt(7, Integer.parseInt(request.getParameter("BACK_NO")));
	ps.executeUpdate();
%>
	<script>
		alert("선수정보등록이 완료 되었습니다.");
		location="insert.jsp";
	</script>
<%	
}catch(Exception e){
	%>
	<script>
		alert("선수정보등록이 완료 되지않았습니다.");
		history.back();
	</script>
<%	
}finally{
	try{
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(stmt!=null) stmt.close();
		if(con!=null) con.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>