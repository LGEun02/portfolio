<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<%
	try{
		sql="insert into member_tbl values(?,?,?,?,?,?,?,?)";
		ps=con.prepareStatement(sql);
		ps.setString(1, request.getParameter("CUSTNO"));
		ps.setString(2, request.getParameter("CUSTNAME"));
		ps.setString(3, request.getParameter("GENDER"));
		ps.setString(4, request.getParameter("PHONE"));
		ps.setString(5, request.getParameter("ADDRESS"));
		ps.setString(6, request.getParameter("JOINDATE"));
		ps.setString(7, request.getParameter("GRADE"));
		ps.setString(8, request.getParameter("CITY"));
		ps.executeUpdate();
%>
	<script type="text/javascript">
		alert("회원등록이 완료되었습니다.");
		location="insert.jsp";
	</script>
<%		
	}catch(Exception e){
%>
	<script type="text/javascript">
		alert("회원등록이 완료되지않았습니다.");
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