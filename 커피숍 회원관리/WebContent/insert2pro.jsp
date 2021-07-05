<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp" %>
<%
	try{
		sql="insert into coffee_tbl values(?,?,?)";
		ps=con.prepareStatement(sql);
		ps.setString(1, request.getParameter("PCODE"));
		ps.setString(2, request.getParameter("PNAME"));
		ps.setString(3, request.getParameter("PCOST"));
		ps.executeUpdate();
%>
	<script type="text/javascript">
		alert("커피등록이 완료되었습니다.");
		location="insert2.jsp";
	</script>
<%		
	}catch(Exception e){
%>
	<script type="text/javascript">
		alert("커피등록이 완료되지않았습니다.");
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